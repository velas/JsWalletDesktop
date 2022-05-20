require!{
    \../../../math.ls : { times, div, minus, plus }
    \../../../transactions.ls
}



timers = {}
interval = null

retry-timer = (props) ->   

    { store, wallet, web3t } = props
    
    { token } = wallet.coin   

    state = {
        timer: null
        counter: 0
    }
    
    tick = ->
        @setState({
          counter: @state.counter + 1
        })
      

#    { store, wallet, wb3t } = props  
#    token = wallet?coin?token
#    trxsFetchingIsFailed = token? and store.transactions.errors[token]?  
#    return null if trxsFetchingIsFailed isnt yes
    
    formatTime = (msec)->
        msec `div` 1000
    
    { timerStart, retryInMS, timeoutMS, maxTries, currentTry } = store.retry
    _retryInMS = formatTime(retryInMS)


    makeQuery = ->
#        console.log "[makeQuery]" {timerStart, retryInMS, now: Date.now!}
        if store.retry.maxTries < store.retry.currentTry
            store.transactions.isLoading[token] = no
            console.log "MAX TRIES"
            return stop! 
        if (store.retry.retryInMS > 0)
            store.retry.retryInMS = store.retry.retryInMS - 1000
            return
        stop!
        store.retry.currentTry++
        console.log "query transactions..."  
        err <- transactions.load-transactions(store, web3t, token)      

    start = ->
        store.retry.maxTries = 3
        <- set-timeout _ ,10
        retry-timer.start = yes
        console.log "Timer [start]"
        store.retry.timerStart = Date.now!
        retry-timer.interval = set-interval makeQuery, 1000 


    stop = ->
        retry-timer.start = no
        clearInterval retry-timer.interval
        
    retry = ->
        stop!
        
    
    export start
    export stop    
    out$
    
module.exports = retry-timer