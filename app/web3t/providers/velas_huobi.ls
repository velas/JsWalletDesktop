require! {
    \qs : { stringify }
    \prelude-ls : { filter, map, foldl, each, sort-by, reverse, uniqueBy }
    \../math.js : { plus, minus, times, div, from-hex }
    \./superagent.js : { get, post }
    \./deps.js : { Web3, Tx, BN, hdkey, bip39, ERC20BridgeToken }
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
to-velas-address = (eth-address-buffer)->
    s1 = encode eth-address-buffer
    "V#{s1}"
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
window?to-velas-address = ethToVlx if window?
export isValidAddress =  ({ address }, cb)->
    err <- to-eth-address address
    return cb "Given address is not valid Velas address" if err?
    cb null, yes
get-ethereum-fullpair-by-index = (mnemonic, index, network)->
    seed = bip39.mnemonic-to-seed(mnemonic)
    wallet = hdkey.from-master-seed(seed)
    w = wallet.derive-path("m/44'/60'/"+index+"'/0/0").get-wallet!
    address = \0x + w.get-address!.to-string(\hex)
    vlx-address = ethToVlx w.get-address!.to-string(\hex)    
    private-key = w.get-private-key-string!
    public-key = w.get-public-key-string!
    { address, vlx-address, private-key, public-key }
try-parse = (data, cb)->
    <- set-immediate
    return cb null, data if typeof! data.body is \Object
    console.log data if typeof! data?text isnt \String
    return cb "expected text" if typeof! data?text isnt \String
    try
        сonsole.log \try-parse, data.text, JSON.parse
        data.body = JSON.parse data.text
        cb null, data
    catch err
        cb err
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
    err, data <- try-parse data
    return cb err if err?
    return cb "expected object" if typeof! data.body isnt \Object
    return cb data.body.error if data.body?error?
    cb null, data.body.result
export get-transaction-info = (config, cb)->
    { network, tx } = config
    query = [tx]
    err, tx-data <- make-query network, \eth_getTransactionReceipt , query
    return cb err if err?
    status =
        | typeof! tx-data isnt \Object => \pending
        | tx-data.status is \0x0 => \reverted
        | tx-data.status is \0x1 => \confirmed
        | _ => \pending
    result = { tx-data?from, tx-data?to, status, info: tx }
    cb null, result
get-gas-estimate = ({ network, query, gas }, cb)->
    return cb null, gas if gas?
    err, estimate <- make-query network, \eth_estimateGas , [ query ]
    return cb null, 1000000 if err?
    #err, estimate <- web3.eth.estimate-gas { from, nonce, to, data }
    estimate-normal = from-hex(estimate)
    return cb null, 1000000 if +estimate-normal < 1000000
    cb null, estimate-normal
export calc-fee = ({ network, fee-type, account, amount, to, data, gas-price, gas }, cb)->
    return cb null if typeof! to isnt \String or to.length is 0
    return cb null if fee-type isnt \auto
    dec = get-dec network
    err, gas-price <- calc-gas-price { fee-type, network, gas-price }
    return cb err if err?
    data-parsed =
        | data? => data
        | _ => '0x'
    err, from <- to-eth-address account.address
    console.error "calc-fee from address #{err}" if err?
    return cb "Given address is not valid Velas address" if err?
    err, to <- to-eth-address to
    console.error "calc-fee from address #{err}" if err?
    return cb "Given address is not valid Velas address" if err?
    query = { from, to, data: data-parsed }
    err, estimate <- get-gas-estimate { network, query, gas }
    return cb err if err?
    #return cb "estimate gas err: #{err.message ? err}" if err?
    res = gas-price `times` estimate
    val = res `div` dec
    cb null, val
export get-keys = ({ network, mnemonic, index }, cb)->
    result = get-ethereum-fullpair-by-index mnemonic, index, network
    cb null, result
round = (num)->
    Math.round +num
to-hex = ->
    new BN(it)
transform-tx = (network, description, t)-->
    { url } = network.api
    { FOREIGN_BRIDGE_TOKEN } = network
    dec = get-dec network
    network = \eth
    tx =
        | t.hash? => t.hash
        | t.transactionHash? => t.transactionHash
        | _ => "unknown"
    status =
        | +t.confirmations > 0 => \confirmed       
        | t.status is \0x0 => \reverted
#        | +t.isError is 0 and t.confirmations > 0 => \confirmed       
#        | t.isError is 1 => \reverted
        | _ => \pending
    amount = t.value `div` dec
    time = t.time-stamp
    url = "#{url}/tx/#{tx}"
    gas-used = t.gas-used ? 0
    gas-price = t.gas-price ? 0
    fee = gas-used `times` gas-price `div` dec
    recipient-type = if (t.input ? "").length > 3 then \contract else \regular
    tx-type = 
        | t.from is \0x0000000000000000000000000000000000000000 => "EVM → HECO Swap"
        #| t.contractAddress? and t.contractAddress isnt "" and up(t.contractAddress) is up(FOREIGN_BRIDGE_TOKEN ? "") => "HECO → EVM Swap" 
        | _ => null 
    from = t.from 
    { network, tx, status, amount, fee, time, url, from, t.to, recipient-type, description, tx-type }
get-internal-transactions = ({ network, address }, cb)->
    err, address <- to-eth-address address
    return cb err if err?
    { api-url } = network.api
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
    txs =
        result.result |> map transform-tx network, 'internal'
    cb null, txs
get-external-transactions = ({ network, address }, cb)->
    err, address <- to-eth-address address
    return cb err if err?
    { api-url } = network.api
    module = \account
    action = \txlist
    startblock = 0
    endblock = 99999999
    page = 1
    offset = 20
    sort = \desc
    apikey = \4TNDAGS373T78YJDYBFH32ADXPVRMXZEIG
    query = stringify { module, action, apikey, address, sort, startblock, endblock, page, offset }
    err, resp <- get "#{api-url}?#{query}" .timeout { deadline } .end
    return cb "cannot execute query - err #{err.message ? err }" if err?
    err, result <- json-parse resp.text
    return cb "cannot parse json: #{err.message ? err}" if err?
    return cb "Unexpected result" if typeof! result?result isnt \Array
    txs =
        result.result |> map transform-tx network, 'external'
    cb null, txs
    
up = (s)->
    (s ? "").to-upper-case!
    
export get-transactions = ({ network, address }, cb)->
    { api-url } = network.api
    module = \account
    action = \tokentx
    startblock = 0
    endblock = 99999999
    sort = \asc
    apikey = \DRXKZ5YNQIAU18EF3EV83UMWW983M56KYR
    query = stringify { module, action, apikey, address, sort, startblock, endblock }
    err, resp <- get "#{api-url}?#{query}" .timeout { deadline } .end
    return cb err if err?
    err, result <- json-parse resp.text
    return cb err if err?
    return cb "Unexpected result" if typeof! result?result isnt \Array
    txs =
        result.result
            |> filter -> 
                up(it.contract-address) is up(network.address) and up(it.tokenSymbol) is \VLX
            |> uniqueBy (-> it.hash)
            |> map transform-tx network, 'external' 
    cb null, txs
export get-contract-transactions = ({ network, address }, cb)->
    err, address <- to-eth-address address
    return cb err if err?
    { api-url } = network.api
    module = \contract
    action = \getabi
    startblock = 0
    endblock = 99999999
    page = 1
    offset = 20
    sort = \desc
    apikey = \4TNDAGS373T78YJDYBFH32ADXPVRMXZEIG
    query = stringify { module, action, apikey, address, sort, startblock, endblock, page, offset }
    err, resp <- get "#{api-url}?#{query}" .timeout { deadline } .end
    return cb "cannot execute query - err #{err.message ? err }" if err?
    err, result <- json-parse resp.text
    return cb "cannot parse json: #{err.message ? err}" if err?
    return cb "Unexpected result" if typeof! result?result isnt \Array
    txs =
        result.result |> map transform-tx network, 'external'
    cb null, txs
get-dec = (network)->
    { decimals } = network
    10^decimals
calc-gas-price = ({ fee-type, network, gas-price }, cb)->
    return cb null, gas-price if gas-price?
    return cb null, 22000 if fee-type is \cheap
    err, price <- make-query network, \eth_gasPrice , []
    return cb "calc gas price - err: #{err.message ? err}" if err?
    price = from-hex(price)
    return cb null, 22000 if +price < 22000
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
get-contract-instance = (web3, network, swap)->
    abi = ERC20BridgeToken.abi 
    web3.eth.contract(abi).at(network.address)
    
get-gas-estimate = ({ network, query, gas }, cb)->
    return cb null, gas if gas?
    err, estimate <- make-query network, \eth_estimateGas , [ query ]
    return cb null, 1000000 if err?
    estimate-normal = from-hex(estimate)
    return cb null, 1000000 if +estimate-normal < 1000000
    cb null, estimate-normal
    
export create-transaction = (config, cb)-->
    { network, account, recipient, amount, amount-fee, data, fee-type, tx-type, gas-price, gas, swap } = config 
    return cb "address in not correct ethereum address" if not is-address recipient
    web3 = get-web3 network
    dec = get-dec network
    private-key = new Buffer account.private-key.replace(/^0x/,''), \hex
    err, nonce <- web3.eth.get-transaction-count account.address, \pending
    return cb err if err?
    return cb "nonce is required" if not nonce?
    contract = get-contract-instance web3, network, swap  
    to-wei = -> it `times` dec
    to-wei-eth = -> it `times` (10^18)
    to-eth = -> it `div` (10^18)
    value = to-wei amount
    err, gas-price <- calc-gas-price { fee-type, network, gas-price }
    return cb err if err?
    gas-minimal = to-wei-eth(amount-fee) `div` gas-price
    gas-estimate = round ( gas-minimal `times` 2 )
    err, balance <- get-eth-balance { network, address: account.address }
    return cb err if err?
    fee-in = network.txFeeIn.to-upper-case! 
    err, chainId <- make-query network, \eth_chainId , []
    return cb err if err?   
    return cb "Not enought balance on #{fee-in} wallet to send tx with fee #{amount-fee}" if +balance < +amount-fee
    
    $data =
        | config.data? and config.data isnt "0x" => config.data 
        | contract.methods? => contract.methods.transfer(recipient, value).encodeABI!
        | _ => contract.transfer.get-data recipient, value 
        
    $recipient =
        | not config.data? or config.data is "0x" => network.address
        | _ => recipient
        
    query = { config.from, to: $recipient , data: $data }
    err, estimate <- get-gas-estimate { network, query, gas }
    return cb err if err? 
          
    configs = 
        nonce: to-hex nonce
        gas-price: to-hex gas-price
        value: to-hex "0"
        gas: to-hex estimate
        to: $recipient 
        from: account.address
        data: $data 
        chainId: chainId 

    tx = new Tx(configs)
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
    err, address <- to-eth-address account.address
    return cb err if err?
    total =
        txs |> filter (-> it.to.to-upper-case! is address.to-upper-case!)
            |> map (.amount)
            |> foldl plus, 0
    cb null, total
export get-unconfirmed-balance = ({ network, address} , cb)->
    err, address <- to-eth-address address
    return cb err if err?
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
export get-balance = ({ network, address, swap} , cb)->
    #err, address <- to-eth-address address
    #return cb err if err?
    web3 = get-web3 network
    contract = get-contract-instance web3, network, swap 
    number = contract.balance-of(address)
    dec = get-dec network
    balance = number `div` dec
    cb null, balance
export get-eth-balance = ({ network, address} , cb)->
    err, number <- make-query network, \eth_getBalance , [ address, \latest ]
    return cb err if err?
    dec = get-dec network
    balance = number `div` dec
    cb null, balance
#
# SERVICE
#
export get-sync-status = ({ network }, cb)->
    err, estimate <- make-query network, \eth_getSyncing , [ ]
    return cb err if err?
    return cb null, estimate
export get-peer-count = ({ network }, cb)->
    err, estimate <- make-query network, \net_getPeerCount , [ ]
    return cb err if err?
    return cb null, estimate
    
#export get-market-history-prices = (config, cb)->
#    { network, coin } = config  
#    {market} = coin    
#    err, resp <- get market .timeout { deadline } .end
#    return cb "cannot execute query - err #{err.message ? err }" if err?
#    err, result <- json-parse resp.text
#    return cb err if err?
#    cb null, result