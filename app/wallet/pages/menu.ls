require! {
    \react
    \../tools.ls : { cut, money }
    \./project-links.ls
    \../menu-funcs.ls
    \./your-account.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./header.ls
}
# .menu1043635947
#     padding: 0 5px
#     height: 219px
#     line-height: 30vh
#     >.menu-body
#         display: inline-block
#         line-height: normal
#         vertical-align: middle
#         vertical-align: -webkit-baseline-middle
#         width: 100%
#         max-width: 450px
#         >.balance
#             position: relative
#             >.menu
#                 position: absolute
#                 right: 0
#                 top: 0
#                 >.menu-item
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
#             >.amount
#                 font-size: 40px
#                 >*
#                     display: inline-block
module.exports = ({ store, web3t })->
    return null if not store?
    { current, open-account, lock, wallet-style, info, activate-s1, activate-s2, activate-s3, switch-network, refresh, lock } = menu-funcs store, web3t
    style = get-primary-info store
    menu-style=
        color: style.app.text
    icon-style =
        color: style.app.icon
    lang = get-lang store
    syncing = 
        | store.current.refreshing => \syncing
        | _ => ""
    react.create-element 'div', { style: menu-style, className: 'menu menu1043635947' }, children = 
        react.create-element 'div', { className: 'menu-body' }, children = 
            react.create-element 'div', { className: 'balance' }, children = 
                react.create-element 'div', { className: 'currency' }, ' ' + lang.total-balance ? 'Total Balance'
                react.create-element 'div', { className: 'amount' }, children = 
                    react.create-element 'div', { className: 'symbol' }, ' $'
                    react.create-element 'div', { className: 'number' }, ' ' + money current.balance-usd
            if store.current.device is \mobile    
                your-account store, web3t
            project-links { store, web3t }