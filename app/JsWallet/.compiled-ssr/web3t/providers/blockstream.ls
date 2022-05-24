require! {
    \moment
    \prelude-ls : { map, foldl, any, each, find, sum, filter, head, values, join }
    \./superagent.js : { get, post }
    \../math.js : { plus, minus, div, times }
    \./deps.js : { BitcoinLib, bip39 }
    \../json-parse.js
    \../deadline.js
    \bs58 : { decode }
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
    # address2  = segwit-address public-key
    # address3 = segwit-address2 public-key
    { address, private-key, public-key }
find-max = (first, current)->
    if current.rank < first.rank then current else first
get-enough = ([output, ...outputs], amount, you-have, cb)->
    return cb "Not Enough Funds (Unspent Outputs). You have #{you-have}" if not output?
    return cb "Expected output value, got #{output.value}" if not output.value?
    output-amount = (output.value ? 0) `div` get-dec output.network
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
    { network, tx, tx-type, account, fee-type, account, to } = config
    o = network?tx-fee-options
    tx-fee = o?[fee-type] ? network.tx-fee ? 0
    return cb null, tx-fee if fee-type isnt \auto
    err, data <- get "#{get-api-url network}/fee-estimates" .timeout { deadline } .end
    return cb err if err?
    fee-per-byte = data.body[6]
    err, data <- create-transaction { fee-type, amount-fee: 0, recipient: to || account.address, ...config }
    return cb null, o?cheap if "#{err}".index-of("Not Enough Funds (Unspent Outputs)") > -1
    #console.log { err }
    return cb err, o?cheap if err?
    return cb "rawtx is expected" if typeof! data.rawtx isnt \String
    #console.log data.rawtx
    #bytes = decode(data.rawtx).to-string(\hex).length / 2
    bytes = data.rawtx.length / 2
    infelicity = 1
    calc-fee = (bytes + infelicity) `times` fee-per-byte
    cb null, calc-fee `div` get-dec network
calc-dynamic-fee = ({ network, tx, tx-type, account, fee-type }, cb)->
    o = network?tx-fee-options
    tx-fee = o?[fee-type] ? network.tx-fee ? 0
    return cb null, tx-fee if fee-type isnt \auto
    err, data <- get "#{get-api-url network}/fee-estimates" .timeout { deadline } .end
    return cb err if err?
    val = data.body[6]
    exists = val ? -1
    calced-fee =
        | val is -1 => network.tx-fee
        | _ => val `div` get-dec network
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
#DEBUG
#mock = [{"address":"GbyU4HML1rX8gcdVB2dNfE4RszCwKFYuuv","txid":"2b598e790c06e106709ea230b4553e9b867f234aa6e84ad700f81efe68bb563e","vout":0,"scriptPubKey":"76a914c6df968d5d5e5103290559629f966c5efe6cfbfb88ac","amount":1,"satoshis":100000000,"height":275994,"confirmations":598},{"address":"GbyU4HML1rX8gcdVB2dNfE4RszCwKFYuuv","txid":"e815481a072b33390e0a2dad5df7ff1726c39d3542558e933f0aa475613c4145","vout":0,"scriptPubKey":"76a914c6df968d5d5e5103290559629f966c5efe6cfbfb88ac","amount":1,"satoshis":100000000,"height":275988,"confirmations":604},{"address":"GbyU4HML1rX8gcdVB2dNfE4RszCwKFYuuv","txid":"f9897905e569aed3067c532d5a1e11bd018a4b60231caf62c66db4e7ec9234c5","vout":1,"scriptPubKey":"76a914c6df968d5d5e5103290559629f966c5efe6cfbfb88ac","amount":0.00001,"satoshis":1000,"height":275987,"confirmations":605}]
get-outputs = ({ network, address} , cb)-->
    { url } = network.api
    request-url = "#{get-api-url network}/address/#{address}/utxo"
    err, data <- get request-url .timeout { deadline } .end
    return cb "cannot get outputs - err #{err.message ? err}" if err?
    #mock
    data.body
        |> filter (.value?)
        |> map extend { network, address }
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
add-outputs = (config, cb)->
    { tx-type, total, value, fee, tx, recipient, account } = config
    return cb "fee, value, total are required" if not fee? or not value? or not total?
    #we do not support private transactions
    #return add-outputs-private config, cb if tx-type is \private
    rest = total `minus` value `minus` fee
    tx.add-output recipient, +value
    #console.log { rest }
    if +rest isnt 0
        tx.add-output account.address, +rest
    cb null
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
    return cb "Balance is not enough to send tx" if +((total `minus` fee) `minus` value) < 0
    return cb 'Total is NaN' if isNaN total
    tx = new BitcoinLib.TransactionBuilder network
    err <- add-outputs { tx-type, total, value, fee, tx, recipient, network, account }
    return cb err if err?
    apply = (output, i)->
        tx.add-input output.txid, output.vout
    sign = (output, i)->
        key = BitcoinLib.ECPair.fromWIF(account.private-key, network)
        tx.sign i, key
    outputs.for-each apply
    outputs.for-each sign
    rawtx = tx.build!.to-hex!
    cb null, { rawtx }
export push-tx = ({ network, rawtx, tx-type } , cb)-->
    send-type =
        | tx-type is \instant => \sendix
        | _ => \send
    debugger
    err, res <- post "#{get-api-url network}/tx", rawtx .end
    return cb "#{err}: #{res?text}" if err?
    cb null, res.body?txid
export get-total-received = ({ address, network }, cb)->
    return cb "Url is not defined" if not network?api?url?
    #TODO:
    err, data <- get "#{get-api-url network}/addr/#{address}/totalReceived" .timeout { deadline } .end
    return cb err if err? or data.text.length is 0
    dec = get-dec network
    num = data.text `div` dec
    cb null, num
export get-unconfirmed-balance = ({ network, address} , cb)->
    return cb "Url is not defined" if not network?api?url?
    err, data <- get "#{get-api-url network}/address/#{address}" .timeout { deadline } .end
    debugger
    return cb err if err? or data.text.length is 0
    dec = get-dec network
    num = data.text `div` dec
    cb null, num
export get-balance = ({ address, network } , cb)->
    return cb "Url is not defined" if not network?api?url?
    err, data <- get "#{get-api-url network}/address/#{address}" .timeout { deadline } .end
    return cb err if err?
    return cb "Invalid blockstream balance response" if !data or !data.text or !data.body or !data.body.chain_stats
    dec = get-dec network
    num = data.body.chain_stats.funded_txo_sum `div` dec
    #return cb null, "2.00001"
    cb null, num
incoming-vout = (address, vout)-->
    addr = vout.scriptpubkey_address
    return addr == address
outcoming-vouts = (address, vout)-->
    addr = vout.scriptpubkey_address
    return null if !addr
    return { vout.value, address: addr } if addr != address
    null
transform-in = ({ net, address }, t)->
    tx = t.txid
    time = t.status.block_time
    fee = t.fee ? 0
    vout = t.vout ? []
    pending = if t.status.confirmed then 0 else 1
    dec = get-dec net
    unspend =
        vout |> filter incoming-vout address
            |> head
    amount = unspend?value || 0
    amount = amount `div` dec
    fee = fee `div` dec
    to = address
    from =
        | typeof! t.vin is \Array => t.vin.map(-> it.prevout.scriptpubkey_address)
        | _ => t.vin.addr
    from = from[0]
    url = "#{net.api.url}/tx/#{tx}"
    #console.log(\insight-in, t)
    { tx, amount, fee, time, url, to, from, pending }
transform-out = ({ net, address }, t)->
    debugger
    tx = t.txid
    time = t.status.block_time
    fee = t.fee ? 0
    vout = t.vout ? []
    pending = t.confirmations is 0
    outcoming =
        vout
            |> map outcoming-vouts address
            |> filter (?)
    amount =
        outcoming
            |> map (.value)
            |> foldl plus, 0
    dec = get-dec net
    amount = amount `div` dec
    fee = fee `div` dec
    to = outcoming.map(-> it.address).join(",")
    to = to[0]
    from = address
    url = "#{net.api.url}/tx/#{tx}"
    #console.log(\insight-out, t)
    { tx, amount, fee, time, url, to, pending, from }
transform-tx = (config, t)-->
    self-sender =
        t.vin ? []
            |> find -> it.prevout && (it.prevout.scriptpubkey_address is config.address)
    return transform-in config, t if not self-sender?
    transform-out config, t
get-api-url = (network)->
    api-name = network.api.api-name ? \api
    "#{network.api.url}/#{api-name}"
export check-tx-status = ({ network, tx }, cb)->
    cb "Not Implemented"
export get-transactions = ({ network, address}, cb)->
    return cb "Url is not defined" if not network?api?url?
    err, data <- get "#{get-api-url network}/address/#{address}/txs" .timeout { deadline: 15000 } .end
    return cb err if err?
    err, result <- json-parse data.text
    return cb err if err?
    return cb "Unexpected result" if typeof! result isnt \Array
    txs =
        result
            |> map transform-tx { net: network, address }
            |> filter (?)
    cb null, txs