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
    return cb "Given address is not valid Velas (BSC) address" if err?
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
    
get-gas-estimate = (config, cb)->
    { network, fee-type, account, amount, to, data } = config
    return cb null, "0" if +amount is 0
    #return cb null, "0" if (+account?balance ? 0) is 0  
    dec = get-dec network     
    from = account.address
    web3 = get-web3 network
    contract = get-contract-instance web3, network.address
    receiver = 
        | data? and data isnt "0x" => to    
        | _ => network.address 
        
    val = (amount `times` dec)    
    value = $toHex(val)
        
    $data =
        | data? and data isnt "0x" => data    
        | contract.methods? => contract.methods.transfer(to, value).encodeABI!
        | _ => contract.transfer.get-data to, value   
        
    query = { from, to: receiver, data: $data, value: "0x0" }  
    err, estimate <- make-query network, \eth_estimateGas , [ query ]
    console.error "[getGasEstimate] error:" err if err?   
    return cb null, "0" if err?    
    cb null, from-hex(estimate)
    
export calc-fee = ({ network, tx, fee-type, account, amount, to, data, gas-price }, cb)->
    #return cb null if typeof! to isnt \String or to.length is 0
    return cb null if fee-type isnt \auto
    dec = get-dec network
    err, gas-price <- calc-gas-price { network, fee-type, gas-price }
    return cb err if err?  
    err, gas-estimate <- get-gas-estimate { network, fee-type, account, amount, to, data }  
    return cb null, { calced-fee: network.tx-fee, gas-price } if err?   
    res = gas-price `times` gas-estimate
    val = res `div` dec
    cb null, { calced-fee: val, gas-price, gas-estimate }
    
export get-keys = ({ network, mnemonic, index }, cb)->
    result = get-ethereum-fullpair-by-index mnemonic, index, network
    cb null, result
round = (num)->
    Math.round +num
to-hex = ->
    new BN(it)
transform-tx = (network, description, t)-->
    { url } = network.api
    { HOME_BRIDGE_TOKEN } = network
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
    tx-type = 
        | t.from is \0x0000000000000000000000000000000000000000 => "BSC → VELAS EVM Swap"
        #| t.contractAddress? and t.contractAddress isnt "" and up(t.contractAddress) is up(HOME_BRIDGE_TOKEN ? "") => "VELAS EVM → BSC Swap" 
        | _ => null 
    recipient-type = if (t.input ? "").length > 3 then \contract else \regular
    res = { network, tx, amount, fee, time, url, t.from, t.to, recipient-type, description, tx-type }
    res    

up = (s)->
    (s ? "").to-upper-case!

export get-transactions = ({ network, address }, cb)->
    { api-url } = network.api
    module = \account
    action = \tokentx
    startblock = 0
    endblock = 99999999
    sort = \asc
    apikey = \KXYT4M24AWGIV585T7T38GUNMB4IRSY7H9
    query = stringify { module, action, apikey, address, sort, startblock, endblock }
    err, resp <- get "#{api-url}?#{query}" .timeout { deadline } .end
    return cb err if err?
    err, result <- json-parse resp.text
    return cb err if err?
    return cb "Unexpected result" if typeof! result?result isnt \Array
    txs =
        result.result
            |> filter -> up(it.contract-address) is up(network.address) 
            |> map transform-tx network, 'external'
    cb null, txs
    
get-dec = (network)->
    { decimals } = network
    10^decimals
    
calc-gas-price = ({ fee-type, network, gas-price }, cb)->
    return cb null, gas-price if gas-price?
    err, price <- make-query network, \eth_gasPrice , []
    return cb "calc gas price - err: #{err.message ? err}" if err?
    price = from-hex(price)
    cb null, price
    
try-get-latest = ({ network, account }, cb)->
    err, address <- to-eth-address account.address
    return cb err if err?
    err, nonce <- make-query network, \eth_getTransactionCount , [ address, "latest" ]
    return cb "cannot get nonce (latest) - err: #{err.message ? err}" if err?
    next = +from-hex(nonce)
    cb null, next

get-nonce = ({ network, account }, cb)->
    address = account.address
    err, nonce <- make-query network, \eth_getTransactionCount , [ address, \pending ]
    return try-get-latest { network, account }, cb if err? and "#{err.message ? err}".index-of('not implemented') > -1
    return cb "cannot get nonce (pending) - err: #{err.message ? err}" if err?
    cb null, from-hex(nonce)
    
is-address = (address) ->
    if not //^(0x)?[0-9a-f]{40}$//i.test address
        false
    else
        true
export create-transaction = ({ network, account, recipient, amount, amount-fee, data, fee-type, tx-type, gas-price, gas, swap } , cb)-->
    dec = get-dec network
    err, $recipient <- to-eth-address recipient
    return cb err if err?
    return cb "address is not correct BUSD address" if not is-address $recipient
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
    to-send = amount
    return cb "Balance is not enough to send tx #{to-send}" if +balance-eth < +to-send 
    
    web3 = get-web3 network
    err, vlx-evm-balance <- web3.eth.get-balance account.address
    return cb err if err?
    vlx-evm-balance-eth = to-eth vlx-evm-balance
    return cb "Velas EVM balance (#{vlx-evm-balance-eth}) is not enough to send tx" if +vlx-evm-balance-eth < +amount-fee
    
    data-parsed =
        | data? => data
        | _ => '0x'
    
    err, gas-estimate <- get-gas-estimate { network,  fee-type, account, amount, to: recipient, data }  
    return cb err if err?
    
    one-percent = gas-estimate `times` "0.01"    
    $gas-estimate = gas-estimate `plus` one-percent
    res = $gas-estimate.split(".")   
    $gas-estimate = 
        | res.length is 2 => res.0
        | _ => $gas-estimate
    
    err, chainId <- make-query network, \eth_chainId , []
    return cb err if err?
    err, networkId <- make-query network, \net_version , []
    return cb err if err?
    gas-price = buffer.gas-price
    web3 = get-web3 network
    contract = get-contract-instance web3, network.address, no  
    $data =
        | data? and data isnt "0x" => data 
        | contract.methods? => contract.methods.transfer(recipient, value).encodeABI!
        | _ => contract.transfer.get-data recipient, value 
        
    $recipient =
        | not data? or data is "0x" => network.address
        | _ => recipient  
 
    tx = new Tx do
        nonce: to-hex nonce
        gas-price: to-hex gas-price
        value: to-hex "0"
        gas: to-hex $gas-estimate
        to: $recipient
        from: address
        data: $data
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
    
abi = [{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"payable":true,"stateMutability":"payable","type":"fallback"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Transfer","type":"event"}]
get-contract-instance = (web3, addr)->
    | typeof! web3.eth.contract is \Function => web3.eth.contract(abi).at(addr)
    | _ => new web3.eth.Contract(abi, addr)
    
export get-balance = ({ network, address} , cb)->
    web3 = get-web3 network
    contract = get-contract-instance web3, network.address     
    number = contract.balance-of(address)
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