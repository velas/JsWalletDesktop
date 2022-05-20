require! {
    \react 
    \prelude-ls : { sort-by, reverse, filter, map, find, take, obj-to-pairs }
    \../history-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
#    \./icon.ls
    \../icons.ls
    \../components/popups/loading.ls
    \../components/button.ls
    \../transactions.ls
    \../math.ls : { times, div, minus }
}

# .retry-component522311074
#     position: absolute;
#     right: 0;
#     bottom: 10%;
#     margin-top: 0
#     margin: auto
#     width: auto;
#     z-index: 99999
#     border: 1px solid rgba(255, 255, 255, 0.28)
#     border-radius: 18px
#     overflow: hidden
#     .head
#         opacity: 1
#     .error-message
#         float: left
#         padding: 5px 10px
#         opacity: 1
#         font-weight: 100
#         font-size: 13px
#         position: relative;
#         top: 5px
#         box-shadow: 1px 12px 12px #71f4c0;
#         padding: 0 15px;
#         .icon
#             margin-right: 10px
#     .retry-button
#         float: left
#         img
#             filter: invert(1)
#         button
#             width: auto
#             background: white !important
#             color: white
#             margin: auto


interval = null

module.exports = (props) ->   

    { store, wallet, web3t } = props  

    state = {
        timer: null
        counter: 0
    }
    
    componentDidMount = ->
        timer = setInterval(@tick, 1000)
        @setState({timer})
        
    componentWillUnmount = ->
        clearInterval(@state.timer)
        
    tick = ->
        @setState({
          counter: @state.counter + 1
        })
      

#    { store, wallet, wb3t } = props  
#    token = wallet?coin?token
#    trxsFetchingIsFailed = token? and store.transactions.errors[token]?  
#    return null if trxsFetchingIsFailed isnt yes
    
#    style = get-primary-info(store)
    formatTime = (msec)->
        msec `div` 1000
    
    { timerStart, retryInMS, timeoutMS, maxTries } = store.retry
    _retryInMS = formatTime(retryInMS)


    makeQuery = ->
        console.log "[makeQuery]"
        if (timerStart `plus` retryInMS) < Date.now!
            retryInMS = retryInMS - 1
            return
        stop!  
        err <- transactions.load-transactions(store, web3t, token)      

    start = ->
        console.log "Timer [start]"
        timerStart = Date.now!
        interval = set-interval makeQuery, 1000 


    stop = ->
        clearInterval interval
        
    retry = ->
        stop!
    
       
    react.create-element 'div', { className: 'retry-component retry-component522311074' }, children = 
        react.create-element 'div', { className: 'error-message' }, children = 
            react.create-element 'span', { className: 'head' }, ' Failed to fetch transactions. Retry in ' + _retryInMS + ' sec. '
        react.create-element 'div', { className: 'retry-button' }, children = 
            button { store, text: \Retry , on-click: retry, icon: \restore, id: "retry" }