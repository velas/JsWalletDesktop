require! {
    \moment
    \prelude-ls : { map, foldl, any, each, find, sum, filter, head, values, join, reverse, uniqueBy }
    \./superagent.js : { get, post }
    \../math.js : { plus, minus, div, times }
    \./deps.js : { BitcoinLib, bip39 }
    \../json-parse.js
    \../deadline.js
    \bs58 : { decode }
    \bignumber.js    
    #\multicoin-address-validator : \WAValidator  
    \../embed_modules/bitcoin-address-validation : \validate    
}
segwit-address = (public-key)->
    witnessScript = BitcoinLib.script.witnessPubKeyHash.output.encode(BitcoinLib.crypto.hash160(public-key))
    scriptPubKey = BitcoinLib.script.scriptHash.output.encode(BitcoinLib.crypto.hash160(witnessScript))
    BitcoinLib.address.fromOutputScript(scriptPubKey)
segwit-address2 = (public-key)->
    scriptPubKey = BitcoinLib.script.witnessPubKeyHash.output.encode(BitcoinLib.crypto.hash160(public-key))
    BitcoinLib.address.fromOutputScript(scriptPubKey)
get-bitcoin-fullpair-by-index = (mnemonic, index, network)->
    #console.log \get-bitcoin-fullpair-by-index , mnemonic, index, network
    seed = bip39.mnemonic-to-seed-hex mnemonic
    hdnode = BitcoinLib.HDNode.from-seed-hex(seed, network).derive(index)
    address = hdnode.get-address!
    private-key = hdnode.key-pair.toWIF!
    public-key = hdnode.get-public-key-buffer!.to-string(\hex)
    #p2wpkh = BitcoinLib.payments.p2wpkh({ pubkey: public-key })
    #p2wpkh-address = p2wpkh.address
    #console.log p2wpkh-address, address
    address2  = segwit-address public-key
    address3 = segwit-address2 public-key
    { address, private-key, public-key, address2, address3 }
#0.25m + 0.05m * numberOfInputs
#private send https://github.com/DeltaEngine/MyDashWallet/blob/master/Node/DashNode.cs#L18
#https://github.com/StaminaDev/dash-insight-api/blob/master/lib/index.js#L244
find-max = (first, current)->
    if current.rank < first.rank then current else first
get-enough = ([output, ...outputs], amount, you-have, cb)->
    return cb "Not Enough Funds (Unspent Outputs). You have #{you-have}" if not output?
    return cb "Expected output amount, got #{output.amount}" if not output.amount?
    output-amount = output.amount ? 0
    next-amount = amount `minus` output-amount
    return cb null, [output] if +next-amount <= 0
    you-have-next = you-have `plus` output-amount
    err, other <- get-enough outputs, next-amount, you-have-next
    return cb err if err?
    current =
        | +output-amount is 0 => []
        | _ => [output]
    all = current ++ other
    cb null, all
calc-fee-per-byte = (config, cb)->
    { network, fee-type, account } = config
    o = network?tx-fee-options
    tx-fee = o?[fee-type] ? network.tx-fee ? 0
    return cb null, tx-fee if fee-type isnt \auto
    fee-type = \cheap
    amount-fee = o.cheap
    recipient = config.account.address
    #console.log { config.amount, amount-fee }
    err, data <- create-transaction { fee-type, amount-fee , recipient, ...config }
    return cb null, o.cheap if "#{err}".index-of("Not Enough Funds (Unspent Outputs)") > -1
    return cb err, o.cheap if err?
    return cb "raw-tx is expected" if typeof! data.raw-tx isnt \String
    #bytes = decode(data.raw-tx).to-string(\hex).length / 2
    bytes = (new bignumber(data.raw-tx.length)) `div` 1
    infelicity = 1
    err, data <- get "#{get-api-url network}/fee/6" .timeout { deadline } .end
    vals = if data? and not err? then values data.body else [0.0024295] 
    calced-fee-per-kb = 
        | vals.0 is -1 => network.tx-fee
        | _ => vals.0 
    fee-per-byte = calced-fee-per-kb `div` (new bignumber(1000))
    calc-fee = (bytes `plus` infelicity) `times` fee-per-byte
    calc-fee = new bignumber(calc-fee).to-fixed(network.decimals)   
    final-price =
        | calc-fee > +o.cheap => calc-fee
        | _ => o.cheap
    cb null, final-price
calc-dynamic-fee = ({ network, tx, tx-type, account, fee-type }, cb)->
    o = network?tx-fee-options
    tx-fee = o?[fee-type] ? network.tx-fee ? 0
    return cb null, tx-fee if fee-type isnt \auto
    network = global.store?.current?.network || \mainnet
    err, data <- get "#{get-api-url network}/fee/6" .timeout { deadline: 5000 } .end
    return cb err if err?
    vals = values data.body
    exists = vals.0 ? -1
    calced-fee =
        | vals.0 is -1 => network.tx-fee
        | _ => vals.0
    cb null, calced-fee
get-calc-fee-func = (network)->
    | network?tx-fee-auto-mode is \per-byte => calc-fee-per-byte
    | _ => calc-dynamic-fee
calc-fee-private = (config, cb)->
    { network, tx, tx-type, account, fee-type } = config
    return cb "address cannot be empty" if (account?address ? "") is ""
    o = network?tx-fee-options
    calc-fee = get-calc-fee-func network
    err, tx-fee <- calc-fee config
    return cb err if err?
    err, outputs <- get-outputs { network, account.address }
    return cb err if err?
    number-of-inputs = if outputs.length > 0 then outputs.length else 1
    return cb "private-per-input is missing" if not o.private-per-input?
    fee =
        (tx-fee `times` 2) `plus` (number-of-inputs `times` o.private-per-input)
    cb null, fee
calc-fee-instantx = ({ network, tx, tx-type, account, fee-type }, cb)->
    return cb "address cannot be empty" if (account?address ? "") is ""
    o = network?tx-fee-options
    calc-fee = get-calc-fee-func network
    err, tx-fee <- calc-fee { network, tx, tx-type, account, fee-type }
    return cb err if err?
    err, outputs <- get-outputs { network, account.address }
    return cb err if err?
    number-of-inputs = if outputs.length > 0 then outputs.length else 1
    return cb "instant-per-input is missing" if not o.instant-per-input?
    fee =
        (number-of-inputs `times` o.instant-per-input)
    cb null, fee
export calc-fee = (config, cb)->
    { network, tx, tx-type, account } = config
    return calc-fee-private config, cb if tx-type is \private
    return calc-fee-instantx config, cb if tx-type is \instant
    calc-fee = get-calc-fee-func network
    calc-fee config, cb
export get-keys = ({ network, mnemonic, index }, cb)->
    result = get-bitcoin-fullpair-by-index mnemonic, index, network
    cb null, result
extend = (add, json)--> json <<< add
get-dec = (network)->
    { decimals } = network
    10^decimals
add-amount = (network, it)-->
    dec = get-dec network
    it.amount =
        | it.value? => it.value `div` dec
        | _ => 0
#DEBUG
#mock = [{"address":"GbyU4HML1rX8gcdVB2dNfE4RszCwKFYuuv","txid":"2b598e790c06e106709ea230b4553e9b867f234aa6e84ad700f81efe68bb563e","vout":0,"scriptPubKey":"76a914c6df968d5d5e5103290559629f966c5efe6cfbfb88ac","amount":1,"satoshis":100000000,"height":275994,"confirmations":598},{"address":"GbyU4HML1rX8gcdVB2dNfE4RszCwKFYuuv","txid":"e815481a072b33390e0a2dad5df7ff1726c39d3542558e933f0aa475613c4145","vout":0,"scriptPubKey":"76a914c6df968d5d5e5103290559629f966c5efe6cfbfb88ac","amount":1,"satoshis":100000000,"height":275988,"confirmations":604},{"address":"GbyU4HML1rX8gcdVB2dNfE4RszCwKFYuuv","txid":"f9897905e569aed3067c532d5a1e11bd018a4b60231caf62c66db4e7ec9234c5","vout":1,"scriptPubKey":"76a914c6df968d5d5e5103290559629f966c5efe6cfbfb88ac","amount":0.00001,"satoshis":1000,"height":275987,"confirmations":605}]
get-outputs = ({ network, address} , cb)-->
    { url } = network.api
    err, data <- get "#{get-api-url network}/address/#{address}/?unspent=true" .timeout { deadline: 5000 } .end
    return cb "cannot get outputs - err #{err.message ? err}" if err?
    #mock
    data.body
        |> each add-amount network
        |> filter (.value?)
        |> map extend { network, address}
        |> -> cb null, it
parse-rate-string = (usd-info)->
    [_, url, extract] = usd-info.match(/url\(([^)]+)\)(.+)?/)
    { url, extract }
extract-val = (data, [head, ...tail])->
    return data if not head?
    extract-val data[head], tail
parse-result = (text, extract, cb)->
    return cb null, text if (extract ? "") is ""
    err, model <- json-parse text
    return cb err if err?
    result = extract-val model, extract
    cb null, result
get-deposit-address-info = ({ amount, recipient, network }, cb)->
    { mixing-info } = network?api ? {}
    return cb "Mixing Pool is not connected" if typeof! mixing-info isnt \String
    { url, extract } = parse-rate-string mixing-info
    err, data <- get url .end
    return cb "cannot get deposit info - err: #{err.message ? err}" if err?
    cb null, parse-result(data.text, extract)
get-deposit-address-from-list = ({ amount, recipient, network },cb)->
    err, list <- get-masternode-list { network }
    return cb err if err?
    #console.log err, list
    cb "Not Implemented"
get-deposit-address = ({ amount, recipient, network }, cb)->
    { mixing-info } = network?api ? {}
    return get-deposit-address-info { amount, recipient, network }, cb if typeof! mixing-info is \String
    get-deposit-address-from-list { amount, recipient, network }, cb
add-outputs-private = (config, cb)->
    { tx-type, total, value, fee, tx, recipient, network, account } = config
    #return add-outputs-private config, cb if tx-type is \private
    return cb "fee, value, total are required" if not fee? or not value? or not total?
    o = network?tx-fee-options
    rest = total `minus` value `minus` fee
    fee2 = o?[fee-type] ? network.tx-fee ? 0
    amount = value `plus` fee `minus` fee2
    err, address <- get-deposit-address { recipient, amount, network }
    return cb err if err?
    tx.add-output address, +value
    if +rest isnt 0
        tx.add-output account.address, +rest
    cb null
add-outputs = (config, cb)->
    { tx-type, total, value, fee, tx, recipient, account } = config
    return cb "fee, value, total are required" if not fee? or not value? or not total?
    return add-outputs-private config, cb if tx-type is \private
    try  
        rest = total `minus` value `minus` fee
        tx.add-output recipient, +value
        if +rest isnt 0
            tx.add-output account.address, +rest
        cb null
    catch err
        console.error err    
        return cb err    
#recipient
get-error = (config, fields)->
    result =
        fields
            |> filter -> not config[it]?
            |> map -> "#{it} is required field"
            |> join ", "
    return null if result is ""
    result
export create-transaction = (config, cb)->
    err = get-error config, <[ network account amount amountFee recipient ]>
    return cb err if err?
    { network, account, recipient, amount, amount-fee, fee-type, tx-type} = config
    err, outputs <- get-outputs { network, account.address }
    return cb err if err?
    amount-with-fee = amount `plus` amount-fee
    err, outputs <- get-enough outputs, amount-with-fee, 0
    return cb err if err?
    is-no-value =
        outputs |> find (-> !it.value?)
    return cb 'Each output should have a value' if is-no-value
    dec = get-dec network
    value = amount `times` dec
    fee = amount-fee `times` dec
    total =
        outputs
            |> map (.value)
            |> sum
    #console.log { total, fee, value, outputs }
    return cb "Balance is not enough to send tx" if +((total `minus` fee) `minus` value) < 0
    return cb 'Total is NaN' if isNaN total
    tx = new BitcoinLib.TransactionBuilder network
    err <- add-outputs { tx-type, total, value, fee, tx, recipient, network, account }
    return cb err if err?
    apply = (output, i)->
        tx.add-input output.mint-txid, output.mint-index
    sign = (output, i)->
        key = BitcoinLib.ECPair.fromWIF(account.private-key, network)
        tx.sign i, key
    outputs.for-each apply
    outputs.for-each sign
    raw-tx = tx.build!.to-hex!
    cb null, { raw-tx }
export push-tx = ({ network, raw-tx, tx-type } , cb)-->
    send-type =
        | tx-type is \instant => \sendix
        | _ => \send
    err, res <- post "#{get-api-url network}/tx/#{send-type}", { raw-tx } .end
    return cb "#{err}: #{res?text}" if err?
    return cb "Error: #{res?error}" if res?error
    return cb "Error: #{res?text}" if not res?body?txid?
    cb null, res.body?txid
export get-total-received = ({ address, network }, cb)->
    return cb "Url is not defined" if not network?api?url?
    err, data <- get "#{get-api-url network}/address/#{address}/totalReceived" .timeout { deadline: 5000 } .end
    return cb err if err? or data.text.length is 0
    dec = get-dec network
    num = data.text `div` dec
    cb null, num
export get-unconfirmed-balance = ({ network, address} , cb)->
    return cb "Url is not defined" if not network?api?url?
    err, data <- get "#{get-api-url network}/address/#{address}/unconfirmedBalance" .timeout { deadline: 5000 } .end
    return cb err if err? or data.text.length is 0
    try
        json = JSON.parse(data.text)
        dec = get-dec network
        num = json.unconfirmed `div` dec
        return cb null, num
    catch e
        return cb e.message
    dec = get-dec network
    num = data.text `div` dec
    cb null, num
export get-balance = ({ address, network } , cb)->
    return cb "Url is not defined" if not network?api?url?
    err, data <- get "#{get-api-url network}/address/#{address}/balance" .timeout { deadline: 5000 } .end
    console.log "#{get-api-url network}/address/#{address}/balance"
    return cb err if err? or data.text.length is 0
    #check that data.text has number
    try
        json = JSON.parse(data.text)
        dec = get-dec network
        #num = (json.confirmed `minus` json.unconfirmed ) `div` dec
        num = json.confirmed `div` dec
        return cb null, num
    catch e
        return cb e.message 
transform-in = ({ net, address }, t)->
    #tr = BitcoinLib.Transaction.fromHex(t.script)  
    tx = t.mintTxid
    pending = t.confirmations is 0
    dec = get-dec net
    amount = t.value `div` dec
    from = address
    to = t.address
    url = | net.api.linktx => net.api.linktx.replace \:hash, tx
        | net.api.url => "#{net.api.url}/tx/#{data}"
    #console.log(\insight-in, t)
    { tx, amount, url, to, from, pending, time: t.time, fee: t.fee, type: t.type  }
transform-out = ({ net, address }, t)->
    tx = t.mintTxid
    time = t.time
    pending = t.confirmations is 0
    dec = get-dec net
    amount = t.value `div` dec
    to = t.address
    from = address
    url = | net.api.linktx => net.api.linktx.replace \:hash, tx
        | net.api.url => "#{net.api.url}/tx/#{data}"
    #console.log(\insight-out, t)
    { tx, amount, url, to, pending, from, time: t.time, fee: t.fee, type: t.type }
transform-tx = (config, t)-->
    self-sender = t.address is config.address
    type = 
        |  t.address isnt config.address => "OUT"
        |  _ => "IN" 
    t.type = type   
    return transform-in config, t if not self-sender    
    transform-out config, t
get-api-url = (network)->
    api-name = network.api.api-name ? \api
    network-name = network.api.network-name ? \mainnet
    "#{network.api.url}/#{api-name}/BTC/#{network-name}"
export check-tx-status = ({ network, tx }, cb)->
    cb "Not Implemented"
export get-transactions = ({ network, address}, cb)->
    return cb "Url is not defined" if not network?api?url?
    err, data <- get "#{get-api-url network}/address/#{address}/txs?limit=100" .timeout { deadline: 5000 } .end
    return cb err if err?
    err, result <- json-parse data.text 
    return cb err if err?
    _result = result |> uniqueBy (-> it.mintTxid) |> reverse     
    err, all-txs <- prepare-raw-txs {txs: _result, network, address}
    return cb err if err?   
    return cb "Unexpected result" if typeof! all-txs isnt \Array
    txs =
        all-txs
            |> map transform-tx { net: network, address }
            |> filter (?)                
    cb null, txs
prepare-raw-txs = ({ txs, network, address }, cb)->
    err, result <- prepare-txs network, txs, address
    return cb err if err? 
    cb null, result
get-receiver = (account-address, sender, outputs)->
    if account-address isnt sender
        return account-address
    found = outputs |> find (-> it.address? and it.address isnt "false" and it.address isnt account-address)
    receiver =
        | found? => found.address
        | _ => sender
get-value = (outputs, receiver)->
    receiver-data = outputs |> find (-> it.address is receiver)
    receiver-data?value ? 0
prepare-txs = (network, [tx, ...rest], address, cb)->
    return cb null, [] if not tx?
    { mintTxid } = tx
    err, _coins <- get "#{get-api-url network}/tx/#{mintTxid}/coins" .timeout { deadline: 15000 } .end
    console.error "prepare-txs Error: " + err if err?
    return cb null, [] if err?
    err, result <- json-parse _coins.text
    return cb err if err?
    {inputs, outputs} = result
    sender = inputs[0].address
    receiver = get-receiver(address, sender, outputs)
    value = get-value(outputs, receiver)
    err, data <- get "#{get-api-url network}/tx/#{mintTxid}" .timeout { deadline: 15000 } .end
    console.error "prepare-txs Error: " + err if err?
    return cb null, [] if err?
    err, result <- json-parse data.text
    return cb err if err? 
    { blockTime, txid, fee, confirmations, chain,  _id } = result 
    time = moment(blockTime).format("X")
    dec = get-dec network 
    _tx = {
        address: receiver
        value
        fee: fee `div` dec 
        chain
        network: result.network     
        time   
        confirmations
        _id 
        coinbase: no
        mintTxid: txid,    
    }
    t = if _tx? then [_tx] else []
    err, other <- prepare-txs network, rest, address
    return cb err if err?
    all =  t ++ other    
    cb null, all   
export isValidAddress = ({ address, network }, cb)-> 
    #addressIsValid = WAValidator.validate(address, 'BTC', 'both')   
    addressIsValid = validate(address)   
    return cb "Address is not valid" if not addressIsValid   
    return cb null, address
export get-transaction-info = (config, cb)->
    { network, tx } = config
    url = "#{get-api-url network}/tx/:hash".replace \:hash, tx
    err, data <- get url .timeout { deadline: 15000 } .end  
    return cb err if err?
    err, result <- json-parse data.text
    return cb err if err? 
    { blockTime, txid, fee, confirmations, chain,  _id } = result
    status =
        | +confirmations > 0 => \confirmed
        | tx.status is \0x1 => \reverted
        | _ => \pending
    result = { status, info: tx }
    cb null, result