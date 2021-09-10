require! {
    \react
    \../tools.ls : { money }
    \../math.js : { minus, div, times, plus }
    \prelude-ls : { each, find, map, foldl, filter, keys }
    \../wallet-funcs.ls
    \../get-lang.ls
    \./icon.ls
    \../get-primary-info.ls
    \../../web3t/providers/superagent.ls : { get }
    \../icons.ls
    \../round-human.ls
    \./confirmation.ls : { alert }
    \../components/button.ls
    \../components/address-holder.ls
    \../components/checkbox.ls
    \../plugin-loader.ls : { get-all-coins }
}
# .wallet-2055531996
#     @import scheme
#     $cards-height: 324px
#     $pad: 20px
#     $radius: 15px
#     position: relative
#     cursor: pointer
#     $card-height: 60px
#     min-height: $card-height
#     &.disabled-wallet-item
#         opacity: 0.4
#         filter: grayscale(1)
#         cursor: no-drop
#     &.last
#         height: 60px
#     $mt: 20px
#     box-sizing: border-box
#     overflow: hidden
#     transition: height .5s
#     border: 0px
#     &:first-child
#         margin-top: 0
#         box-shadow: none
#     &:last-child
#         margin-bottom: 0px
#     .pending
#         color: orange
#     &.over
#         background: #CCC
#     &.big
#         display: flex
#         align-items: center
#         margin: 10px
#         &:last-of-type
#             border-bottom: none !important
#     &.active
#     .wallet-middle
#         width: 60%
#         max-width: 250px
#         >.uninstall
#             text-align: left
#             font-size: 10px
#             padding-top: 5px
#         box-sizing: border-box
#         height: 85px
#         float: left
#         padding: 20px
#         border-top: 1px solid rgb(107, 38, 142)
#         border-right: 1px solid rgb(107, 38, 142)
#         &:last-child
#             display: block
#         &:last-child
#             border-right: 0 !important
#         .name
#             color: #fff
#             font-size: 16px
#             font-weight: 700
#             &.per
#                 font-size: 10px
#                 color: orange
#                 font-weight: 100
#             &:last-child
#                 font-size: 10px
#                 text-transform: uppercase
#                 letter-spacing: 2px
#                 margin-top: 5px
#                 opacity: .8
#         .title-balance
#             color: #fff
#             font-size: 14px
#             text-align: left
#         span
#             padding-left: 40px
#         a
#             text-align: left
#     .wallet-top
#         padding: 0 12px 0 0
#         box-sizing: border-box
#         width: 100%
#         color: #677897
#         font-size: 14px
#         text-align: left
#         overflow: hidden
#         >*
#             display: inline-block
#             box-sizing: border-box
#             vertical-align: top
#             line-height: 16px
#         >.top-left
#             width: 100%
#             display: flex
#             text-align: left
#             overflow: hidden
#             text-overflow: ellipsis
#             @media screen and (min-width: 801px)
#                 padding-top: 5px
#             >*
#                 display: inline-block
#                 margin: 0 8px
#             .outer-checkbox
#                 margin-left: 0
#             >.img
#                 vertical-align: top
#                 margin-right: 10px
#                 width: 40px
#                 >img
#                     vertical-align: top
#                     max-width: 50px
#                     $s: 35px
#                     border-radius: 0
#                     height: $s
#                     @media screen and (min-width: 801px)
#                         padding-top: 4px
#             >.info
#                 text-align: left
#                 margin-left: 0px
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 width: auto
#                 @media screen and (max-width: 390px)
#                     display: none
#                 .group-title
#                     text-transform: uppercase
#                 >.name
#                     padding-left: 3px
#                 >.price
#                     font-size: 11px
#                     font-weight: bold
#                     overflow: hidden
#                     text-overflow: ellipsis
#                     opacity: .5
#                     padding: 0
#                     letter-spacing: .4px
#                     &.token
#                         opacity: 1
#                         font-size: 12px
#         .top-middle
#             width: 100%
#             text-align: left
#             .label-coin
#                 height: 16px
#                 top: 3px
#                 padding-left: 4px
#                 position: relative
#             >.balance
#                 &:last-child
#                     font-weight: bold
#                     font-size: 13px
#                 &.title
#                     @media screen and (max-width: 220px)
#                         display: none
#                 .title-balance
#                     display: none
#         .top-right
#             width: 40%  
#             text-align: right
#             .wallet-swap img
#                 filter: invert(1)
#             .icon
#                 vertical-align: sub
#                 .icon-svg-create
#                     height: 9px
#                     transform: rotate(-90deg)
#                     vertical-align: inherit
#                     opacity: .3
#             @media screen and (max-width: 800px)
#                 width: 35%
#                 display: flex
#                 float: right
#                 flex-direction: row-reverse
#             >button
#                 outline: none
#                 margin-bottom: 5px
#                 margin-left: 5px
#                 cursor: pointer
#                 border: 0
#                 $round: 36px
#                 padding: 0
#                 box-sizing: border-box
#                 border-radius: $border
#                 font-size: 10px
#                 width: auto
#                 padding: 0 6px
#                 height: $round
#                 color: #6CA7ED
#                 text-transform: uppercase
#                 font-weight: bold
#                 background: transparent
#                 transition: all .5s
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 width: 80px
#                 .icon-svg
#                     @media screen and (max-width: 800px)
#                         padding: 0
#                 .icon
#                     position: relative
#                     height: 16px
#                     top: 2px
#                 @media screen and (max-width: 800px)
#                     width: 40px
#                     line-height: 30px
cb = console~log
module.exports = (store, web3t, group-name)-->
    #{ button-style, uninstall, active, big, balance, balance-usd, pending, send, receive, swap, expand, usd-rate, last } = wallet-funcs store, web3t, wallets, wallet
    lang = get-lang store
    style = get-primary-info store
    label-uninstall =
        | store.current.refreshing => \...
        | _ => "#{lang.hide}"
    wallet-style=
        color: style.app.text
    border-style =
        border-bottom: "1px solid #{style.app.border}"
    border =
        border-top: "1px solid #{style.app.border}"
        border-right: "1px solid #{style.app.border}"
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    address-input=
        color: style.app.color3
        background: style.app.bg-primary-light
    btn-icon =
        filter: style.app.btn-icon
    icon-color=
        filter: style.app.icon-filter
    placeholder =
        | store.current.refreshing => "placeholder"
        | _ => ""
    placeholder-coin =
        | store.current.refreshing => "placeholder-coin"
        | _ => ""
        
    makeDisabled = store.current.refreshing
    is-loading = store.current.refreshing is yes
       
    /* Array of tokens inthe group */    
    network-wallets = store.connected-wallet.network-wallets[group-name]
    
    if network-wallets.length is 0 then
        throw new Error("Network can not be empty. There is no wallet in the #{group-name} network")
    
    group-index = store.connected-wallet.tempChosenGroups.index-of(group-name)
    disabled-class = ""
    value = store.connected-wallet.tempChosenGroups[group-index] ? null
    isChecked = value?
    
    all-wallets = get-all-coins(store)
    all-groups = store.connected-wallet.network-wallets
    all-groups-arr = store.connected-wallet.network-wallets |> keys
    wallets_keys = all-wallets |> map (-> it.token)
    
    tempChosenGroups = store.connectedWallet.tempChosenGroups
    
    
    /* Methods */
    #remove-wallet-from-chosen = ->
    
    on-change = ->
        if group-index > -1
            store.connectedWallet.tempChosenGroups.splice(group-index, 1)
        else
            store.connectedWallet.tempChosenGroups.push(group-name)
            
        store.connected-wallet.tempChosenGroupsAllChecked = 
            | all-groups-arr.length is tempChosenGroups.length => yes 
            | _ => no   
            
    render-wallets = (group-token)->
        react.create-element 'span', { className: 'group-token' }, ' ' + group-token
            
    /* Render */
    react.create-element 'div', { style: border-style, className: "big wallet wallet-item wallet-2055531996" }, children = 
        react.create-element 'div', { className: 'wallet-top' }, children = 
            react.create-element 'div', { style: wallet-style, className: 'top-left' }, children = 
                checkbox { store, on-change, value="#{value}" checked=isChecked, disabled=no }
                react.create-element 'div', { className: 'info' }, children = 
                    react.create-element 'div', { className: "#{placeholder} balance group-title" }, ' ' + group-name
                    react.create-element 'div', { className: "#{placeholder} price token" }, children = 
                        network-wallets |> map render-wallets
                    