require! {
    \./api.ls : { get-balance }
    \./math.ls : { times, plus }
    \prelude-ls : { find, map, each, pairs-to-obj, foldl, filter }
    \./workflow.ls : { run, task }
    \./round5.ls
    \./round-human.ls
    #\./pending-tx.ls : { get-pending-amount }
}
calc-wallet = (store, token, cb)->
    return cb "Store is required" if not store?
    { wallets } = store.current.account
    { rates } = store
    current = {token-index:0}
    index = 0
    wallets |> each (it)-> 
        if it.coin.token is token then
            console.log "found index" index
            current.token-index = index
        index++
    wallet = wallets |> find (-> it.coin.token is token)
    return cb null if not wallet?
    state =
        balance-usd: 0
    build-loader = (wallet)-> task (cb)->
        { token } = wallet.coin
        token = wallet.coin.token.to-lower-case!
        usd-rate = rates[token] ? \..
        # convert usd-rate to string because bigint does not like number type and can throw exception
        usd-rate = usd-rate + ''
        wallet.usd-rate =
            | usd-rate is \.. => 0
            | _ => round5 usd-rate
        eur-rate = \0.893191
        btc-rate = \0
        wallet.eur-rate =
            | usd-rate is \.. => \..
            | _ => round5 (usd-rate `times` eur-rate)
        wallet.btc-rate =
            | usd-rate is \.. => \..
            | _ => round5 (usd-rate `times` btc-rate)
        err, balance <- get-balance { wallet.address, wallet.network, token, account: { wallet.address, wallet.private-key } }
        console.error "#{token} get-balance error:" err if err?
        balance = "0" if err?
        pending-sent = 0
        wallet.pending-sent = pending-sent
        wallet.balance = balance
        wallet.balance-usd =
            | usd-rate is \.. => 0
            | _ => balance `times` usd-rate
        balance-usd-current =
            | wallet.balance-usd is \.. => 0
            | _ => wallet.balance-usd
        state-before = state.balance-usd
        #convert state.balance-usd to string as bignumber can throw exception for numbers
        state.balance-usd = state.balance-usd + ''
        state.balance-usd = state.balance-usd `plus` balance-usd-current
        cb!   
    loaders =
        [wallet] |> map build-loader
    tasks =
        loaders
            |> map -> [loaders.index-of(it).to-string!, it]
            |> pairs-to-obj
    <- run [tasks] .then
    #store.current.balance-usd = state.balance-usd
    if store.current.account.wallets[current.token-index]?
        store.current.account.wallets[current.token-index] = wallet
    cb null
module.exports = calc-wallet