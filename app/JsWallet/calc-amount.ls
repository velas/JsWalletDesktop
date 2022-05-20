require! {
    \./math.ls : { times, minus, plus, div }
    \mobx : { toJS, transaction }
    \./api.ls : { calc-fee }
    \prelude-ls : { find }
    \./round5.ls
    \./round-number.ls
    \./contract-data.ls 
}
calc-crypto-generic = (name)-> (store, val)->
    return \0 if not val?
    { send } = store.current
    { wallet } = send
    { token } = send.coin
    rate = wallet?[name] ? 0
    (val `div` rate)
export calc-crypto-from-usd = calc-crypto-generic \usdRate
export calc-crypto-from-eur = calc-crypto-generic \eurRate
calc-fiat = (name)-> (store, amount-send)->
    return \0 if not amount-send?
    { send } = store.current
    { wallet } = send
    { token } = send.coin
    rate = wallet?[name] ? 0
    amount-send `times` rate
export calc-usd = calc-fiat \usdRate
export calc-eur = calc-fiat \eurRate
calc-fee-proxy = (input, cb)->
    err, fee <- calc-fee input
    console.error "fee err: #{err}" if err? 
    return cb err if err?
    cb null, fee 
#    fun = ->
#        calc-fee input, cb
#    calc-fee-proxy.timer = clear-timeout calc-fee-proxy.timer
#    calc-fee-proxy.timer = set-timeout fun, 500

export calc-fee-before-send = ({ store, query, fast }, cb)->
    { store, token, to, data, network, amount, fee-type, tx-type, account, swap } = query
    return cb "store isn`t defined"   if not store?
    return cb "network isn`t defined" if not network?
    return cb "amount isn`t defined"  if not amount?
    return cb "account isn`t defined" if not account?
    return cb "token isn`t defined" if not token? 
    { send } = store.current
    send.fee-calculating = yes
    calc-fee-fun = if fast then calc-fee else calc-fee-proxy
    gas-price = 
        | send?gas-price-type is \custom => (send?gas-price-custom-amount `times` (10^9))
        | _ => send.gas-price-auto
    
    err, result <- calc-fee-fun { store, token, to, data, network, amount, fee-type, tx-type, account, gas-price, swap }
    send.fee-calculating = no
    send.error = "#{err.message ? err}" if err?
    return cb "#{err.message ? err}" if err?
    #{ calced-fee, gas-price, gas-estimate } = result
    return cb null, result

change-amount-generic = (field)-> (store, amount-send, fast, cb)->
    send = store.current[field]
    /* Prevent call onChange twice */
    amount-buffer = store.current.send.amount-buffer
    { wallet } = send
    { token } = send.coin
    { wallets } = store.current.account
    fee-token = wallet.network.tx-fee-in ? send.coin.token ? \unknown
    fee-wallet =
        wallets |> find (-> it.coin?token is fee-token)
    #return if not send.wallet
    send.error = "Balance is not loaded" if not wallet?
    return cb "Balance is not loaded" if not wallet?
    decimalsConfig = send.network.decimals
    decimals = amountSend.toString!.split(".").1
    if decimals? and (decimals.length > decimalsConfig) then
        send.amount-send = round-number send.amount-send, {decimals: decimalsConfig}
        amount-send = send.amount-send
    if amount-send? then
        balance = +wallet.balance
        max-amount = Math.max 1e10, balance
        amountSend = max-amount if +amountSend > max-amount
        
    /* Update home bridge fee */
    store.current.send.homeFee = store.current.send.amount-send `times` (store.current.send.homeFeePercent `div` 100 )
    store.current.send.homeFeeUsd = store.current.send.homeFee `times` wallet.usdRate 
        
    result-amount-send = amount-send ? 0
    { fee-type, tx-type, fee-custom-amount } = store.current.send
    usd-rate = wallet?usd-rate ? 0
    fee-usd-rate = fee-wallet?usd-rate ? 0
    account = { wallet.address, wallet.private-key, wallet.balance }
    send.amount-send = amount-send ? ""
    send.value = result-amount-send `times` (10 ^ send.network.decimals)
    send.amount-obtain = result-amount-send
    send.amount-obtain-usd = send.amount-obtain `times` usd-rate
    send.amount-send-usd = calc-usd store, amount-send
    send.amount-send-eur = calc-eur store, amount-send
                
    dataBuilder = contract-data({ store })
    err <- dataBuilder.form-contract-data!
    
    send-to = 
        | store.current.send.isSwap is yes => store.current.send.contract-address
        | store.current.send.to.trim!.length is 0 => store.current.send.wallet.address
        | _ => store.current.send.to
    
    query = { store, token, to: send-to, send.data, send.network, amount: result-amount-send, fee-type, tx-type, account, send.swap, send.gas-price }
    err, result <- calc-fee-before-send { store, query, fast }
    console.error err if err?
    send.error = err if err?
    return send.amount-send-fee = 0 if err?
    #calced-fee = 0 if err?
    return cb err if err?
    if result?
        { calced-fee, gas-price, gas-estimate } = result
        if send.gas-price-type isnt \custom then
            send.gas-price-auto = gas-price
    send.gas-estimate = gas-estimate
    tx-fee =
        | fee-type is \custom => send.amount-send-fee
        | result?calced-fee? => result.calced-fee
        | send.network?tx-fee-options? => send.network.tx-fee-options[fee-type] ? send.network.tx-fee
        | _ => send.network.tx-fee
    send.amount-send-fee = tx-fee
    send.amount-send-fee-options[fee-type] = tx-fee
    send.amount-charged =
        | wallet.network.tx-fee-in? => send.amount-send
        | (result-amount-send ? "").length is 0 => tx-fee
        | result-amount-send is \0 => tx-fee
        | result-amount-send is 0 => tx-fee
        | fee-token isnt token => result-amount-send
        | _ => result-amount-send `plus` tx-fee
    send.amount-charged-usd =  send.amount-charged `times` usd-rate
    send.amount-send-fee-usd = tx-fee `times` fee-usd-rate
    amount-to-charge =
        | fee-token is token => wallet.balance `minus` result-amount-send `minus` send.amount-send-fee 
        | _ => wallet.balance `minus` result-amount-send     
    send.error =
        | wallet.balance is \... => "Balance is not yet loaded"
        | parse-float(amount-to-charge) < 0 => "Not Enough Funds"
        | _ => ""
    cb null
export change-amount-send = (store, amount-send, fast, cb)->
    send = store.current[\send]
    { wallet } = send
    { token } = send.coin
    { wallets } = store.current.account
    fee-token = wallet.network.tx-fee-in ? send.coin.token ? \unknown
    fee-wallet =
        wallets |> find (-> it.coin?token is fee-token)
    send.error = "Balance is not loaded" if not wallet?
    return cb "Balance is not loaded" if not wallet?
    decimalsConfig = send.network.decimals
    decimals = amountSend.toString!.split(".").1
    result-amount-send = amount-send ? 0
    if decimals? and (decimals.length > decimalsConfig) then
        send.amount-send = round-number result-amount-send, {decimals: decimalsConfig}
        amount-send = send.amount-send
    if amount-send? then
        balance = +wallet.balance
        max-amount = Math.max 1e10, balance
        amountSend = max-amount if +amountSend > max-amount
    send.amount-send = amountSend
    { fee-type, tx-type, fee-custom-amount } = store.current.send
    usd-rate = wallet?usd-rate ? 0
    fee-usd-rate = fee-wallet?usd-rate ? 0
    account = { wallet.address, wallet.private-key, wallet.balance }
    send.value = result-amount-send `times` (10 ^ send.network.decimals)
    send.amount-obtain = result-amount-send
    send.amount-obtain-usd = send.amount-obtain `times` usd-rate
    
    dataBuilder = contract-data({ store })
    err <- dataBuilder.form-contract-data!
    
    send-to = 
        | store.current.send.isSwap is yes => store.current.send.contract-address
        | store.current.send.to.trim!.length is 0 => store.current.send.wallet.address
        | _ => store.current.send.to
  
    query = { store, token, to: send-to, send.data, send.network, amount: result-amount-send, fee-type, tx-type, account, send.swap, send.gas-price }
    err, result <- calc-fee-before-send { store, query, fast }
    send.error = err if err?
    return cb err if err?
    if result?
        { calced-fee, gas-price, gas-estimate } = result
        if send.gas-price-type isnt \custom then
            send.gas-price-auto = gas-price
    send.gas-estimate = gas-estimate
    tx-fee =
        | fee-type is \custom => send.amount-send-fee
        | result?calced-fee? => result.calced-fee
        | send.network?tx-fee-options? => send.network.tx-fee-options[fee-type] ? send.network.tx-fee
        | _ => send.network.tx-fee
    
    /* If this is ERC20 Token (not Coin) then result send amount shoud not be minus fee */
    txFeeIn = wallet?network?txFeeIn
    minus-fee = 
        | txFeeIn? and txFeeIn isnt wallet?coin?token => 0
        | _ => tx-fee
        
    /* Update home bridge fee */
    store.current.send.homeFee = store.current.send.amount-send `times` (store.current.send.homeFeePercent `div` 100 )
    store.current.send.homeFeeUsd = store.current.send.homeFee `times` wallet.usdRate  
          
    result-amount-send = if (+amount-send > +tx-fee) then amount-send `minus` tx-fee else (amount-send ? 0)     
    send.amount-send = amount-send `minus` minus-fee if  +amount-send > +tx-fee    
    send.amount-send-usd = calc-usd store, send.amount-send
    send.amount-send-eur = calc-eur store, send.amount-send
    send.amount-send-fee = tx-fee
    send.amount-send-fee-options[fee-type] = tx-fee
    send.amount-charged =
        | wallet.network.tx-fee-in? => send.amount-send
        | (result-amount-send ? "").length is 0 => tx-fee
        | result-amount-send is \0 => tx-fee
        | result-amount-send is 0 => tx-fee
        | _ => result-amount-send `plus` tx-fee
    send.amount-charged-usd =  send.amount-charged `times` usd-rate
    send.amount-send-fee-usd = tx-fee `times` fee-usd-rate
    send.error =
        | wallet.balance is \... => "Balance is not yet loaded"
        | parse-float(wallet.balance `minus` result-amount-send `minus` send.amount-send-fee) < 0 => "Not Enough Funds"
        | _ => ""
    cb null
export change-amount-calc-fiat = (store, amount-send, fast, cb)->
    send = store.current[\send]
    { wallet } = send
    { token } = send.coin
    { wallets } = store.current.account
    fee-token = wallet.network.tx-fee-in ? send.coin.token ? \unknown
    fee-wallet =
        wallets |> find (-> it.coin?token is fee-token)
    #return if not send.wallet
    send.error = "Balance is not loaded" if not wallet?
    return cb "Balance is not loaded" if not wallet?
    decimalsConfig = send.network.decimals
    if amount-send? then
        balance = wallet.balance
        decimals = amountSend.toString!.split(".").1
        if decimals? and (decimals.length > decimalsConfig) then
            amountSend = round-number amountSend, {decimals: decimalsConfig}
    result-amount-send = amount-send ? 0
    { fee-type, tx-type, fee-custom-amount } = store.current.send
    usd-rate = wallet?usd-rate ? 0
    fee-usd-rate = fee-wallet?usd-rate ? 0
    account = { wallet.address, wallet.private-key, wallet.balance }
    send.amount-send = amount-send ? ""
    send.amount-send = amount-send ? ""
    send.value = result-amount-send `times` (10 ^ send.network.decimals)
    send.amount-obtain = result-amount-send
    send.amount-obtain-usd = send.amount-obtain `times` usd-rate   
    
    dataBuilder = contract-data({ store })
    err <- dataBuilder.form-contract-data!
    
    send-to = 
        | store.current.send.isSwap is yes => store.current.send.contract-address
        | store.current.send.to.trim!.length is 0 => store.current.send.wallet.address
        | _ => store.current.send.to
    
    query = { store, token, to: send-to, send.data, send.network, amount: result-amount-send, fee-type, tx-type, account, send.swap, send.gas-price }
    err, result <- calc-fee-before-send { store, query, fast }
    send.error = err if err?
    return cb err if err?
    if result?
        { calced-fee, gas-price, gas-estimate } = result
        if send.gas-price-type isnt \custom then
             send.gas-price-auto = gas-price
    send.gas-estimate = gas-estimate
    tx-fee =
        | fee-type is \custom => send.amount-send-fee
        | result?calced-fee? => result.calced-fee
        | send.network?tx-fee-options? => send.network.tx-fee-options[fee-type] ? send.network.tx-fee
        | _ => send.network.tx-fee
    send.amount-send-fee = tx-fee
    send.amount-send-fee-options[fee-type] = tx-fee
    send.amount-charged =
        | wallet.network.tx-fee-in? => send.amount-send
        | (result-amount-send ? "").length is 0 => tx-fee
        | result-amount-send is \0 => tx-fee
        | result-amount-send is 0 => tx-fee
        | _ => result-amount-send `plus` tx-fee
    send.amount-charged-usd =  send.amount-charged `times` usd-rate
    send.amount-send-fee-usd = tx-fee `times` fee-usd-rate
    send.error =
        | wallet.balance is \... => "Balance is not yet loaded"
        | parse-float(wallet.balance `minus` result-amount-send) < 0 => "Not Enough Funds"
        | _ => ""
    cb null
export change-amount-without-fee = (store, amount-send, fast, cb)->
    send = store.current[\send]
    { wallet } = send
    { token } = send.coin
    { wallets } = store.current.account
    fee-token = wallet.network.tx-fee-in ? send.coin.token ? \unknown
    fee-wallet =
        wallets |> find (-> it.coin?token is fee-token)
    send.error = "Balance is not loaded" if not wallet?
    return cb "Balance is not loaded" if not wallet?
    decimalsConfig = send.network.decimals
    decimals = amountSend.toString!.split(".").1
    if decimals? and (decimals.length > decimalsConfig) then
        send.amount-send = round-number send.amount-send, {decimals: decimalsConfig}
    if amount-send? then
        balance = +wallet.balance
        max-amount = Math.max 1e10, balance
        amountSend = max-amount if +amountSend > max-amount 
    result-amount-send = amount-send ? 0
    { fee-type, tx-type, fee-custom-amount } = store.current.send
    usd-rate = wallet?usd-rate ? 0
    fee-usd-rate = fee-wallet?usd-rate ? 0
    account = { wallet.address, wallet.private-key }
    send.amount-send = amount-send ? ""
    send.value = result-amount-send `times` (10 ^ send.network.decimals)
    send.amount-obtain = result-amount-send
    send.amount-obtain-usd = send.amount-obtain `times` usd-rate
    send.amount-send-usd = calc-usd store, amount-send
    send.amount-send-eur = calc-eur store, amount-send 
    tx-fee =
        | fee-type is \custom => send.amount-send-fee
        | send.amount-send-fee? => send.amount-send-fee
        | send.network?tx-fee-options? => send.network.tx-fee-options[fee-type] ? send.network.tx-fee
        | _ => send.network.tx-fee
    send.amount-send-fee = tx-fee
    send.amount-send-fee-options[fee-type] = tx-fee
    send.amount-charged =
        | wallet.network.tx-fee-in? => send.amount-send
        | (result-amount-send ? "").length is 0 => tx-fee
        | result-amount-send is \0 => tx-fee
        | result-amount-send is 0 => tx-fee
        | _ => result-amount-send `plus` tx-fee
    send.amount-charged-usd =  send.amount-charged `times` usd-rate
    send.amount-send-fee-usd = tx-fee `times` fee-usd-rate
    send.error =
        | wallet.balance is \... => "Balance is not yet loaded"
        | parse-float(wallet.balance `minus` result-amount-send `minus` send.amount-send-fee) < 0 => "Not Enough Funds"
        | _ => ""
    cb null
export change-amount = change-amount-generic \send
export change-amount-invoice = change-amount-generic \invoice