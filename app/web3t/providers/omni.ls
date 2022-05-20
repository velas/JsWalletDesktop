require! {
    \bip32
    \qs : { stringify }
    \prelude-ls : { filter, map, foldl, each, find, sum, values }
    \../math.js : { plus, minus, times, div, $toHex }
    \./superagent.js : { get, post }
    \../json-parse.js
    \../deadline.js
    \./deps.js : { BitcoinLib, bip39 }
    #\multicoin-address-validator : \WAValidator
    \../embed_modules/bitcoin-address-validation : \validate
}
get-bitcoin-fullpair-by-index = (mnemonic, index, network)->
    seed = bip39.mnemonic-to-seed mnemonic
    hdnode = bip32.from-seed(seed, network).derive(index)
    address = BitcoinLib.payments.p2pkh({ pubkey: hdnode.publicKey, network }).address
    private-key = hdnode.toWIF!
    public-key = hdnode.public-key.to-string(\hex)
    { address, private-key, public-key }
# https://api.omniexplorer.info/#request-v1-address-addr
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
    #console.log { err }
    return cb err, o.cheap if err?
    return cb "rawtx is expected" if typeof! data.rawtx isnt \String
    #console.log data.rawtx
    #bytes = decode(data.raw-tx).to-string(\hex).length / 2
    bytes = data.rawtx.length / 2
    infelicity = 1
    calc-fee = (bytes + infelicity) `times` o.fee-per-byte
    final-price =
        | calc-fee > +o.cheap => calc-fee
        | _ => o.cheap
    cb null, final-price
calc-dynamic-fee = ({ network, tx, tx-type, account, fee-type }, cb)->
    o = network?tx-fee-options
    tx-fee = o?[fee-type] ? network.tx-fee ? 0
    return cb null, tx-fee if fee-type isnt \auto
    network-name = global.store?.current?.network || \mainnet
    err, data <- get "#{get-api-url network}/fee/6" .timeout { deadline } .end
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
    err, fee <- calc-fee config
    return cb err if err?    
    cb null, { calced-fee: fee }
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
extend-num = (str, fixed)->
    return str if str.length >= fixed
    extend-num "0#{str}", fixed
extend = (add, json)--> json <<< add
to-hex = (num, fixed)->
    n = (+num).to-string 16
    extend-num n, fixed
get-api-url = (network)->
    api-name = network.api.api-name ? \api
    network-name = global.store?.current?.network || \mainnet
    "#{network.api.api-url-btc}/#{api-name}/BTC/#{network-name}"
get-outputs = ({ network, address} , cb)-->
    { url } = network.api
    err, data <- get "#{get-api-url network}/address/#{address}/?unspent=true" .timeout { deadline } .end
    return cb "cannot get outputs - err #{err.message ? err}" if err?
    #mock
    data.body
        |> each add-amount network
        |> filter (.value?)
        |> map extend { network, address}
        |> -> cb null, it
add-value = (network, it)-->
    dec = get-dec network
    it.value =
        | it.satoshis? => it.satoshis
        | it.amount? => it.amount `times` dec
        | _ => 0
add-outputs = (config, cb)->
    { tx-type, total, value, fee, tx, recipient, account } = config
    return cb "fee, value, total are required" if not fee? or not value? or not total?
    return add-outputs-private config, cb if tx-type is \private
    rest = total `minus` value `minus` fee
    tx.add-output recipient, +value
    #console.log { rest }
    if +rest isnt 0
        tx.add-output account.address, +rest
    cb null
export create-transaction = ({ network, account, recipient, amount, amount-fee, fee-type, tx-type, spender }, cb)->
    err, outputs <- get-outputs { network, account.address }
    return cb err if err?
    return cb 'Not Enough Funds (Unspent Outputs)' if outputs.length is 0
    is-no-value =
        outputs |> find (-> !it.value?)
    return cb 'Each output should have a value' if is-no-value
    dec = get-dec network
    value = amount `times` dec
    fee = amount-fee `times` dec
    dust = 546
    total =
        outputs
            |> map (.value)
            |> sum
    return cb 'Total is NaN' if isNaN total
    return cb "Balance is not enough to send tx" if +(total `minus` fee) <= 0
    err, omni-balance <- get-balance { network, account.address }
    return cb err if err?
    return cb "Balance is not enough to send this amount" if +omni-balance < +amount
    tx = new BitcoinLib.TransactionBuilder network
    simple_send =
        * "6f6d6e69" # omni
        * to-hex 0, 4
        * to-hex network.propertyid, 12
        * to-hex value, 16
    data = Buffer.from simple_send.join(''), \hex
    omni-output = BitcoinLib.script.compile [BitcoinLib.opcodes.OP_RETURN, data]
    rest = total `minus` fee `plus` dust
    tx.add-output recipient, dust
    tx.add-output omni-output, 0
    if +rest isnt 0
        tx.add-output account.address, +rest
    apply = (output, i)->
        tx.add-input output.mint-txid, output.mint-index
    sign = (output, i)->
        key = BitcoinLib.ECPair.fromWIF account.private-key, network
        tx.sign i, key
    outputs.for-each apply
    outputs.for-each sign
    rawtx = tx.build!.to-hex!
    cb null, { rawtx }
transform-tx = ({ network, address }, t)-->
    { url } = network.api
    network = \usdt
    dec = get-dec network
    tx = t.txid
    amount = t.amount
    time = t.blocktime
    url = "#{url}/tx/#{tx}"
    fee = t.fee
    from =  t.sendingaddress
    to = t.referenceaddress
    #console.log { t }
    { network, tx, amount, fee, time, url, from, to }
export get-transactions = ({ network, address }, cb)->
    { api-url } = network.api
    req =
        addr : address
    err, data <- post("#{api-url}/v1/address/addr/details/", req).type('form').end
    return cb err if err?
    return cb "expected object" if typeof! data isnt \Object
    return cb "expected array" if typeof! data.body?transactions isnt \Array
    txs =
        data.body.transactions
            |> filter (-> +it.propertyid is +network.propertyid)
            |> map transform-tx { network, address }
    cb null, txs
get-dec = (network)->
    { decimals } = network
    10^decimals
export check-decoded-data = (decoded-data, data)->
    cb null, ''
export push-tx = ({ network, rawtx } , cb)-->
    err, res <- post "#{get-api-url network}/tx/send", { raw-tx: rawtx } .end
    return cb err if err?
    cb null, res.body?txid
#export push-tx = ({ network, rawtx } , cb)-->
#    { api-url } = network.api
#    req =
#        signed-transaction : rawtx
#    err, data <- post("#{api-url}/v1/transaction/pushtx/", req).type('form').end
#    return cb err if err?
#    return cb "expected object" if typeof! data isnt \Object
#    return cb "status isnt OK" if data.body.status isnt \ok
#    return cb "not pushed" if data.body.pushed isnt \Success
#    cb null, data.body.tx
export check-tx-status = ({ network, tx }, cb)->
    cb "Not Implemented"
str = -> (it ? "").to-string!
export get-total-received = ({ address, network }, cb)->
    err, txs <- get-transactions { address, network }
    total =
        txs |> filter (-> it.to is address)
            |> map (.amount)
            |> foldl plus, 0
    cb null, total
export get-unconfirmed-balance = ({ network, address} , cb)->
    cb "Not Implemented"
get-data = (data, cb)->
    #return cb null, data.body if typeof! data.body is \Object
    try
        res = JSON.parse data.text
        cb null, res
    catch err
        cb err
export get-balance = ({ network, address} , cb)->
    { api-url } = network.api
    req =
        addr : address
    err, data <- post("#{api-url}/v1/address/addr/", req).type('form').end
    return cb err if err?
    err, body <- get-data data
    return cb err if err?
    return cb "expected balance array. got #{data.text}" if typeof! body?balance isnt \Array
    balance =
        data.body.balance |> find (-> str(it.id) is str(network.propertyid) )
    return cb null, 0 if not balance?
    dec = get-dec network
    value = balance.value `div` dec
    cb null, value
export isValidAddress = ({ address, network }, cb)->
    #addressIsValid = WAValidator.validate(address, 'BTC', 'both')
    addressIsValid = validate(address)
    return cb "Address is not valid" if not addressIsValid
    return cb null, address

export get-market-history-prices = (config, cb)->
    { network, coin } = config
    {market} = coin
    err, resp <- get market .timeout { deadline } .end
    return cb "cannot execute query - err #{err.message ? err }" if err?
    err, result <- json-parse resp.text
    return cb err if err?
    cb null, result
