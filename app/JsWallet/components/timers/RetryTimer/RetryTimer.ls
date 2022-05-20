require! {
    \react 
    \prelude-ls : { sort-by, reverse, filter, map, find, take, obj-to-pairs }
    \../../../history-funcs.ls
    \../../../get-primary-info.ls
    \../../../get-lang.ls
#    \./icon.ls
    \../../../icons.ls
    \../../../components/popups/loading.ls
    \../../../components/button.ls
    \../../../transactions.ls
    \../../../math.ls : { times, div, minus }
}

# .retry-component-215900713
#     position: absolute;
#     right: 0;
#     bottom: 10%;
#     margin-top: 0
#     margin: auto
#     width: auto;
#     z-index: 99999
#     border-radius: 4px
#     overflow: hidden
#     &.loading
#         .head
#             top: 0
#         button
#             border: none !important
#     .head
#         opacity: 1
#         position: relative;
#         top: 4px
       
#     .error-message
#         float: left
#         padding: 5px 10px
#         opacity: 1
#         font-weight: 100
#         font-size: 13px
#         position: relative;
#         top: 5px
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
#     .retry-btn-loading
#         height: 100%
#         display: block
#         border: none        

loader = ->
    react.create-element 'div', { className: 'loader-ios' }, children = 
        react.create-element 'svg', { width: '15px', height: '15px', viewBox: '0 0 15 15', version: '1.1', xmlns: 'http://www.w3.org/2000/svg' }, children = 
            react.create-element 'path', { d: 'M10.3866667,5.83333333 C10.2338889,5.56722222 10.3238889,5.22777778 10.5894444,5.07388889 L13.2333333,3.54555556 C13.5011111,3.39388889 13.8416667,3.48444444 13.9944444,3.75 C14.1477778,4.01611111 14.0583333,4.35666667 13.7922222,4.50777778 L11.1455556,6.03611111 C10.8794444,6.18944444 10.5405556,6.09833333 10.3866667,5.83333333 Z' }
            react.create-element 'path', { d: 'M8.96277778,3.85444444 L10.4905556,1.20722222 C10.6438889,0.941666667 10.9844444,0.85 11.25,1.00388889 C11.5161111,1.15722222 11.6061111,1.49611111 11.4527778,1.76277778 L9.92611111,4.40833333 C9.77277778,4.675 9.43277778,4.76666667 9.16666667,4.61277778 C8.90055556,4.45944444 8.80888889,4.11888889 8.96277778,3.85444444 Z' }
            react.create-element 'path', { d: 'M7.49944444,4.16666667 C7.19277778,4.16666667 6.94388889,3.91777778 6.94388889,3.61055556 L6.94388889,0.555555556 C6.94388889,0.247777778 7.19277778,0 7.49944444,0 C7.80722222,0 8.05666667,0.248333333 8.05666667,0.555555556 L8.05666667,3.61055556 C8.05555556,3.91833333 7.80722222,4.16666667 7.49944444,4.16666667 Z' }
            react.create-element 'path', { d: 'M4.61277778,5.83333333 C4.45888889,6.09833333 4.11944444,6.18944444 3.85444444,6.03611111 L1.20833333,4.50777778 C0.942777778,4.35666667 0.851111111,4.01611111 1.00444444,3.75 C1.15833333,3.48388889 1.49888889,3.39333333 1.76388889,3.54555556 L4.40944444,5.07388889 C4.67555556,5.22777778 4.76666667,5.56722222 4.61277778,5.83333333 Z' }
            react.create-element 'path', { d: 'M5.07388889,4.40944444 L3.54611111,1.76333333 C3.39277778,1.49666667 3.48444444,1.15777778 3.74888889,1.00444444 C4.015,0.850555556 4.35444444,0.941111111 4.50833333,1.20777778 L6.03611111,3.855 C6.18833333,4.11944444 6.09833333,4.45944444 5.83222222,4.61277778 C5.56722222,4.76722222 5.22722222,4.675 5.07388889,4.40944444 Z' }
            react.create-element 'path', { d: 'M3.61055556,8.05555556 L0.555555556,8.05555556 C0.247777778,8.05555556 0,7.80666667 0,7.5 C0,7.19222222 0.248333333,6.94388889 0.555555556,6.94388889 L3.61055556,6.94388889 C3.91722222,6.94388889 4.16666667,7.19277778 4.16666667,7.5 C4.16666667,7.80666667 3.91777778,8.05555556 3.61055556,8.05555556 Z' }
            react.create-element 'path', { d: 'M4.61277778,9.16777778 C4.76666667,9.43333333 4.67555556,9.77222222 4.41,9.92666667 L1.76444444,11.4538889 C1.49888889,11.6055556 1.15833333,11.5161111 1.00444444,11.2505556 C0.851111111,10.9844444 0.942777778,10.6455556 1.20833333,10.4905556 L3.85388889,8.96388889 C4.11944444,8.80888889 4.45888889,8.90055556 4.61277778,9.16777778 Z' }
            react.create-element 'path', { d: 'M6.03666667,11.1455556 L4.50888889,13.7938889 C4.355,14.0577778 4.01444444,14.1488889 3.74944444,13.995 C3.48444444,13.8411111 3.39277778,13.5027778 3.54666667,13.2366667 L5.07444444,10.59 C5.22833333,10.325 5.56777778,10.2355556 5.83333333,10.3872222 C6.09888889,10.5411111 6.18944444,10.8805556 6.03666667,11.1455556 Z' }
            react.create-element 'path', { d: 'M7.49944444,10.8344444 C7.80722222,10.8344444 8.05666667,11.0833333 8.05666667,11.3911111 L8.05666667,14.4455556 C8.05666667,14.7511111 7.80777778,15.0005556 7.49944444,15.0005556 C7.19277778,15.0005556 6.94388889,14.7522222 6.94388889,14.4455556 L6.94388889,11.3911111 C6.94388889,11.0833333 7.19222222,10.8344444 7.49944444,10.8344444 Z' }
            react.create-element 'path', { d: 'M9.92611111,10.59 L11.4527778,13.2366667 C11.6055556,13.5027778 11.5155556,13.8411111 11.25,13.995 C10.9838889,14.1483333 10.6438889,14.0572222 10.4905556,13.7938889 L8.96277778,11.1455556 C8.80944444,10.8805556 8.90111111,10.5411111 9.16666667,10.3872222 C9.43277778,10.2355556 9.77277778,10.325 9.92611111,10.59 Z' }
            react.create-element 'path', { d: 'M10.3866667,9.16777778 C10.54,8.90111111 10.8794444,8.80888889 11.145,8.96388889 L13.7922222,10.4905556 C14.0583333,10.6455556 14.1477778,10.9844444 13.9944444,11.2505556 C13.8416667,11.5166667 13.5011111,11.6061111 13.2333333,11.4538889 L10.5894444,9.92666667 C10.3238889,9.77222222 10.2338889,9.43277778 10.3866667,9.16777778 Z' }
            react.create-element 'path', { d: 'M14.4433333,6.94388889 L11.3872222,6.94388889 C11.0805556,6.94388889 10.8311111,7.19277778 10.8311111,7.5 C10.8311111,7.80666667 11.0794444,8.05555556 11.3872222,8.05555556 L14.4433333,8.05555556 C14.7511111,8.05555556 15,7.80666667 15,7.5 C15,7.19222222 14.7511111,6.94388889 14.4433333,6.94388889 Z' }

interval = null

module.exports = (props) ->   

    { store, wallet, web3t, isLoading } = props  
    { token } = wallet.coin

    show = token? and store.transactions.errors[token]? or isLoading
    return null if not show
#    { store, wallet, wb3t } = props  
#    token = wallet?coin?token
#    trxsFetchingIsFailed = token? and store.transactions.errors[token]?  
#    return null if trxsFetchingIsFailed isnt yes
    
#    style = get-primary-info(store)
    formatTime = (msec)->
        msec `div` 1000
    
    { timerStart, retryInMS, timeoutMS, maxTries } = store.retry
    _retryInMS = formatTime(retryInMS)
    
    text-retry = 
        | store.retry.retryInMS <= 0 => ""
        | _ => "Retry in #{_retryInMS} sec."
    
    text = 
        | isLoading => "Fetching transactions..."
        | _ => "Failed to fetch transactions. #{text-retry}" 


    makeQuery = ->
        if (timerStart `plus` retryInMS) < Date.now!
            retryInMS = retryInMS - 1
            return
        stop!  
        err <- transactions.load-transactions(store, web3t, token)
        
    loading-class = 
        | isLoading => "loading"
        | _ => ""       

    start = ->
        console.log "Timer [start]"
        timerStart = Date.now!
        interval = set-interval makeQuery, 1000 


    stop = ->
        clearInterval interval
        
    retry = ->
        stop!
        transactions.load-transactions(store, web3t, token)
    
    style = get-primary-info store
    button-style=
        color: style.app.text
        border-right: "1px solid #{style.app.border}"
        border-left: "1px solid #{style.app.border}"
    
    /* Render */
  
    react.create-element 'div', { className: "#{loading-class} retry-component retry-component-215900713" }, children = 
        react.create-element 'div', { className: 'error-message' }, children = 
            react.create-element 'span', { className: 'head' }, ' ' + text + ' '
        react.create-element 'div', { className: 'retry-button' }, children = 
            if isLoading is yes
                react.create-element 'button', { style: button-style, className: 'btn btn-primary loading' }, children = 
                    react.create-element 'span', {}, children = 
                        loader!
            else
                button { store, text: \Retry, on-click: retry, icon: \restore, id: "retry-btn" classes: "retry-btn-loading"}