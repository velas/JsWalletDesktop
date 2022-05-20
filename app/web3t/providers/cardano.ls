require! {
    \keythereum
    \qs : { stringify }
    \prelude-ls : { filter, map, foldl, each, sort-by, reverse }
    \../math.js : { plus, minus, times, div, from-hex, $toHex }
    \./superagent.js : { get, post }
    \bip39
    \buffer : { Buffer }
}

get-dec = (network)->
    { decimals } = network
    10^decimals

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

try-parse = (data, cb)->
    <- set-immediate
    return cb null, data if typeof! data.body is \Object
    console.log data if typeof! data?text isnt \String
    return cb "expected text" if typeof! data?text isnt \String
    try
        data.body = JSON.parse data.text
        cb null, data
    catch err
        cb err

export get-keys = ({ network, mnemonic, index }, cb)->
    err, account <- newAccount(mnemonic)
    console.log {account}
    #tx = "https://explorer.cardano-testnet.iohkdev.io/en/transaction?id=60c18a70118cfe977eafbf2a1321bee157d682d1ac883bb8ce9cb8441728431a#:~:text=addr_test1qq7y48...yun0ngf2rqnh756v"
    #address = "addr_test1qq7y48q6ccyeyd3789u6md2u3wsngvx8va9tyvtwypqh7dym336hjry22u7a6ctwvwcph5x3he682vp38syun0ngf2rqnh756v"    
    #private-key = ""
    #public-key = address
    cb null, { account.address, account.private-key, public-key: account.address }

newAccount = (pass, cb)-> 
    password = pass 
    params = { keyBytes: 32, ivBytes: 16 }
    dk <- keythereum.create(params)
    keyObject = keythereum.dump(password, dk.privateKey, dk.salt, dk.iv)
    address = keyObject.address
    private-key = $toHex(dk.private-key)
    
#    entropy = bip39.mnemonicToEntropy(password)
#    rootKey = CardanoWasm.Bip32PrivateKey.from_bip39_entropy(Buffer.from(entropy, 'hex'),Buffer.from(''))
      
    
    #keythereum.exportToFile(keyObject, this.keystore)
    #cb null, keythereum.privateKeyToAddress(dk.privateKey)
    cb null, { address, private-key }
    
export get-balance = ({network, address} , cb)->
    dec = get-dec network
    err, number <- make-query network, \eth_getBalance , [ address, \latest ]
    return cb err if err?
    balance = number `div` dec
    cb null, balance

export calc-fee = ({ network, fee-type, account, amount, to, data, gas-price, gas }, cb)->
    cb null, "0"  
    
export get-transactions = ({ network, address }, cb)->
    cb null, []
    
export create-transaction = ({ network, account, recipient, amount, amount-fee, data, fee-type, tx-type, gas-price, gas } , cb)-->
    cb null, { rawtx: "0x" }
    
export push-tx = ({ network, rawtx } , cb)-->
    err, txid <- make-query network, \eth_sendRawTransaction , [ rawtx ]
    return cb "cannot get signed tx - err: #{err.message ? err}" if err?
    cb null, txid
    
