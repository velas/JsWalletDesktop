require! {
    \qs : { stringify }
    \prelude-ls : { filter, map, foldl, each, sort-by, reverse }
    \../math.js : { plus, minus, times, div, from-hex, $toHex }
    \./superagent.js : { get, post }
    \./deps.js : { Web3, Tx, BN, hdkey, bip39 }
    \../json-parse.js
    \../deadline.js
    \bs58 : { decode, encode }
    \ethereumjs-common : { default: Common }
    \../addresses.js : { vlxToEth, ethToVlx }
    \crypto-js/sha3 : \sha3
    \../contracts/ERC20BridgeToken.json 
}
isChecksumAddress = (address) ->
    address = address.replace '0x', ''
    addressHash = sha3 address.toLowerCase!
    i = 0
    while i < 40
        return false if (parseInt addressHash[i], 16) > 7 and address[i].toUpperCase! isnt address[i] or (parseInt addressHash[i], 16) <= 7 and address[i].toLowerCase! isnt address[i]
        i++
    true
isAddress = (address) ->
    if not //^(0x)?[0-9a-f]{40}$//i.test address
        false
    else
        if (//^(0x)?[0-9a-f]{40}$//.test address) or //^(0x)?[0-9A-F]{40}$//.test address then true else isChecksumAddress address
to-eth-address = (velas-address, cb)->
    return cb "required velas-address as a string" if typeof! velas-address isnt \String
    return cb null, velas-address if isAddress velas-address
    return cb "velas address can be started with V" if velas-address.0 isnt \V
    #NEW_ADDRESS
    res = null
    try
        res = vlxToEth(velas-address)
    catch err
        return cb err
    return cb null, res
    # return cb null, vlxToEth(velas-address)
    # bs58str = velas-address.substr(1, velas-address.length)
    # try
    #     bytes = decode bs58str
    #     hex = bytes.toString('hex')
    #     eth-address = \0x + hex
    #     #return cb "incorrect velas address" if not isAddress eth-address
    #     cb null, eth-address
    # catch err
    #     cb err
window?to-eth-address = vlxToEth if window?
export isValidAddress =  ({ address }, cb)->
    err <- to-eth-address address
    return cb "Given address is not valid Velas address" if err?
    cb null, yes
get-ethereum-fullpair-by-index = (mnemonic, index, network)->
    seed = bip39.mnemonic-to-seed(mnemonic)
    wallet = hdkey.from-master-seed(seed)
    w = wallet.derive-path("m/44'/60'/"+index+"'/0/0").get-wallet!
    address = \0x + w.get-address!.to-string(\hex)
    private-key = w.get-private-key-string!
    public-key = w.get-public-key-string!
    { address, private-key, public-key }
try-parse = (data, cb)->
    <- set-immediate
    return cb null, data if typeof! data.body is \Object
    console.log data if typeof! data?text isnt \String
    return cb "expected text" if typeof! data?text isnt \String
    try
        data.body = JSON.parse data.text
        cb null, data
    catch err
        #console.log \parse-err, err, data.text
        cb err
        
post-web3provider = ([provider, ...providers], query, cb)->
    retrun cb null if not provider?    
    err, data <- post provider, query .end
    console.error "[post-web4Proviedrs] err", provider, err if err?  
    return cb null, data if not err? and data?
    post-web3provider(providers, query, cb)  
        
make-query = (network, method, params, cb)->
    console.log "[make query]"    
    { web3-provider } = network.api
    query = {
        jsonrpc : \2.0
        id : 1
        method
        params
    }
    providers = 
        | network.api.extraProviders? and typeof! network.api.extraProviders is \Array => [network.api.web3-provider] ++ network.api.extraProviders   
        | _ => [network.api.web3-provider]    
    err, data <- post-web3provider providers, query    
    #err, data <- post web3-provider, query .end
    return cb "query err: #{err.message ? err}" if err?
    err, data <- try-parse data
    return cb err if err?
    return cb "expected object" if typeof! data.body isnt \Object
    return cb data.body.error if data.body?error?
    cb null, data.body.result
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

get-gas-estimate = (config, cb)->
    { network, fee-type, account, amount, to, data, gas } = config    
    return cb null, gas if gas?
    return cb null, "0" if +amount is 0
    dec = get-dec network  
    from = account.address
   
    $data =
        | data? and data isnt "0x" => data    
        | _ => "0x"
    val = (amount `times` dec)    
    value = $toHex(val) 
    query = { from, to, data: $data, value }  
    err, estimate <- make-query network, \eth_estimateGas , [ query ]
    console.error "[getGasEstimate] error:" err if err?   
    return cb err if err?    
    cb null, from-hex(estimate)
    
export calc-fee = ({ network, fee-type, account, amount, to, data, gas-price, gas }, cb)->
    #return cb null if typeof! to isnt \String or to.length is 0
    return cb null if fee-type isnt \auto
    dec = get-dec network
    err, gas-price <- calc-gas-price { fee-type, network, gas-price }
    return cb err if err?
    data-parsed =
        | data? => data
        | _ => '0x'
    from = account.address
    query = { from, to, data: data-parsed }
    err, estimate <- get-gas-estimate { network, fee-type, account, amount, to, data: data-parsed, gas }
    return cb null, { calced-fee: network.tx-fee, gas-price } if err?   
    res = gas-price `times` estimate
    val = res `div` dec
    cb null, { calced-fee: val, gas-price, gas-estimate: estimate }
    
export get-keys = ({ network, mnemonic, index }, cb)->
    result = get-ethereum-fullpair-by-index mnemonic, index, network
    cb null, result
round = (num)->
    Math.round +num
to-hex = ->
    new BN(it)
transform-tx = (network, description, t)-->
    { url } = network.api
    dec = get-dec network
    network = \eth
    tx =
        | t.hash? => t.hash
        | t.transactionHash? => t.transactionHash
        | _ => "unknown"
    amount = t.value `div` dec
    time = t.time-stamp
    url = "#{url}/tx/#{tx}"
    gas-used = 
        | t.gas-used? => t.gas-used
        | t.gas-used + "".length is 0 => "0" 
        | _ => "0"          
    gas-price = 
        | t.gas-price? => t.gas-price
        | t.gas-price + "".length is 0 => "0"
        | _ => "0"
    fee = gas-used `times` (gas-price + "") `div` dec
    recipient-type = if (t.input ? "").length > 3 then \contract else \regular
    res = { network, tx, amount, fee, time, url, t.from, t.to, recipient-type, description }
    res    
get-internal-transactions = (config, cb)->
    { network, address } = config   
    { api-url } = config.network.api
    module = \account
    action = \txlistinternal
    startblock = 0
    endblock = 99999999
    sort = \desc
    apikey = \KXYT4M24AWGIV585T7T38GUNMB4IRSY7H9
    page = 1
    offset = 20
    query = stringify { module, action, apikey, address, sort, startblock, endblock, page, offset }
    err, resp <- get "#{api-url}?#{query}" .timeout { deadline } .end
    return cb "cannot execute query - err #{err.message ? err }" if err?
    err, result <- json-parse resp.text
    return cb "cannot parse json: #{err.message ? err}" if err?
    return cb "Unexpected result" if typeof! result?result isnt \Array
    txs =
        result.result |> map transform-tx network, 'internal'
    cb null, txs
get-external-transactions = ({ network, address }, cb)->
    { api-url } = network.api
    module = \account
    action = \txlist
    startblock = 0
    endblock = 99999999
    page = 1
    offset = 20
    sort = \desc
    apikey = \KXYT4M24AWGIV585T7T38GUNMB4IRSY7H9
    query = stringify { module, action, apikey, address, sort, startblock, endblock, page, offset }
    err, resp <- get "#{api-url}?#{query}" .timeout { deadline } .end
    return cb "cannot execute query - err #{err.message ? err }" if err?
    err, result <- json-parse resp.text
    return cb "cannot parse json: #{err.message ? err}" if err?
    return cb "Unexpected result" if typeof! result?result isnt \Array
    txs =
        result.result |> map transform-tx network, 'external'
    #console.log api-url, result.result, txs
    cb null, txs
export get-transactions = ({ network, address }, cb)->
    page = 1
    offset = 20
    err, external <- get-external-transactions { network, address, page, offset }
    return cb err if err?
    err, internal <- get-internal-transactions { network, address, page, offset }
    return cb err if err?
    all = external ++ internal
    ordered =
        all
            |> sort-by (.time)
            |> reverse
    cb null, ordered
get-dec = (network)->
    { decimals } = network
    10^decimals
calc-gas-price = ({ fee-type, network, gas-price }, cb)->
    return cb null, gas-price if gas-price?
    return cb null, 21000 if fee-type is \cheap
    err, price <- make-query network, \eth_gasPrice , []
    console.log "BNB [calc-gas-price] error: #{err.message ? err}" if err?
    return cb null, 21000 if err?   
    price = from-hex(price)
    return cb null, 21000 if +price < 21000
    cb null, price
try-get-latest = ({ network, account }, cb)->
    err, address <- to-eth-address account.address
    return cb err if err?
    err, nonce <- make-query network, \eth_getTransactionCount , [ address, "latest" ]
    return cb "cannot get nonce (latest) - err: #{err.message ? err}" if err?
    next = +from-hex(nonce)
    cb null, next
get-nonce = ({ network, account }, cb)->
    #err, nonce <- web3.eth.get-transaction-count
    err, address <- to-eth-address account.address
    return cb err if err?
    err, nonce <- make-query network, \eth_getTransactionCount , [ address, \pending ]
    return try-get-latest { network, account }, cb if err? and "#{err.message ? err}".index-of('not implemented') > -1
    return cb "cannot get nonce (pending) - err: #{err.message ? err}" if err?
    cb null, from-hex(nonce)
is-address = (address) ->
    if not //^(0x)?[0-9a-f]{40}$//i.test address
        false
    else
        true
export create-transaction = ({ network, account, recipient, amount, amount-fee, data, fee-type, tx-type, gas-price, gas } , cb)-->
    #console.log \tx, { network, account, recipient, amount, amount-fee, data, fee-type, tx-type}
    dec = get-dec network
    err, $recipient <- to-eth-address recipient
    return cb err if err?
    return cb "address is not correct ethereum address" if not is-address $recipient
    private-key = new Buffer account.private-key.replace(/^0x/,''), \hex
    err, nonce <- get-nonce { account, network }
    return cb err if err?
    to-wei = -> it `times` dec
    to-eth = -> it `div` dec
    value = to-wei amount
    buffer = {}
    err, gas-price <- calc-gas-price { fee-type, network, gas-price }
    return cb err if err?
    buffer.gas-price = gas-price
    err, address <- to-eth-address account.address
    return cb err if err?
    
    err, balance <- get-balance {network, address}
    return cb err if err?
    
    dec = get-dec network
    balance = balance `times` dec
    
    balance-eth = to-eth balance
    to-send = amount `plus` amount-fee
    return cb "Balance #{balance-eth} is not enough to send tx #{to-send}" if +balance-eth < +to-send
    # gas-estimate =
    #     |  gas? => gas
    #     |  +gas-price is 0 => 21000
    #     | _ => round(to-wei(amount-fee) `div` gas-price)
    data-parsed =
        | data? => data
        | _ => '0x'
    query = { from: address, to: $recipient, data: data-parsed }
    err, gas-estimate <- get-gas-estimate { network, fee-type, account, amount, to: recipient, data }
    return cb err if err?
    err, chainId <- make-query network, \eth_chainId , []
    return cb err if err?
    err, networkId <- make-query network, \net_version , []
    return cb err if err?
    common = Common.forCustomChain 'mainnet', { networkId }
    gas-price = buffer.gas-price
    if fee-type is \custom or !gas-price
        gas-price = (amount-fee `times` dec) `div` gas-estimate
    tx-obj = {
        nonce: to-hex nonce
        gas-price: to-hex gas-price
        value: to-hex value
        gas: to-hex gas-estimate
        to: $recipient
        from: address
        data: data || "0x"
        chainId: chainId     
    }
    tx = new Tx tx-obj, { common }
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
    return cb err if err?
    address = account.address
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
    
get-web3 = (network)->
    { web3-provider } = network.api
    new Web3(new Web3.providers.HttpProvider(web3-provider))
    
get-contract-instance = (web3, network, swap)->
    abi = ERC20BridgeToken.abi 
    web3.eth.contract(abi).at(network.address)
    
export get-balance = ({ network, address} , cb)->
    err, number <- make-query network, \eth_getBalance , [ address, \latest ]
    return cb err if err?
    dec = get-dec network
    balance = number `div` dec
    cb null, balance
    
export get-sync-status = ({ network }, cb)->
    err, estimate <- make-query network, \eth_getSyncing , [ ]
    return cb err if err?
    return cb null, estimate
export get-peer-count = ({ network }, cb)->
    err, estimate <- make-query network, \net_getPeerCount , [ ]
    return cb err if err?
    return cb null, estimate
    
    
export get-market-history-prices = (config, cb)->
    { network, coin } = config  
    {market} = coin    
    err, resp <- get market .timeout { deadline } .end
    return cb "cannot execute query - err #{err.message ? err }" if err?
    err, result <- json-parse resp.text
    return cb err if err?
    cb null, result