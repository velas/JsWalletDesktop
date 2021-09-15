require! {
    \qs : { stringify }
    \prelude-ls : { filter, map, foldl, each }
    \../math.js : { plus, minus, times, div, from-hex }
    \./superagent.js : { get, post }
    \./deps.js : { Web3, Tx, BN, hdkey, bip39 }
    \../json-parse.js
    \../deadline.js
    \crypto-js/sha3 : \sha3
}
get-ethereum-fullpair-by-index = (mnemonic, index, network)->
    seed = bip39.mnemonic-to-seed(mnemonic)
    wallet = hdkey.from-master-seed(seed)
    w = wallet.derive-path("m/44'/60'/"+index+"'/0/0").get-wallet!
    address = "0x" + w.get-address!.to-string(\hex)
    private-key = w.get-private-key-string!
    public-key = w.get-public-key-string!
    { address, private-key, public-key }
abi = [{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"payable":true,"stateMutability":"payable","type":"fallback"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Transfer","type":"event"}]
get-contract-instance = (web3, addr)->
    | typeof! web3.eth.contract is \Function => web3.eth.contract(abi).at(addr)
    | _ => new web3.eth.Contract(abi, addr)
is-address = (address) ->
    if not //^(0x)?[0-9a-f]{40}$//i.test address
        false
    else
        true
export calc-fee = ({ network, tx, fee-type, account, amount, to, data }, cb)->
    #console.log "[calc-fee]" { data }    
    return cb null if fee-type isnt \auto
    web3 = get-web3 network
    err, gas-price <- calc-gas-price { network, web3, fee-type }
    return cb err if err?
    err, nonce <- web3.eth.get-transaction-count account.address, \pending
    return cb err if err?
    from = account.address
    err, estimate <- web3.eth.estimate-gas { from, nonce, to, data }
    return cb err if err?
    #console.log "[calc-fee]" { estimate } 
    #estimate = 100000  
    dec = get-dec network
    res = gas-price `times` estimate
    val = res `div` (10^18)
    cb null, val
export get-keys = ({ network, mnemonic, index }, cb)->
    result = get-ethereum-fullpair-by-index mnemonic, index, network
    cb null, result
to-hex = ->
    new BN(it)
transform-tx = (network, t)-->
    { url } = network.api
    { FOREIGN_BRIDGE } = network
    dec = get-dec network
    network = \eth
    tx = t.hash
    amount = t.value `div` dec
    time = t.time-stamp
    url = "#{url}/tx/#{tx}"
    fee = 
        | t.gasUsed? => t.gasUsed `times` t.gas-price `div` (10^18)    
        | _=> t.cumulative-gas-used `times` t.gas-price `div` (10^18) 
    from = 
        | _ => t.from
    tx-type =
        | up(t.from) is up(FOREIGN_BRIDGE ? "") => "EVM → ETHEREUM Swap"
        | up(t.to) is up(FOREIGN_BRIDGE ? "") => "ETHEREUM → EVM Swap"   
        | _ => null 
    { network, tx, amount, fee, time, url, from, t.to, tx-type }
up = (s)->
    (s ? "").to-upper-case!
export get-transactions = ({ network, address }, cb)->
    { api-url } = network.api
    module = \account
    action = \tokentx
    startblock = 0
    endblock = 99999999
    sort = \asc
    apikey = \4TNDAGS373T78YJDYBFH32ADXPVRMXZEIG
    query = stringify { module, action, apikey, address, sort, startblock, endblock }
    err, resp <- get "#{api-url}?#{query}" .timeout { deadline } .end
    return cb err if err?
    err, result <- json-parse resp.text
    return cb err if err?
    return cb "Unexpected result" if typeof! result?result isnt \Array
    txs =
        result.result
            |> filter -> up(it.tokenSymbol) is \USDT 
            |> map transform-tx network
    cb null, txs
get-web3 = (network)->
    { web3-provider } = network.api
    new Web3(new Web3.providers.HttpProvider(web3-provider))
get-dec = (network)->
    { decimals } = network
    10^decimals
calc-gas-price = ({ web3, fee-type }, cb)->
    return cb null, \3000000000 if fee-type is \cheap  
    err, price <- web3.eth.get-gas-price
    return cb err if err?
    cb null price    
round = (num)->
    Math.round +num
export create-transaction = ({ network, account, recipient, amount, amount-fee, fee-type, tx-type, data, gas, gas-price} , cb)-->
    return cb "address in not correct ethereum address" if not is-address recipient
    #console.log "[create-tx]" {gas, gas-price, amount-fee}    
    web3 = get-web3 network
    dec = get-dec network
    private-key = new Buffer account.private-key.replace(/^0x/,''), \hex
    err, nonce <- web3.eth.get-transaction-count account.address, \pending
    return cb err if err?
    return cb "nonce is required" if not nonce?
    contract = get-contract-instance web3, network.address
    to-wei = -> it `times` dec
    to-wei-eth = -> it `times` (10^18)
    to-eth = -> it `div` (10^18)
    value = to-wei amount
    err, gas-price-bn <- calc-gas-price { network, web3, fee-type }
    return cb err if err?
    gas-price = gas-price-bn.to-fixed!
    #console.log { gas-price } 
    gas-minimal = to-wei-eth(amount-fee) `div` gas-price
    #console.log { gas-minimal }    
    gas-estimate = round ( gas-minimal `times` 5 )
    #console.log { gas-estimate }    
    return cb "getBalance is not a function" if typeof! web3.eth.get-balance isnt \Function
    err, balance <- web3.eth.get-balance account.address
    return cb err if err?
    balance-eth = to-eth balance
    return cb "ETH balance is not enough to send tx" if +balance-eth < +amount-fee
    err, erc-balance <- get-balance { network, account.address }
    return cb err if err?
    return cb "Balance is not enough to send this amount" if +erc-balance < +amount
    err, chainId <- make-query network, \eth_chainId , []
    return cb err if err?
    gas-estimate = 300000 
    #console.log "gas-estimate" gas-estimate    
    $data =
        | data? and data isnt "0x" => data    
        | contract.methods? => contract.methods.transfer(recipient, value).encodeABI!
        | _ => contract.transfer.get-data recipient, value
    #console.log \tx-build, { nonce, gas-price, gas-estimate, to: network.address, account.address, data }
    to = 
        | data? and data isnt "0x" => recipient    
        | _ => network.address    
    tx = new Tx do
        nonce: to-hex nonce
        gas-price: to-hex gas-price
        value: to-hex "0"
        gas: to-hex gas-estimate
        to: to   
        from: account.address
        data: $data || \0x
        chainId: chainId 
    tx.sign private-key
    rawtx = \0x + tx.serialize!.to-string \hex
    cb null, { rawtx }
export check-decoded-data = (decoded-data, data)->
    return no if not (decoded-data ? "").length is 0
    return no if not (data ? "").length is 0
export push-tx = ({ network, rawtx } , cb)-->
    web3 = get-web3 network
    send = web3.eth.send-raw-transaction ? web3.eth.send-signed-transaction
    #console.log \push-tx
    err, txid <- send rawtx
    cb err, txid
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
    cb "Not Implemented"
export get-balance = ({ network, address} , cb)->
    web3 = get-web3 network
    contract = get-contract-instance web3, network.address
    balance-of =
        | contract.methods? => (address, cb)-> contract.methods.balance-of(address).call cb
        | _ => (address, cb)-> contract.balance-of address, cb
    err, number <- balance-of address
    return cb err if err?
    dec = get-dec network
    balance = number `div` dec
    cb null, balance
export isValidAddress = ({ address, network }, cb)->   
    if not //^(0x)?[0-9a-f]{40}$//i.test address
        return cb "Address is not valid"   
    else
        valid = isChecksumAddress address
        return cb "Address is not valid" if not valid  
    cb null, yes
    
try-parse = (data, cb)->
    <- set-immediate
    return cb null, data if typeof! data.body is \Object
    return cb "expected text" if typeof! data?text isnt \String
    try
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
    err, tx <- make-query network, \eth_getTransactionReceipt , query
    return cb err if err?
    status =
        | typeof! tx isnt \Object => \pending
        | tx.status is \0x0 => \reverted
        | tx.status is \0x1 => \confirmed
        | _ => \pending
    result = { tx?from, tx?to, status, info: tx }
    cb null, result
    
isChecksumAddress = (address) ->
    address = address.replace '0x', ''
    addressHash = sha3 address.toLowerCase!
    i = 0
    while i < 40
        return no if (parseInt addressHash[i], 16) > 7 and address[i].toUpperCase! isnt address[i] or (parseInt addressHash[i], 16) <= 7 and address[i].toLowerCase! isnt address[i]
        i++
    yes  
    
export get-market-history-prices = (config, cb)->
    { network, coin } = config  
    {market} = coin    
    err, resp <- get market .timeout { deadline } .end
    return cb "cannot execute query - err #{err.message ? err }" if err?
    err, result <- json-parse resp.text
    return cb err if err?
    cb null, result