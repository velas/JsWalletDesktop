require! {
    \mobx : { toJS }
    \./math.ls : { times, minus, div, plus }
    \./api.ls : { create-transaction, push-tx }
    \./calc-amount.ls : { change-amount-calc-fiat, change-amount-send, change-amount, calc-crypto-from-eur, calc-crypto-from-usd, change-amount-without-fee }
    \./send-form.ls : { notify-form-result }
    \./get-name-mask.ls
    \./resolve-address.ls
    \./browser/window.ls
    \./navigate.ls
    \bignumber.js
    \./close.ls
    \./round.ls
    \./round5.ls
    \./round5edit.ls
    \./round-number.ls    
    \./topup.ls
    \./get-primary-info.ls
    \./pending-tx.ls : { create-pending-tx }
    \./transactions.ls : { rebuild-history }
    \prelude-ls : { map, find }
    \./web3.ls
    \./api.ls : { calc-fee }
    \./pages/confirmation.ls : { confirm }
    \./get-lang.ls
    \./apply-transactions.ls
    \./get-tx-details.ls
    \ethereumjs-util : {BN}
    \bs58
    \assert        
}
module.exports = (store, web3t)->
    return null if not store? or not web3t?
    lang = get-lang store
    { send-to } = web3t.naming
    { send } = store.current
    { wallet, fee-type } = send
    return null if not wallet?
    color = get-primary-info(store).color
    primary-button-style =
        background: color
    default-button-style = { color }
    send-tx = ({ to, wallet, network, amount-send, amount-send-fee, data, coin, tx-type, gas, gas-price, swap }, cb)->
        { token } = send.coin
        current-network = store.current.network
        #TODO: remove chain-id here and add rpc call into provider    
        is-erc20 = (['vlx_erc20', 'eth', 'etc', 'sprkl', 'vlx2'].index-of(token)) >= 0   
        chain-id = if current-network is \testnet and is-erc20 then 3 else 1   
        chosen-network = store.current.send.chosen-network
        receiver = store.current.send.contract-address ? to    
        recipient =
            | chosen-network? and chosen-network.id is \legacy => to-eth-address(receiver)     
            | _ => receiver
        tx-obj =
            account: { wallet.address, wallet.private-key, wallet.secret-key }
            recipient: recipient
            network: network
            token: token
            coin: coin
            amount: amount-send
            amount-fee: amount-send-fee
            data: data
            gas: gas
            gas-price: gas-price
            fee-type: fee-type
            swap: swap
        tx-obj <<<< { chain-id } if is-erc20 
        console.log "Prepared tx-obj" tx-obj
        err, tx-data <- create-transaction tx-obj
        return cb err if err?
        parts = get-tx-details store
        agree <- confirm store, parts.0
        return cb null if not agree
        err, tx <- push-tx { token, tx-type, network, ...tx-data }
        return cb err if err?
        err <- create-pending-tx { store, token, network, tx, amount-send, amount-send-fee, send.to, from: wallet.address }
        cb err, tx
    perform-send-safe = (cb)->
        err, to <- resolve-address { store, address: send.to, coin: send.coin, network: send.network }
        _coin = if send.coin.token is \vlx2 then \vlx else send.coin.token   
        err = "Address is not valid #{_coin} address" if err? and err.index-of "Invalid checksum"
        resolved =
            | err? => send.to
            | _ => to
        send.to = resolved
        send.error = err if err?
        return cb err if err?
        send-tx { wallet, ...send }, cb
    perform-send-unsafe = (cb)->
        send-tx { wallet, ...send }, cb
    check-enough = (cb)->
        try
            amount = wallet.balance `minus` send.amount-send `minus` (wallet.pending-sent ? 0) `minus` send.amount-send-fee
            return cb "Not Enough funds" if +amount < 0
            cb null
        catch err
            cb err
    send-money = ->
        return if wallet.balance is \...
        return if send.sending is yes
        err <- check-enough
        return send.error = "#{err.message ? err}" if err?
        send.sending = yes
        err, data <- perform-send-safe
        send.sending = no
        return send.error = "#{err.message ? err}" if err?
        # If cancel was pressed
        return null if not data?
        notify-form-result send.id, null, data
        store.current.last-tx-url = | send.network.api.linktx => send.network.api.linktx.replace \:hash, data
            | send.network.api.url => "#{send.network.api.url}/tx/#{data}"
        navigate store, web3t, \sent
        <- web3t.refresh
    send-escrow = ->
        name = send.to
        amount-ethers = send.amount-send
        err <- send-to { name, amount-ethers }
    execute-contract-data = (cb)->
        return cb null if not store.current.send.chosen-network?
        chosen-network = store.current.send.chosen-network
        token = store.current.send.coin.token
        if chosen-network.id in <[ evm legacy ]> and token in <[ vlx_evm vlx2 ]>   
            store.current.send.contractAddress = null 
            return cb null 
        wallet = store.current.send.wallet  
        contract-address = store.current.send.contract-address     
        data = ""
        network-type = store.current.network
        /* Swap from ERC20 to LEGACY (VLX) */    
        if token is \vlx_erc20 and chosen-network.id is \legacy
            console.log "Swap from ERC20 to LEGACY (VLX)" 
            send.swap = yes    
            value = store.current.send.amountSend
            send-to = web3t.velas.ForeignBridgeNativeToErc.address 
            value = to-hex (value `times` (10^18))
            token-address = web3t.velas.ERC20BridgeToken.address   
            network = wallet.network    
            #/*
            # * Get minPerTx from HomeBridge  (not Foreign?)  
            # */ 
            minPerTxRaw = web3t.velas.HomeBridgeNativeToErc.minPerTx!
            minPerTx = minPerTxRaw `div` (10 ^ network.decimals)
            console.log "home minPerTxRaw" minPerTxRaw     
            #/*
            # * Get maxPerTx from HomeBridge  (not Foreign?)  
            # */
            maxPerTxRaw = web3t.velas.HomeBridgeNativeToErc.maxPerTx!
            maxPerTx = maxPerTxRaw `div` (10 ^ network.decimals)
            console.log "Home maxPerTxRaw" maxPerTxRaw      
            homeFeeRaw = web3t.velas.ForeignBridgeNativeToErc.getHomeFee! 
            homeFee = homeFeeRaw `div` (10 ^ network.decimals)
            contract-home-fee = send.amountSend `times` homeFee
            minAmountPerTx = minPerTx `plus` contract-home-fee 
            console.log "minAmountPerTx" minAmountPerTx
            #
            if +send.amountSend < +(minAmountPerTx) then
                return cb "Min amount per transaction is #{minAmountPerTx} VLX"
            if +send.amountSend > +maxPerTx then
                return cb "Max amount per transaction is #{maxPerTx} VLX"  
            #    
            data = web3t.velas.ERC20BridgeToken.transferAndCall.get-data(send-to, value, to-eth-address(send.to))
            send.data = data
            send.contract-address = web3t.velas.ERC20BridgeToken.address  
            send.amount = 0
            send.amount-send = 0
        /* Swap from LEGACY (VLX) to ERC20 */ 
        if token is \vlx2 and chosen-network.id is \vlx_erc20 then 
            store.current.send.contract-address = chosen-network.HomeBridge    
            receiver = store.current.send.to 
            network = wallet.network    
            minPerTxRaw = web3t.velas.HomeBridgeNativeToErc.minPerTx!
            minPerTx = minPerTxRaw `div` (10 ^ network.decimals)
            maxPerTxRaw = web3t.velas.HomeBridgeNativeToErc.maxPerTx! 
            maxPerTx = maxPerTxRaw `div` (10 ^ network.decimals)    
            console.log "maxPerTxRaw" maxPerTxRaw
            homeFeeRaw = web3t.velas.HomeBridgeNativeToErc.getHomeFee! 
            homeFee = homeFeeRaw `div` (10 ^ network.decimals)
            console.log "relay tokens to receiver" receiver    
            data = web3t.velas.HomeBridgeNativeToErc.relayTokens.get-data(receiver)
            amount-to-send = send.amount-send-fee `plus` send.amount-send   
            contract-home-fee = send.amountSend `times` homeFee
            console.log "contract-home-fee" contract-home-fee    
            ONE_PERCENT = minPerTx `times` "0.01"    
            minAmountPerTx = minPerTx `plus` contract-home-fee `plus` ONE_PERCENT `plus` "2"    
            if +send.amountSend < +(minAmountPerTx) then
                return cb "Min amount per transaction is #{minAmountPerTx} VLX"
            if +send.amountSend > +maxPerTx then
                return cb "Max amount per transaction is #{maxPerTx} VLX" 
        /**
            * Swap into native */   
        if chosen-network.id is \native then
            console.log "Swap into native"
            $recipient = ""
            try
                $recipient = bs58.decode send.to
                hex = $recipient.toString('hex')
            catch err
                return cb "Please enter valid address"
            eth-address = \0x + hex
            data = web3t.velas.EvmToNativeBridge.transferToNative.get-data(eth-address)           
            store.current.send.contract-address = web3t.velas.EvmToNativeBridge.address
        send.data = data
        cb null   
    before-send-anyway = ->
        cb = console.log     
        err <- execute-contract-data!
        store.current.send.error = err if err?    
        return cb err if err?    
        send-money!  
    send-anyway = ->
        send-money!
    to-hex = ->
        new BN(it)  
    cancel = (event)->
        navigate store, web3t, \wallets
        notify-form-result send.id, "Cancelled by user"
    recipient-change = (event)!->
        _to = event.target.value
        send.to = _to    
        _to = _to.trim!
        err <- resolve-address { store, address: _to, coin: send.coin, network: send.network }
        return send.error = err if err? 
        send.error = '' 
    get-value = (event)-> 
        value = event.target?value     
        return null if not event.target?value      
        return \0 if event.target?value is ""    
        #value = event.target.value.match(/^[0-9]+([.]([0-9]+)?)?$/)?0
        #value2 =
            #| value?0 is \0 and value?1? and value?1 isnt \. => value.substr(1, value.length)
            #| _ => value
        value
    amount-change = (event)->
        value = get-value event
        # if empty string return zero!    
        value = "0" if not value? or isNaN(value)   
        <- change-amount store, value, no
    perform-amount-eur-change = (value)->
        to-send = calc-crypto-from-eur store, value
        <- change-amount store, to-send , no
    perform-amount-usd-change = (value)->
        to-send = calc-crypto-from-usd store, value
        <- change-amount-calc-fiat store, to-send, no
    amount-eur-change = (event)->
        value = get-value event
        send.amount-send-eur = value
        amount-eur-change.timer = clear-timeout amount-eur-change.timer
        amount-eur-change.timer = set-timeout (-> perform-amount-eur-change value), 500
    amount-usd-change = (event)->
        value = get-value event
        value = value ? 0 
        { wallets } = store.current.account
        { token } = store.current.send.coin
        wallet =
            wallets |> find (-> it.coin.token is token)
        { balance, usdRate } = wallet 
        send.amount-send-usd = value
        #return no if +value is 0    
        amount-usd-change.timer = clear-timeout amount-usd-change.timer
        amount-usd-change.timer = set-timeout (-> perform-amount-usd-change value), 500
    encode-decode = ->
        send.show-data-mode =
            | send.show-data-mode is \decoded => \encoded
            | _ => \decoded
    show-data = ->
        | send.show-data-mode is \decoded => send.decoded-data
        | _ => send.data
    show-label = ->
        if send.show-data-mode is \decoded then \encoded else \decoded
    when-empty = (str, def)->
        if (str ? "").length is 0 then def else str
    history = ->
        store.current.send-menu-open = no
        store.current.filter = {token: send.coin.token}
        apply-transactions store
        navigate store, web3t, \history
    export network =
        | store.current.network is \testnet => " (TESTNET) "
        | _ => ""
    export invoice = (wallet)->
        store.current.send-menu-open = no
        { coin, network } = store.current.send
        store.current.invoice <<<< { coin, wallet, network }
        navigate store, web3t, \invoice
    export token = send.coin.token.to-upper-case!
    export name = send.coin.name ? token
    fee-token = (wallet.network.tx-fee-in ? send.coin.token).to-upper-case!
    is-data = (send.data ? "").length > 0
    bridge-fee-token = wallet.network.txBridgeFeeIn
    choose-auto = ->
        return if has-send-error!  
        send.fee-type = \auto
        <- change-amount store, send.amount-send, no
    choose-cheap = ->
        send.fee-type = \cheap
        <- change-amount store, send.amount-send, no
    choose-custom = (amount)->
        return if has-send-error!    
        balance = send.wallet.balance
        amount-send-fee = send.amount-send-fee      
        send.fee-type = \custom
        max-amount = Math.max 1e8, balance
        send.amount-send-fee = send.fee-custom-amount = amount
        <- change-amount store, send.amount-send, no
    chosen-cheap = if send.fee-type is \cheap then \chosen else ""
    chosen-auto  = if send.fee-type is \auto then \chosen else ""
    chosen-custom  = if send.fee-type is \custom then \chosen else ""
    send-options = send.coin.tx-types ? []
    pending = wallet.pending-sent + ' ' + token
    calc-amount-and-fee = (amount-send, trials, cb)->
        return cb "Cannot estimate max amount. Please try to type manually" if trials <= 0
        return cb "Balance is not enough to send tx" if +amount-send is 0
        account = { wallet.address, wallet.private-key }
        err, amount-send-fee <- calc-fee { token, send.network, amount: amount-send, send.fee-type, send.tx-type, send.to, send.data, account }
        if send.fee-type is \custom
            amount-send-fee = send.amount-send-fee
        return cb null, { amount-send, amount-send-fee } if not err?
        return cb err if err? and err isnt "Balance is not enough to send tx"
        return cb "Fee cannot be calculated" if not amount-send-fee?
        cb null 
    flag = no   
    use-max = (cb)!->
        min-fee = send.wallet.network.txFeeOptions.cheap       
        amount-send = wallet.balance `minus` (wallet.pending-sent ? 0)
        amount-send = amount-send `minus` min-fee if not flag 
        amount-send = 0 if amount-send < 0 
        flag = yes   
        <- change-amount-send store, amount-send, no
    use-max-try-catch = (cb)->
        try
            use-max cb
        catch err
            cb err
    export use-max-amount = ->
        err <- use-max-try-catch
        alert "#{err}" if err?
    export has-send-error = ->  
        error = store.current.send.error.toString!
        error? and error.length > 0 and error.toLowerCase! isnt "not enough funds"    
    export change-amount
    export send
    export wallet
    export pending
    export fee-token
    export bridge-fee-token    
    export primary-button-style
    export recipient-change
    export amount-change
    export amount-usd-change
    export amount-eur-change
    export show-data
    export show-label
    export topup : topup(store)
    export history
    export cancel
    export send-anyway
    export before-send-anyway    
    export choose-auto
    export choose-cheap
    export choose-custom
    export chosen-auto
    export chosen-cheap
    export chosen-custom
    export default-button-style
    export round5edit
    export round5
    export send-options
    export calc-amount-and-fee
    export is-data
    export encode-decode
    out$