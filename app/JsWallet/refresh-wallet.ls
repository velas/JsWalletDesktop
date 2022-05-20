require! {
    \./calc-wallet.ls
    \./get-market-coins-history.ls
    \./load-rates.ls
    \./workflow.ls : { run, task }
}
refresh-wallet = (web3, store, cb)->
    return cb null if store.forceReload isnt yes
    store.current.refreshing = yes 
    task1 = task (cb)->
        load-rates store, cb
    task3 = task (cb)->
        calc-wallet store, cb 
    task4 = task (cb)->
        get-market-coins-history store, cb 
    <- run [ task1, task3 ] .then
    store.current.refreshing = no
    store.forceReload = no
    cb null
module.exports = refresh-wallet