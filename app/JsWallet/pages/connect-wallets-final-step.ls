require! {
    \react
    \./check-wallet.ls
    \prelude-ls : { map, take, drop, join, keys, each, filter, pairs-to-obj, obj-to-pairs }
    \../seed.ls : seedmem
    \./menu.ls
    \../web3.ls
    \../wallets-funcs.ls
    \./manage-account.ls
    \./token-migration.ls
    \./add-coin.ls : add-coin-page
    \../get-lang.ls
    \../get-primary-info.ls
    \./history.ls
    \../icons.ls
    \./icon.ls
    \../menu-funcs.ls
    \../navigate.ls
    \./your-account.ls
    \../plugin-loader.ls : { get-all-coins, get-all-plugins }
    \../storage.js
}
# .connect-wallets-final-step-1505521367
#     $mobile: 425px
#     $tablet: 800px
#     min-height: 100vh
#     button.btn
#         min-width: auto
#         margin: 0
#     .confirm-button
#         &:disabled
#             opacity: 0.3
#     @keyframes blink-animation
#         50%
#             opacity: 0.3
#     @-webkit-keyframes blink-animation
#         50%
#             opacity: 0.3
#     .blink
#         animation: 1s linear blink-animation  infinite
#         -webkit-animation: 1s linear blink-animation  infinite
#     .entities-loader
#         position: fixed
#         width: 100%
#         left: 0
#         right: 0
#         top: 0
#         bottom: 0
#         height: 100vh
#         text-align: center
#         background: rgba(7, 6, 16, 0.83)
#         .inner-section
#             margin: auto
#             position: absolute
#             height: 100px
#             left: 0
#             right: 0
#             top: 0
#             bottom: 0
#     .goback
#         display: inline-block
#         width: auto
#         padding: 10px 20px
#         float: left
#         cursor: pointer
#         margin-bottom: 40px
#         position: absolute
#         top: 20px
#         left: 20px
#     .container
#         margin: auto
#         margin-top: 50px
#         margin-bottom: 30px
#         @media(max-width: $mobile)
#             max-width: 600px
#         max-width: 85vh 
#         .trust-notification
#             font-size: 14px
#             opacity: 0.7
#             padding: 20px 10px 0px
#             display: block
#         .permissions-list
#             list-style: circle
#             text-align: left
#             max-width: 370px
#             margin: 20px auto 50px
#         .head
#             margin-bottom: 20px
#         .buttons
#             text-align: center
#             >.button
#                 display: inline-block
#                 cursor: pointer
#                 height: 36px
#                 width: 120px
#                 font-weight: bold
#                 font-size: 10px
#                 text-transform: uppercase
#                 border-radius: var(--border-btn)
#                 border: 1px solid #CCC
#                 margin: 15px 5px
#                 padding: 0px 6px
#                 background: transparent
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 white-space: nowrap
#                 &.disabled
#                     opacity: 0.35
#                 .apply
#                     vertical-align: middle
#                     margin-right: 2px
#                 .cancel
#                     vertical-align: middle
#                     margin-right: 2px  
#                 .icon-svg-apply
#                     position: relative
#                     height: 12px
#                     top: 2px
#                     margin-right: 3px
#                     filter: invert(23%) sepia(99%) saturate(1747%) hue-rotate(430deg) brightness(58%) contrast(175%)
#                 .icon-svg-cancel
#                     position: relative
#                     height: 12px
#                     top: 2px
#                     margin-right: 3px
#                     filter: invert(22%) sepia(65%) saturate(7127%) hue-rotate(694deg) brightness(94%) contrast(115%)
#     .your-account
#         position: relative
#         display: block
#         border: 0 !important
#         .tor
#             right: 0px
#             bottom: -27px
#             .tor-content
#                 right: -55px
#                 &:after, &:before
#                     right: 33%
#                     top: -10%
#         .switch-menu
#             right: -1px
#             top: 10px
#             @media(max-width: 480px)
#                 right: -2px
#     @media(max-width: 800px)
#         margin-top: 0px
#     .connect-wallets-inner
#         @import scheme
#         display: flex
#         align-items: center
#         $border: var(--border-btn)
#         $real-height: 300px
#         $cards-height: 296px
#         $pad: 20px
#         $radius: 15px    
#         height: 100vh
#         overflow: auto
#         box-sizing: border-box
#         position: absolute
#         left: 0
#         top: 0
#         bottom: 0
#         $cards-pad: 15px
#         right: 0
#         margin: auto
#         z-index: 2
#         @media(max-width: $mobile)
#             margin: 0
#             height: calc(100vh - 100px)
#         >.arrow
#             position: absolute
#             text-align: center
#             cursor: pointer
#             &.arrow-t
#                 top: 0
#                 margin-top: 10px
#             &.arrow-d
#                 bottom: 0
#                 margin-bottom: 10px
#                 transform: rotate(180deg)
#             &:not(.true)
#                 >.arrow-d
#                     visibility: hidden
#             >.arrow-container
#                 display: inline-block
#                 width: 100%
#                 max-width: 450px
#                 position: relative
#         padding-top: 20px
#         .wallet-container
#             overflow: hidden
#             overflow-y: auto
#             border-radius: 0 0 $border $border
#             max-height: 500px
#             border-top: 1px solid #213040
#             @media(max-width: $mobile)
#                 max-height: 100vh
#                 height: auto
#                 margin-bottom: 0px
#             .wallet
#                 background: var(--bg-secondary)
#                 &:last-child
#                     margin-bottom: -1px
#                 &.big
#                     background: var(--bg-secondary)
#             @media(max-width: $mobile)
#                 border-width: 1px 0 0 0 !important
#         .switch-account
#             float: right
#             line-height: 2
#             right: 20px
#             position: relative
#             display: inline-flex
#             .ckeck
#                 color: #3cd5af
#             .cancel
#                 color: #c25b5f
#             .name
#                 text-overflow: ellipsis
#                 white-space: nowrap
#                 overflow: hidden
#                 width: 90px
#                 text-align: right
#                 cursor: default
#             input
#                 outline: none
#                 width: 100px
#                 margin-top: -6px
#                 height: 36px
#                 line-height: 36px
#                 border-radius: 0px
#                 padding: 0px 10px
#                 font-size: 12px
#                 opacity: 1
#             span
#                 cursor: pointer
#             .icon
#                 vertical-align: middle
#                 margin-left: 20px
#                 transition: transform .5s
#                 &.rotate
#                     transform: rotate(180deg)
#                     transition: transform .5s
#         .h1
#             font-size: 12px
#             text-transform: uppercase
#             letter-spacing: 2px
#             opacity: .8
#         .icon-svg1
#             position: relative
#             height: 16px
#             top: 2px
#         .icon-svg2
#             position: relative
#             height: 10px
#         .header
#             margin: 0 auto
#             border-left: 1px solid var(--border)
#             border-right: 1px solid var(--border)
#             @media(max-width: $mobile)
#                 border: 0
#     .wallet
#         .wallet-middle
#             width: 100%
#             padding: 10px 12px
#             box-sizing: border-box
#             color: #A8BACB
#             font-size: 14px
#             margin-top: 5px
#             text-align: center
#             position: relative
#             display: inline-block
#             height: auto
#             border: 0 !important
#             .address-holder
#                 div
#                     a
#                         padding-right: 10px
#             &.title-balance
#                 display: none
                
network-wallets =   
    velas:    <[ vlx_native vlx2 vlx_evm syx syx2 ]> 
    ethereum: <[ eth usdt_erc20 ]>
    bitcoin:  <[ btc usdt ]>
    litecoin: <[ ltc ]> 
                
connect-wallets = ({ store, web3t })->
    return null if store.connected-wallet.status.queried is no
    chromeStorage = new storage()
    { current, open-account, lock, wallet-style, info, refresh, lock } = menu-funcs store, web3t
    { wallets, go-up, can-up, go-down, can-down } = wallets-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    
    /* Props */
    all-groups-arr = -wallets |> keys
    accounts-to-connnect = 
        | store.connectedWallet.tempChosenGroups.length is all-groups-arr.length =>
            "all your networks of account"
        | _ => 
            ending = 
                | store.connected-wallet.tempChosenGroups.length > 1 => "s"
                | _ => ""
            accs = store.connected-wallet.tempChosenGroups |> map (-> it.to-upper-case!) |> join (", ")
            "#{accs} network#{ending}" 
    btn-disabled = store.connectedWallet.importing-networks is yes
    
    /* Styles */
    icon-color-style=
        filter: info.app.icon-filter
    border-style-w =
        border: "1px solid #{style.app.border}"
        background: "#{style.app.input}99"
    border-style =
        border-top: "1px solid #{style.app.border}"
    row =
        display: "flex"
        height: "100vh"
        margin-left: "60px"
    left-side =
        width: "45%"
    right-side =
        width: "55%"
        border-left: "1px solid #{style.app.border}"
    header-style =
        border-top: "1px solid #{style.app.border}"
        padding: "17px 0px 20px"
        color: style.app.text
        text-align: "left"
    input=
        background: style.app.wallet
        border: "1px solid #{style.app.border}"
        color: style.app.text
    header-left =
        margin-left: "10px"
    border-right=
        border-right: "1px solid #{style.app.border}"
    logo-style = 
        width: "30px"
        margin-left: "10px"
    button-style=
        color: style.app.text
    subtitle-style =
        margin-top: "-10px"
        
    /* Action Listeners */
    cancel = ->
        store.connected-wallet.tempChosenGroups = []
        go-to-home!   
    /*
    * Get chosen networks object.
    * @param   { Object } <key: NETWORK_NAME, value: <Array>[] wallets> - Tokens networks 
    * @returns { Object } <key: NETWORK_NAME, value: <Array>[] wallets> - Object of chosen networks.
    * */
    getChosenNetworksObject = (tokens-networks)->
        /* Get all chosen groups */
        tempChosenGroups = store.connectedWallet.tempChosenGroups
        tokens-networks 
            |> keys
            |> filter (name)->
                name in tempChosenGroups
            |> map (it)-> [ it, tokens-networks[it] ]
            |> pairs-to-obj    

    install-chosen-plugins = ([plugin, ...rest], cb)->
        return cb null if not plugin?
        console.log "trying to install plugin" , { plugin }
        store.connectedWallet.installedPlugin = plugin
        #try
        err <- web3t.install-quick plugin
        console.log "error" {err} if err?
        #catch e
            #console.log "error" {e}
        #return cb err if err?
        install-chosen-plugins(rest, cb) 
        
    confirm = ->
        console.log "confirm"
        cb = console.log
        store.connectedWallet.importing-networks = yes
        whom = store.connected-wallet.activeTab
        #return if not whom?
        
        /* Get all chosen groups */
        tempChosenGroups = store.connectedWallet.tempChosenGroups
        
        /* Get all wallets assosiated to selected groups */
        all-plugins = get-all-plugins(store)
        console.log "all-plugins" all-plugins
        
        selected-wallets = {arr:[]}
        tempChosenGroups 
            |> filter (group)-> 
                network-wallets[group]?
            |> each (group)->
                tokens = network-wallets[group]
                console.log "tokens1" tokens
                selected-wallets.arr = selected-wallets.arr ++ [...tokens]
        
        if selected-wallets.arr.length is 0
            store.connectedWallet.importing-networks = no
            return cb "Selected wallets length must be more than 0"  
        
        /* Get only chosen plugins by client */
        chosen-plugins = all-plugins |> filter (-> it.token in selected-wallets.arr)
        
        /* Check if seleted wallets are available in wallet and if its not, try to activate them. */ 
        err <- install-chosen-plugins(chosen-plugins)
        return cb err if err?
        
        /* Check if origin in the conected-sites array */ 
        origin = store.connected-wallet.origin
        
        /* Prepare chosen networks object for sending back to client */
        /* { ethereum: [], btc: [], ... } */
        chosenNetworks = getChosenNetworksObject( network-wallets )       
        console.log "Result chosenNetworks:" chosenNetworks     
        return cb "chosenNetworks object is empty" if Object.keys(chosenNetworks).length <= 0 
        store.connected-wallet.chosenNetworks = chosenNetworks
        
        #store.connected-wallet.chosenAccounts = [ ...store.connected-wallet.tempChosenAccounts ]
        store.connected-wallet.isConnecting = yes
        
        /* Add networks for origin */
        store.connected-wallet.connected-sites["#{origin}"] = store.connected-wallet.chosenNetworks 
        
        /* Add data to the chrome local storage */
        #connected-sites-copy = ^^store.connected-wallet.connected-sites
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
                
        store.connectedWallet.importing-networks = no

        return if not chrome?tabs?query?
        tabs <- chrome.tabs.query { currentWindow: true active: true }
        activeTab = tabs?0

        response <- chrome.tabs.sendMessage whom, {'networks': store.connected-wallet.chosenNetworks, method: "inject-chosen-accounts"}
        console.log "confirm response", response 
        store.connected-wallet.isConnecting = no
        go-to-home!
        /* Force extension to close itself */ 
        #open(location, '_self').close()
    go-to-home = ->
        store.connected-wallet.status.queried = no
        navigate store, web3t, "wallets"
    go-back = ->
        store.connected-wallet.status.queried = yes
        navigate store, web3t, "wallets"
        
        
    /* Render */
    react.create-element 'div', { key: "wallets", className: 'connect-wallets-final-step connect-wallets-final-step-1505521367' }, children = 
        manage-account { store, web3t }
        token-migration { store, web3t }
        add-coin-page { store, web3t }
        react.create-element 'div', { key: "wallets-body", className: 'connect-wallets-inner' }, children = 
            react.create-element 'div', { on-click: go-back, className: 'goback' }, children = 
                react.create-element 'img', { src: "#{icons.arrow-left}", style: icon-color-style, className: 'icon-svg' }
            react.create-element 'div', { className: 'container' }, children = 
                react.create-element 'div', { className: 'head' }, children = 
                    react.create-element 'h3', { className: 'site-to-connect' }, ' Connect ' + store.connected-wallet.site + '        '
                        """ to"""
                        react.create-element 'span', { className: 'account-count' }, ' ' + accounts-to-connnect + ' '
                react.create-element 'span', { className: 'trust-notification' }, children = 
                    """ Allow this sites to:"""
                react.create-element 'ul', { className: 'permissions-list' }, children = 
                    react.create-element 'li', { key: "permissions-item1" }, ' View the addresses of your permitted account'
                    react.create-element 'li', { key: "permissions-item2" }, ' Sign the transactions of your permitted account'
                react.create-element 'div', { className: 'confirmation' }, children = 
                    react.create-element 'div', { className: 'buttons' }, children = 
                        react.create-element 'button', { on-click: cancel, style: button-style, id: "prompt-close", className: 'button' }, children = 
                            react.create-element 'span', { className: 'cancel' }, children = 
                                react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg-cancel' }
                                """ #{lang.cancel}"""
                        react.create-element 'button', { on-click: confirm, style: button-style, id: "connect-prompt-confirm", disabled: btn-disabled, className: 'button confirm-button' }, children = 
                            react.create-element 'span', { className: 'apply' }, children = 
                                react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-apply' }
                                """ Connect"""
                if store.connected-wallet.isConnecting is yes then
                    react.create-element 'span', { className: 'entities-loader' }, children = 
                        react.create-element 'span', { className: 'inner-section' }, children = 
                            react.create-element 'h3', { className: 'item blink' }, ' Connecting...'
module.exports = connect-wallets