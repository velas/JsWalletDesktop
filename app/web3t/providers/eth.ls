require! {
    \qs : { stringify }
    \prelude-ls : { filter, map, foldl, each, uniqueBy }
    \../math.js : { plus, minus, times, div, from-hex }
    \./superagent.js : { get, post }
    \./deps.js : { Web3, Tx, BN, hdkey, bip39 }
    #\web3 : \Web3
    \../json-parse.js
    \../deadline.js
    \bignumber.js 
    #\multicoin-address-validator : \WAValidator
}
get-ethereum-fullpair-by-index = (mnemonic, index, network)->
    seed = bip39.mnemonic-to-seed(mnemonic)
    wallet = hdkey.from-master-seed(seed)
    w = wallet.derive-path("m/44'/60'/"+index+"'/0/0").get-wallet!
    address = "0x" + w.get-address!.to-string(\hex)
    private-key = w.get-private-key-string!
    public-key = w.get-public-key-string!
    { address, private-key, public-key }
make-query = (network, method, params, cb)->
    { web3-provider } = network.api
    query = {
        jsonrpc : \2.0
        id : 1
        method
        params
    }
    err, data <- post web3-provider, query .end
    return cb "query err: #{err.message ? err}" if err?
    return cb data.body.error if data.body.error?
    cb null, data.body.result
    
get-gas-estimate = (config, cb)->
    { network, fee-type, account, amount, to, data, swap } = config
    return cb null, 250000 if config.swap? and config.swap? is yes 
    return cb null, 21000 if not config.data? or config.data is "0x"    
    query = { from: config.account.address, to: config.account.address, config.data }
    err, estimate <- make-query network, \eth_estimateGas , [ query ] 
    res = 
        | estimate? => from-hex(estimate) 
        | _ => 21000
    cb null, res  
    
export calc-fee = ({ network, fee-type, account, amount, to, data, swap }, cb)->
    return cb null if fee-type isnt \auto
    dec = get-dec network
    err, gas-price <- calc-gas-price { fee-type, network }
    return cb err if err?
    value =
        | amount? => amount `times` dec
        | _ => 0
    #err, nonce <- get-nonce { account, network }
    #return cb err if err?
    data-parsed =
        | data? => data
        | _ => '0x'
    from = account.address
    query = { from, to: account.address, data: data-parsed }
    err, estimate <- get-gas-estimate { network, fee-type, account, amount, to, data: data-parsed, swap } 
    #estimate = 24000 
    res = gas-price `times` estimate
    val = res `div` dec
    fee = new bignumber(val).to-fixed(8)
    cb null, fee
export get-keys = ({ network, mnemonic, index }, cb)->
    result = get-ethereum-fullpair-by-index mnemonic, index, network
    cb null, result
round = (num)->
    Math.round +num
to-hex = ->
    new BN(it)

prepare-internal-txs = (network, [tx, ...txs], cb)->
    return cb null if not tx?
    err, more-info <- get-transaction-info { network, tx: tx.hash }
    tx.more-info = more-info
    err <- prepare-internal-txs(network, txs)
    cb null

transform-internal-tx = (network, type, t)-->
    { url } = network.api
    dec = get-dec network
    network = \eth
    tx = t.hash
    amount = t.value `div` dec
    time = t.time-stamp
    url = "#{url}/tx/#{tx}"
    { gas-used, cumulativeGasUsed, effectiveGasPrice, status } = t.more-info.info
    fee = cumulativeGasUsed `times` effectiveGasPrice `div` dec
    recipient-type = if (t.input ? "").length > 3 then \contract else \regular
    { network, tx, amount, fee, time, url, t.from, t.to, status, recipient-type, description:type }

up = (s)->
    (s ? "").to-upper-case!

transform-tx = (network, t)-->
    { url } = network.api
    { HOME_BRIDGE } = network
    dec = get-dec network
    network = \eth
    tx = t.hash
    amount = t.value `div` dec
    time = t.time-stamp
    url = "#{url}/tx/#{tx}"
    fee =
        | t.gasUsed? => t.gasUsed `times` t.gas-price `div` dec    
        | _ => t.cumulative-gas-used `times` t.gas-price `div` dec
    tx-type =
        #| up(t.from) is up(FOREIGN_BRIDGE ? "") => "EVM → ETHEREUM Swap"
        | up(t.to) is up(HOME_BRIDGE ? "") => "ETHEREUM → EVM Swap"   
        | _ => null 
        
    { network, tx, amount, fee, time, url, t.from, t.to, tx-type }

get-internal-transactions = (config, cb)->
    { network, address } = config
    { api-url } = config.network.api
    module = \account
    action = \txlistinternal
    startblock = 0
    endblock = 99999999
    sort = \desc
    apikey = \4TNDAGS373T78YJDYBFH32ADXPVRMXZEIG
    page = 1
    offset = 20
    query = stringify { module, action, apikey, address, sort, startblock, endblock, page, offset }
    err, resp <- get "#{api-url}?#{query}" .timeout { deadline } .end
    return cb "cannot execute query - err #{err.message ? err }" if err?
    err, result <- json-parse resp.text
    return cb "cannot parse json: #{err.message ? err}" if err?
    return cb "Unexpected result" if typeof! result?result isnt \Array

    err <- prepare-internal-txs network, result.result
    try
        txs =
            result.result |> map transform-internal-tx network, 'internal'
    catch e
        console.error e
    cb null, txs

export get-transaction-info = (config, cb)->
    { network, tx } = config
    query = [tx]
    err, tx <- make-query network, \eth_getTransactionReceipt , query
    return cb err if err?
    status =
        | typeof! tx isnt \Object => \pending
        | tx.status is \0x0 => \reverted
        | tx.status is \0x1 => \confirmed
        | _ => \pending
    result = { tx?from, tx?to, status, info: tx }
    cb null, result

export get-transactions = ({ network, address }, cb)->
    page = 1
    offset = 20
    { api-url } = network.api
    module = \account
    action = \txlist
    startblock = 0
    endblock = 99999999
    sort = \asc
    apikey = \4TNDAGS373T78YJDYBFH32ADXPVRMXZEIG
    query = stringify { module, action, apikey, address, sort, startblock, endblock }
    err, resp <- get "#{api-url}?#{query}" .timeout { deadline } .end
    return cb "cannot execute query - err #{err.message ? err }" if err?
    err, result <- json-parse resp.text
    return cb "cannot parse json: #{err.message ? err}" if err?
    return cb "Unexpected result" if typeof! result?result isnt \Array
    txs =
        result.result 
            |> uniqueBy (-> it.hash)
            |> map transform-tx network

    err, internal <- get-internal-transactions { network, address, page, offset }
    internal = [] if err?
    all = txs ++ internal
    cb null, all

#get-web3 = (network)->
#    { web3-provider } = network.api
#    new Web3(new Web3.providers.HttpProvider(web3-provider))
get-dec = (network)->
    { decimals } = network
    10^decimals
calc-gas-price = ({ fee-type, network }, cb)->
    return cb null, \3000000000 if fee-type is \cheap
    #err, price <- web3.eth.get-gas-price
    err, price <- make-query network, \eth_gasPrice , []
    return cb "calc gas price - err: #{err.message ? err}" if err?
    price = from-hex(price)
    return cb null, 8 if +price is 0
    cb null, price
try-get-lateest = ({ network, account }, cb)->
    err, nonce <- make-query network, \eth_getTransactionCount , [ account.address, "latest" ]
    return cb "cannot get nonce (latest) - err: #{err.message ? err}" if err?
    next = +from-hex(nonce)
    cb null, next
get-nonce = ({ network, account }, cb)->
    #err, nonce <- web3.eth.get-transaction-count
    err, nonce <- make-query network, \eth_getTransactionCount , [ account.address, \pending ]
    return try-get-lateest { network, account }, cb if err? and "#{err.message ? err}".index-of('not implemented') > -1
    return cb "cannot get nonce (pending) - err: #{err.message ? err}" if err?
    cb null, from-hex(nonce)
is-address = (address) ->
    if not //^(0x)?[0-9a-f]{40}$//i.test address
        false
    else
        true
export create-transaction = ({ network, account, recipient, amount, amount-fee, data, fee-type, tx-type, chainId, gas-estimate} , cb)-->
    #console.log \tx, { network, account, recipient, amount, amount-fee, data, fee-type, tx-type}
    dec = get-dec network
    return cb "address is not correct ethereum address" if not is-address recipient
    private-key = new Buffer account.private-key.replace(/^0x/,''), \hex
    err, nonce <- get-nonce { account, network }
    return cb err if err?
    to-wei = -> it `times` dec
    to-eth = -> it `div` dec
    value = to-wei amount
    err, gas-price <- calc-gas-price { fee-type, network }
    return cb err if err?
    gas-estimate =
        |  +gas-price is 0 => 0
        | _ => round(to-wei(amount-fee) `div` gas-price)
    err, balance <- make-query network, \eth_getBalance , [ account.address, \latest ]
    return cb err if err?
    balance-eth = to-eth balance
    to-send = amount `plus` amount-fee
    return cb "Balance #{balance-eth} is not enough to send tx #{to-send}" if +balance-eth < +to-send
    gas-estimate = 
        | data? => 250000
        | _ => 21000    
    #nonce = 0
    #console.log { nonce, gas-price, value, gas-estimate, recipient, account.address, data }
    err, chainId <- make-query network, \eth_chainId , []
    return cb err if err?
    tx = new Tx do
        nonce: to-hex nonce
        gas-price: to-hex gas-price
        value: to-hex value
        gas: to-hex gas-estimate
        to: recipient
        from: account.address
        data: data || \0x
        chainId: chainId   
    tx.sign private-key
    rawtx = \0x + tx.serialize!.to-string \hex
    cb null, { rawtx }
export check-decoded-data = (decoded-data, data)->
    return no if not (decoded-data ? "").length is 0
    return no if not (data ? "").length is 0
export push-tx = ({ network, rawtx } , cb)-->
    err, txid <- make-query network, \eth_sendRawTransaction , [ rawtx ]
    #err, txid <- web3.eth.send-signed-transaction rawtx
    return cb "cannot get signed tx - err: #{err.message ? err}" if err?
    cb null, txid
export check-tx-status = ({ network, tx }, cb)->
    cb "Not Implemented"
export get-total-received = ({ address, network }, cb)->
    err, txs <- get-transactions { address, network }
    total =
        txs |> filter (-> it.to.to-upper-case! is address.to-upper-case!)
            |> map (.amount)
            |> foldl plus, 0
    cb null, total
export get-unconfirmed-balance = ({ network, address} , cb)->
    err, number <- make-query network, \eth_getBalance , [ address, \pending ]
    return cb err if err?
    #err, number <- web3.eth.get-balance address
    #return cb "cannot get balance - err: #{err.message ? err}" if err?
    dec = get-dec network
    balance = number `div` dec
    cb null, balance
export get-balance = ({ network, address} , cb)->
    err, number <- make-query network, \eth_getBalance , [ address, \latest ]
    return cb err if err?
    #err, number <- web3.eth.get-balance address
    #return cb "cannot get balance - err: #{err.message ? err}" if err?
    dec = get-dec network
    balance = number `div` dec
    cb null, balance
#export isValidAddress = ({ address, network }, cb)-> 
#    console.log "eth validation"   address   
#    addressIsValid = WAValidator.validate(address, 'ETH')    
#    return cb "Address is not valid" if not addressIsValid   
#    return cb null, address

export get-market-history-prices = (config, cb)->
    { network, coin } = config  
    {market} = coin    
    err, resp <- get market .timeout { deadline } .end
    return cb "cannot execute query - err #{err.message ? err }" if err?
    err, result <- json-parse resp.text
    return cb err if err?
    cb null, result