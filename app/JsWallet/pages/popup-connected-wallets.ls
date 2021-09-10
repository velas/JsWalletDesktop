require! {
    \react
    \prelude-ls : { keys, map, filter, find, obj-to-pairs, pairs-to-obj }
    \./loading2.ls
    \../web3.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../icons.ls
    \../../web3t/providers/superagent.ls : { get }
    \../navigate.ls
    \../storage.js
}
# .manage-connected-wallets-1150372072
#     @import scheme
#     @keyframes bounceIn
#         from
#             opacity: 0
#             transform: scale3d(0.8, 0.8, 0.8)
#         to
#             opacity: 1
#             transform: scale3d(1, 1, 1)
#     position: absolute
#     width: 100%
#     top: 0
#     z-index: 999
#     padding-top: 5%
#     box-sizing: border-box
#     padding: 10px
#     background: rgba(black, 0.08)
#     backdrop-filter: blur(5px)
#     height: 100vh
#     .cover
#         height: 100vh
#         align-items: center
#         vertical-align: middle
#         display: flex
#     .account-body
#         left: 0
#         right: 0
#         top: 0;
#         bottom: 0;
#         margin: auto
#         display: inline-table
#         min-height: 360px
#         max-width: 600px
#         display: inline-block
#         animation-duration: 0.5s
#         animation-name: bounceIn
#         background: white
#         width: 100%
#         border-radius: var(--border-btn)
#         position: relative
#         overflow: hidden
#         box-shadow: 17px 10px 13px #0000001f, -6px 10px 13px #00000024
#         .closed
#             position: absolute
#             z-index: 3
#             padding: 10px 20px
#             font-size: 20px
#             right: 0
#             top: 0
#             cursor: pointer
#             &:hover
#                 color: #CCC
#         .account-body-inner
#             margin: auto
#             padding: 20px
#         .title
#             z-index: 999
#             top: 0
#             box-sizing: border-box
#             width: 100%
#             color: gray
#             font-size: 22px
#             .search-content
#                 position: relative
#                 padding: 0 10px
#                 @media (max-width: 580px)
#                     padding: 0
#                 .search
#                     margin-top: 10px
#                     border: 1px solid #CCC
#                     padding: 9px
#                     border-radius: var(--border-btn)
#                     width: 100%
#                     padding-left: 35px
#                     box-sizing: border-box
#                     font-size: 13px
#                     outline: none
#                 .icon
#                     top: 6px
#                     left: 20px
#                     position: absolute
#                     @media (max-width: 580px)
#                         left: 10px
#         .settings
#             padding-top: 0px
#             padding-bottom: 30px
#             max-height: calc(65vh - 180px)
#             overflow-y: scroll
#             .section
#                 position: relative
#                 min-height: 150px
#                 .list
#                     height: 80%
#                     padding: 10px
#                     margin: auto 10px
#                     @media (max-width: 580px)
#                         padding: 10px 0
#                     .network-container
#                         border: 1px solid #eeeeee26
#                         padding: 0 10px 10px 10px
#                         margin-bottom: 30px
#                         .network-title
#                             font-weight: 100
#                             text-transform: capitalize
#                             margin-bottom: 0
#                             margin-top: 0
#                             position: relative
#                             top: -17px
#                             display: inline-block
#                             padding: 5px 20px
#                             background: ""
#                         .connected-wallets-list
#                             white-space: nowrap
#                             height: 60px
#                             overflow: auto
#                     .item
#                         margin-bottom: 10px
#                         margin-right: 10px
#                         display: inline-block
#                         background: #642dbd
#                         border-radius: var(--border-btn)
#                         padding: 10px
#                         text-align: left
#                         box-sizing: border-box
#                         width: auto
#                         @media (max-width: 580px)
#                             width: 100%
#                             float: none
#                         &:nth-child(odd)
#                             margin-right: 10px
#                             @media (max-width: 580px)
#                                 margin-right: 0
#                         >*
#                             display: inline-block
#                             vertical-align: middle
#                             box-sizing: border-box
#                         .logo 
#                             img
#                                 width: 30px
#                                 height: 30px
#                         input
#                             margin: 0 5px
#                             border-radius: var(--border-btn)
#                             width: calc(100% - 90px)
#                             border: 0
#                             padding: 5px 10px
#                             outline: none
#                             font-size: 15px
#                         img
#                             width: 40px
#                             border-radius: 0px
#                         .title
#                             margin-left: 10px
#                             color: gray
#                             width: auto
#                         button
#                             width: 40px
#                             border-radius: var(--border-btn)
#                             border: 0 !important
#                             box-sizing: border-box
#                             padding: 0
#                             margin: 0
#                             cursor: pointer
#                             color: black
#                             background: transparent
#                             outline: none
#                             &:hover
#                                 color: white
#                                 opacity: .6
#                                 transition: .5s
#                             img
#                                 width: 15px    
#                             >*
#                                 vertical-align: middle
#         .extra-button    
#             display: inline-block
#             cursor: pointer
#             padding: 10px
#             width: auto
#             font-weight: bold
#             font-size: 10px
#             text-transform: uppercase
#             border-radius: var(--border-btn)
#             border: 1px solid #CCC
#             margin: 15px 5px
#             background: transparent
#             text-overflow: ellipsis
#             overflow: hidden
#             white-space: nowrap
create-item = ({ store, web3t }, item)-->
    data = Object.keys(item)
    network = data.0
    $wallets = item[network]   
        
    style = get-primary-info store
    button-style =
        border: "1px solid #{style.app.text}"
        color: style.app.text
    background =
        background: style.app.input
    menu-style=
        color: style.app.text
        fontSize: "16px"
        lineHeight: "auto"
    network-title-style = 
        background: style.app.background 
    build-wallet = (network, item)-->
        wallet = store.current.account.wallets |> find (-> it.coin.token is item)
        return null if not wallet?
        {name, image} = wallet.coin
        title = "#{name}"
        /* Get current opened tab origin */ 
        origin = store.connected-wallet.origin
        chosenNetworks = store.connected-wallet.connected-sites["#{origin}"]
        return null if not chosenNetworks 
        /* methods */
        extension-disconnect = ->
            store.connected-wallet.openStatusBarPopup = no
            store.connected-wallet.wallet-is-removing = yes
            whom = store.connected-wallet.activeTab
            #TODO uncomment in production
            #return if not whom?           
            connected-wallets = chosenNetworks[network]
            connected-wallets.splice(connected-wallets.index-of(item), 1)
            if connected-wallets.length is 0
               delete chosenNetworks[network]
            store.connected-wallet.openStatusBarPopup = yes
            console.log "connected-wallets after removing (-) " connected-wallets   
            /* Update data in the chrome local storage */
            chromeStorage = new storage()
            transform = (obj)->
                obj
                    |> obj-to-pairs
                    |> map (-> [it.0, it.1.slice!])
                    |> pairs-to-obj    
            cloneResult = store.connected-wallet.connected-sites
                |> obj-to-pairs
                |> map (-> [it.0, transform(it.1)])       
                |> pairs-to-obj 
            <- chromeStorage.setItem({connectedVelasSites: cloneResult})
                   
            console.log "store.connected-wallet.connected-sites[#{origin}]" store.connected-wallet.connected-sites["#{origin}"]    
            /* Stop proceding if it is not an extension */
            return if not chrome?tabs?query?
            tabs <- chrome.tabs.query {currentWindow: true, active: true}
            activeTab = tabs?0
            response <- chrome.tabs.sendMessage whom, {'networks': chosenNetworks}
            console.log "response", response 
            <- set-timeout _, 10 
            store.connected-wallet.wallet-is-removing = no
             
        react.create-element 'div', { style: background, className: 'item' }, children = 
            react.create-element 'div', { className: 'logo' }, children = 
                react.create-element 'img', { src: "#{image}" }
            react.create-element 'span', { style: menu-style, className: 'title' }, ' ' + title
            react.create-element 'button', { on-click: extension-disconnect, style: button-style }, children = 
                react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg1' }
        
    react.create-element 'div', { className: 'network-container' }, children = 
        react.create-element 'h3', { style: network-title-style, className: 'network-title' }, ' ' + network + ' Network'
        react.create-element 'div', { className: 'connected-wallets-list' }, children = 
            $wallets |> map build-wallet(network) 
    
            
module.exports = ({ store, web3t } )->
    return null if store.connected-wallet.openStatusBarPopup isnt yes
    network = store.current.network   
    close = ->
        store.connected-wallet.openStatusBarPopup = no
    style = get-primary-info store
    account-body-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
    color =
        color: style.app.text
    lang = get-lang store
    input-style=
        color: style.app.text
        background: style.app.input
        border: "0"
    button-style =
        border: "1px solid #{style.app.text}"
        color: style.app.text
    site = store.connected-wallet.site 
    origin = store.connected-wallet.origin  
    chosenNetworks = store.connected-wallet.connected-sites["#{origin}"] ? {}  
    connected-number = Object.keys(chosenNetworks).length 
    go-to-manual-connect = ->
        store.connected-wallet.status.queried = yes      
        navigate store, web3t, "connectwallets"   
    react.create-element 'div', { className: 'manage-connected-wallets manage-connected-wallets-1150372072' }, children = 
        react.create-element 'div', { className: 'cover' }, children = 
            react.create-element 'div', { style: account-body-style, className: 'account-body' }, children = 
                react.create-element 'div', { on-click: close, className: 'closed' }, children = 
                    icon \X, 20   
                react.create-element 'div', { className: 'account-body-inner' }, children = 
                    react.create-element 'div', { style: color, className: 'title' }, children = 
                        react.create-element 'div', {}, children = 
                            react.create-element 'div', {}, ' ' + site
                            react.create-element 'h6', {}, ' You have ' + connected-number + ' network(s) connected to this site.   '
                    react.create-element 'div', { className: 'settings' }, children = 
                        react.create-element 'div', { className: 'section' }, children = 
                            if connected-number <= 0
                                react.create-element 'div', {}, children = 
                                    react.create-element 'div', {}, ' Velas is not connected this site.\nTo connect site to a web3t, find the connect button on their site.\n\nOr you can manually connect current site.'
                                    react.create-element 'div', { on-click: go-to-manual-connect, style: button-style, className: 'extra-button' }, ' Manually connect'
                            else
                                react.create-element 'div', { className: 'list' }, children = 
                                    chosenNetworks
                                        |> obj-to-pairs
                                        |> map (-> {"#{it.0}":it.1})
                                        |> map create-item { store, web3t }
                    if connected-number > 0
                        react.create-element 'div', { on-click: go-to-manual-connect, style: button-style, className: 'extra-button' }, ' Manually connect'