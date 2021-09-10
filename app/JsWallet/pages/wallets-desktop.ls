require! {
    \react
    \./wallet-expanded.ls
    \./wallet.ls
    \./wallet-group.ls
    \prelude-ls : { map, take, drop, filter, find, group-by, sort-by, obj-to-pairs, keys }
    \./menu.ls
    \../web3.ls
    \../wallets-funcs.ls
    \./manage-account.ls
    \./token-migration.ls
    \./add-coin.ls : add-coin-page
    \../get-lang.ls
    \../get-primary-info.ls
    \./history.ls
    \./your-account.ls
    \./icon.ls
    \localStorage
    \../icons.ls
    \../components/header.ls
}
# .wallets-container-378698936
#     @import scheme
#     >.left-side
#         margin-left: $menu
#         @media(max-width: $ipad)
#             margin-left: 0
#     .show-detail
#         background: var(--waves)
#         background-size: cover
#         background-repeat: no-repeat
#         background-position: top right
#         padding: 20px
#         box-sizing: border-box
#     .wallets
#         @import scheme
#         $real-height: 300px
#         $cards-height: 296px
#         $pad: 20px
#         $radius: 15px
#         height: auto
#         box-sizing: border-box
#         position: relative
#         left: 0
#         bottom: 0
#         $cards-pad: 15px
#         right: 0
#         z-index: 2
#         .icon-svg1
#             position: relative
#             height: 16px
#             top: 2px
#         .icon-svg2
#             position: relative
#             height: 10px
#         &.hide-detail
#             .wallet-middle
#                 display: none !important
#             .big
#                 height: 60px
#             .big.active
#                 .icon
#                     transition: all .5s
#                     filter: none !important
#                 button
#                     transition: all .5s
#                     background: #9c41eb !important
#                     border-color: #9c41eb !important
#             .top-right
#                 width: 20% !important
#                 button
#                     &.btn-open
#                         display: block
#                         float: right !important
#                     display: none
#             .top-left
#                 width: 100% !important
#             .top-middle
#                 width: 32% !important
#                 text-align: center !important
#                 .price
#                     display: none
#             .title-balance
#                 display: none
#         .header
#             &:after
#                 position: absolute
#                 font-weight: bold
#                 font-size: 40px
#                 opacity: .05
#                 top: 20px
#                 left: -5px
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
#         .your-account
#             position: absolute
#             width: auto
#             display: inline-block
#             right: 0
#             top: 0
#             padding: 12px 20px
#             border-left: 0
#             .buttons
#                 >.button
#                     width: 20px
#                     padding: 0
#                     outline: none
#         >*
#             width: 100%
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
#         >.wallet-container
#             overflow: hidden
#             overflow-y: auto
#             height: calc(100vh - 60px)
#             width: 100%
#             display: inline-block
#             .wallet
#                 background: var(--bg-secondary)
#                 &.big
#                     background: var(--bg-primary-light)
#                     .icon-svg-create
#                         opacity: 1
#         .history-area
#             max-height: 54vh
#             overflow: auto
#         .info
#             text-align: left
#             margin-left: 0px
#             text-overflow: ellipsis
#             overflow: hidden
#             width: 65px
#             @media screen and (max-width: 390px)
#                 display: none
#             .name
#                 padding-left: 3px
#                 font-size: 16px
#             .price
#                 padding-left: 3px
#                 font-size: 12px
#                 font-weight: bold
#                 overflow: hidden
#                 text-overflow: ellipsis
#         .table
#             width: 100%
#             height: calc(100vh - 260px)
#             margin-top: -1px
mobile = ({ store, web3t })->
    return null if not store.current.account?
    { wallets, go-up, can-up, go-down, can-down } = wallets-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    row =
        display: "flex"
        height: "calc( 100vh - 61px )"
        overflow: "hidden"
    left-side =
        min-width: "200px"
        width: "30%"
        background: "#{style.app.left-side}"
    right-side =
        width: "70%"
        border-left: "1px solid #{style.app.border}"
    header-style =
        border-top: "1px solid #{style.app.border}"
        padding: "17px 0px 20px"
        color: style.app.text
        text-align: "left"
    icon-style=
        filter: style.app.icon-filter
    input=
        background: style.app.wallet
        border: "1px solid #{style.app.border}"
        color: style.app.text
    header-left =
        margin-left: "10px"
    border-right=
        border-right: "1px solid #{style.app.border}"
    open-account = ->
        store.current.switch-account = not store.current.switch-account
    edit-account-name = ->
        store.current.edit-account-name = current-account-name!
    default-account-name = -> "Account #{store.current.account-index}"
    edit-account = (e)->
        #console.log e
        store.current.edit-account-name = e.target.value
    done-edit = ->
        local-storage.set-item default-account-name!, store.current.edit-account-name
        cancel-edit-account-name!
    cancel-edit-account-name = ->
        store.current.edit-account-name = ""
    current-account-name = ->
        local-storage.get-item(default-account-name!) ? default-account-name!
    account-name = current-account-name!
    rotate-class =
        if store.current.switch-account then \rotate else \ ""
    view-account-template = ->
        react.create-element 'div', { className: 'switch-account h1' }, children = 
            react.create-element 'span', { on-click: open-account, className: 'name' }, ' ' + account-name
            react.create-element 'span', { on-click: edit-account-name, className: 'icon' }, children = 
                react.create-element 'img', { src: "#{icons.create}", style: icon-style, className: 'icon-svg1' }
            react.create-element 'span', { on-click: open-account, className: "#{rotate-class} icon" }, children = 
                react.create-element 'img', { src: "#{icons.arrow-down}", style: icon-style, className: 'icon-svg2' }
    edit-account-template = ->
        react.create-element 'div', { className: 'switch-account h1' }, children = 
            react.create-element 'input', { value: "#{store.current.edit-account-name}", on-change: edit-account, style: input, className: 'h1' }
            react.create-element 'span', { on-click: done-edit, className: 'ckeck icon' }, children = 
                icon "Check", 20
            react.create-element 'span', { on-click: cancel-edit-account-name, className: 'cancel icon' }, children = 
                icon "X", 20
    chosen-account-template =
        if store.current.edit-account-name is "" then view-account-template! else edit-account-template!

    wallets-groups =
        ^^wallets
            |> filter ({coin, network}) -> ((coin.name + coin.token).to-lower-case!.index-of store.current.search.to-lower-case!) != -1 and (network.disabled isnt yes)
            |> group-by (.network.group)

    groups = wallets-groups |> keys
    group-index = store.current.group-index
    groups-wallets =
        wallets-groups
            |> obj-to-pairs
            |> map (.1)
    group-wallets = groups-wallets[group-index]
    return null if not group-wallets?
    wallet-detail = group-wallets |> find (-> group-wallets.index-of(it) is store.current.wallet-index)
    return null if not wallet-detail?

    react.create-element 'div', { key: "wallets", className: 'wallets-container wallets-container-378698936' }, children = 
        header store, web3t
        react.create-element 'div', { style: row, className: 'left-side' }, children = 
            react.create-element 'div', { style: left-side }, children = 
                if no
                    menu { store, web3t }
                if no
                    manage-account { store, web3t }
                    token-migration { store, web3t }
                add-coin-page { store, web3t }
                react.create-element 'div', { key: "wallets-body", className: 'wallets hide-detail' }, children = 
                    if no
                        react.create-element 'div', { style: header-style, className: 'header' }, children = 
                            react.create-element 'span', { style: header-left, className: 'head left h1 hidden' }, ' ' + lang.your-wallets
                            chosen-account-template
                            your-account store, web3t
                    react.create-element 'div', { key: "wallets-viewport", className: 'wallet-container' }, children = 
                        wallets
                            |> filter ({coin, network}) -> ((coin.name + coin.token).to-lower-case!.index-of store.current.search.to-lower-case!) != -1 and (network.disabled isnt yes)
                            |> group-by (.network.group)
                            |> obj-to-pairs
                            |> map wallet-group store, web3t, wallets, groups
            react.create-element 'div', { style: right-side, className: 'show-detail' }, children = 
                wallet-expanded store, web3t, wallets, wallet-detail
                react.create-element 'div', { key: "#{store.current.wallet-index}", className: 'history-area' }, children = 
                    history { store, web3t }
module.exports = mobile