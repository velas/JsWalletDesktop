require! {
    \./calc-wallet.ls
    \./transactions.ls : { load-all-transactions }
    \./load-rates.ls
    \./workflow.ls : { run, task }
}
refresh-txs = (web3, store, cb)->
    return cb null if store.forceReload isnt yes and store.forceReloadTxs isnt yes
    store.current.transactions-are-loading = yes
    clear-timer = (cb)->
        delete cb.timer
        clear-timeout cb.timer
    reset-request = ->
        store.current.transactions-are-loading = no 
        clear-timer cb  
    cb.timer = set-timeout reset-request, 25000   
    task1 = task (cb)->
        load-all-transactions store, web3, cb
    <- run [ task1 ] .then
    store.current.transactions-are-loading = no
    store.forceReloadTxs = no
    return cb null
module.exports = refresh-txs