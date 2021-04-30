require! {
    \./calc-wallet.ls
    \./transactions.ls : { load-all-transactions }
    \./load-rates.ls
    \./workflow.ls : { run, task }
}
refresh-txs = (web3, store, cb)->
    store.current.transactions-are-loading = yes
    clear-timer = (cb)->
        delete cb.timer
        console.log "cleanup timer"
        clear-timeout cb.timer
    reset-request = ->
        store.current.transactions-are-loading = no 
        clear-timer cb  
    cb.timer = set-timeout reset-request, 25000   
    task1 = task (cb)->
        load-all-transactions store, web3, cb
    <- run [ task1 ] .then
    console.log "load finish"
    store.current.transactions-are-loading = no
    return cb null
module.exports = refresh-txs