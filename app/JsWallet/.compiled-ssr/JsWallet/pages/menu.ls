require! {
    \react
    \../tools.ls : { cut, money }
    \../math.ls : { times, plus }
    \prelude-ls : { map, foldl, filter, find }
    \./project-links.ls
    \../menu-funcs.ls
    \./your-account.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../icons.ls
    \./header.ls
    \../navigate.ls
    \../round-human.ls
    \../add-coin.ls
    \./tor.ls
}
# .menu345890219
#     height: 199px
#     line-height: 200px
#     $mobile: 425px
#     $tablet: 800px
#     .icon-svg-plus
#         position: relative
#         height: 16px
#         top: 2px
#         padding: 0
#         cursor: pointer
#         vertical-align: top
#     &.wallet-main
#         @media(max-width: 800px)
#             margin: 0px 15px 0
#             position: relative
#             left: 0
#             right: 0
#         @media(max-width: $mobile)
#             margin: 0
#     .syncing
#         @keyframes spin
#             from
#                 transform: rotate(0deg)
#             to
#                 transform: rotate(360deg)
#         animation-name: spin
#         animation-duration: 4000ms
#         animation-iteration-count: infinite
#         animation-timing-function: linear
#     .loader
#         display: inline-block
#         cursor: pointer
#         color: #00ffdc
#         svg
#             width: 25px
#         .icon-svg
#             vertical-align: sub !important
#             width: 20px
#     >.menu-body
#         display: inline-block
#         line-height: normal
#         vertical-align: middle
#         vertical-align: -webkit-baseline-middle
#         width: 100%
#         max-width: 450px
#         >.branding
#             margin-top: 35px
#             text-align: center
#             img
#                 width: 35px
#                 cursor: pointer
#         >.balance
#             position: relative
#             button
#                 svg
#                     width: 20px
#                     cursor: pointer
#             .balance-warning-container
#                 display: inline-block
#                 font-size: 8px
#                 letter-spacing: 1px
#                 text-transform: capitalize
#                 background: #f6931a5e
#                 margin: auto
#                 color: white
#                 border-radius: 69px
#                 border: 1px solid #f6931a
#                 padding: 0 5px
#                 line-height: 17px
#                 .total-balance-warning-icon
#                     cursor: help
#                     &:hover
#                         .balance-warning-notification
#                             display: block
#                 .full-warning-notification-text
#                     text-transform: initial
#                 .balance-warning-notification
#                     z-index: 2
#                     display: none
#                     position: absolute
#                     box-shadow: 1px 1px 12px rgba(0, 0, 0, 0.34)
#                     left: 100%
#                     top: 20%
#                     padding: 10px
#                     font-size: 11px
#                     min-width: 200px
#                     background: #1f1f1f
#                     text-align: left
#                     z-index: 9
#                     @media (max-width: 800px)
#                         left: 80%
#                     @media (max-width: 735px)
#                         left: 50%
#                         top: 130%
#                     @media (max-width: 400px)
#                         left: 10%
#                     .triangle
#                         width: 0
#                         height: 0
#                         border-top: 5px solid transparent
#                         border-right: 8px solid #1f1f1f
#                         border-bottom: 5px solid transparent
#                         position: relative
#                         left: -18px
#                         top: -50px
#                         @media (max-width: 735px)
#                             display: none
#             .balance-text
#                 display: inline-block
#             >.menu
#                 position: absolute
#                 right: 0
#                 top: 0
#                 >.menu-item
#                     display: block
#                     &.syncing
#                         @keyframes spin
#                             from
#                                 transform: rotate(0deg)
#                             to
#                                 transform: rotate(360deg)
#                         animation-name: spin
#                         animation-duration: 4000ms
#                         animation-iteration-count: infinite
#                         animation-timing-function: linear
#                     cursor: pointer
#                     opacity: 0.9
#                     &:hover
#                         opacity: 1
#                     vertical-align: top
#                     line-height: normal
#                     display: inline-block
#                     margin-left: 15px
#             text-align: center
#             >.currency
#                 &.h1
#                     font-size: 12px
#                     text-transform: uppercase
#                     letter-spacing: 2px
#                     line-height: 24px
#                     margin-top: 5px
#             >.amount
#                 font-size: 25px
#                 font-weight: bold
#                 .symbol
#                     font-size: 15px
#                     vertical-align: unset
#                     opacity: .5
#                     margin-right: 2px
#                 >*
#                     display: inline-block
#     .placeholder
#         width: auto !important
#         height: 34px !important
#         line-height: 34px !important
#         -webkit-mask-image: linear-gradient(90deg, rgba(255, 255, 255, 0.6) 0%, #000000 50%, rgba(255, 255, 255, 0.6) 70%)
#         -webkit-mask-size: 50%
#         animation: fb 1s infinite
#         animation-fill-mode: forwards
#         background: var(--placeholder-menu)
#         color: transparent !important
#         width: 100%
#         display: inline-block
#         height: 16px
#     @keyframes fb
#         0%
#             -webkit-mask-position: left
#         100%
#             -webkit-mask-position: right
module.exports = ({ store, web3t })->
    return null if not store?
    { current, open-account, lock, wallet-style, info, activate-s1, activate-s2, activate-s3, switch-network, refresh, lock } = menu-funcs store, web3t
    style = get-primary-info store
    menu-style=
        color: style.app.text
    icon-style =
        color: style.app.loader
        margin-top: "10px"
    goto-wallet = ->
        navigate store, web3t, \wallets
    button-add=
        color: style.app.text
        border-radius: "50px"
        border: "0"
        background: style.app.bg-btn
        line-height: "25px"
        padding: "10px"
        width: "40px"
        height: "40px"
        margin: "10px 5px 0"
    button-syncing=
        color: style.app.loader
        border-radius: "50px"
        border: "0"
        background: style.app.bg-btn
        line-height: "25px"
        padding: "10px"
        width: "40px"
        height: "40px"
        margin: "0px 5px 0"
    logo-style =
        filter: style.app.filterLogo
    lang = get-lang store
    syncing =
        | store.current.refreshing => \syncing
        | _ => ""
    placeholder =
        | store.current.account.wallets |> find (-> it.status is "loading") => "placeholder"
        | _ => ""
    usdBalances = store.current.account.wallets
        |> filter (-> not isNaN(it.balanceUsd))
        |> map (-> it.balanceUsd)
        |> foldl plus, 0
    not-loaded-balances-exists = store.current.account.wallets |> find (-> it.state in <[ error ]> )
    totalBalance =
        | not-loaded-balances-exists => "..."
        | _ => round-human usdBalances
    icon-style =
        width: "15px"
        height: "15px"
        float: "right"
        top: "1px"
        position: "relative"
        margin-left: 3px
    react.create-element 'div', { style: menu-style, className: 'menu wallet-main menu345890219' }, children = 
        react.create-element 'div', { className: 'menu-body' }, children = 
            react.create-element 'div', { className: 'branding' }, children = 
                react.create-element 'img', { src: "#{info.branding.logo-sm}", on-click: goto-wallet }
            react.create-element 'div', { className: 'balance' }, children = 
                react.create-element 'div', { className: 'currency h1' }, children = 
                    react.create-element 'div', { className: 'balance-text' }, ' ' + lang.balance
                react.create-element 'div', { className: "#{placeholder} amount" }, children = 
                    react.create-element 'div', { className: 'symbol' }, ' $'
                    react.create-element 'div', { title: "#{current.balance-usd}", id: 'balance-total', className: 'number' }, ' ' + totalBalance
                if not-loaded-balances-exists
                    react.create-element 'div', {}, children = 
                        react.create-element 'div', { className: 'balance-warning-container' }, children = 
                            react.create-element 'span', { className: 'warning-text' }, ' The total balance is unavailable now'
                            react.create-element 'span', { className: 'total-balance-warning-icon' }, children = 
                                react.create-element 'img', { src: "#{icons.warning2}", style: icon-style, className: 'total-balance-warning-icon' }
                                react.create-element 'div', { className: 'balance-warning-notification' }, children = 
                                    react.create-element 'div', { className: 'full-warning-notification-text' }, ' The total balance is unavailable now because some of the tokens` balances could not be loaded.'
                                    react.create-element 'div', { className: 'triangle' }
                react.create-element 'div', {}, children = 
                    if store.current.device is \desktop
                        if store.preference.refresh-visible is yes
                            react.create-element 'button', { on-click: refresh, style: button-syncing, className: "#{syncing} button lock mt-5" }, children = 
                                icon \Sync, 20
                    if no
                        if store.current.device is \desktop
                            react.create-element 'button', { on-click: add-coin(store), style: button-add, className: 'button lock mt-5' }, children = 
                                react.create-element 'img', { src: "#{icons.create}", className: 'icon-svg-plus' }
                    if store.current.device is \desktop
                        tor store, web3t
            if store.current.device is \mobile
                your-account store, web3t
            project-links { store, web3t }