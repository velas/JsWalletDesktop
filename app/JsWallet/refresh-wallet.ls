require! {
    \./calc-wallet.ls
    \./load-rates.ls
    \./workflow.ls : { run, task }
}
refresh-wallet = (web3, store, cb)->
    store.current.refreshing = yes
    task1 = task (cb)->
        load-rates store, cb
    task3 = task (cb)->
        calc-wallet store, cb 
    <- run [ task1, task3] .then
    store.current.refreshing = no
    cb null
module.exports = refresh-wallet