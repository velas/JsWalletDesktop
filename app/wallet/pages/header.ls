require! {
    \react
    \./project-links.ls
    \../menu-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./loading.ls
}
# .menu-52262224
#     width: 100%
#     text-align: right
#     padding: 20px 15px
#     box-sizing: border-box
#     .logo
#         position: absolute
#         width: 100%
#         text-align: center
#         left: 0
#         img
#             width: 25px
#             vertical-align: bottom
#     >.menu-item
#         &.syncing
#             @keyframes spin
#                 from
#                     transform: rotate(0deg)
#                 to 
#                     transform: rotate(360deg)
#             animation-name: spin
#             animation-duration: 4000ms
#             animation-iteration-count: infinite
#             animation-timing-function: linear
#         cursor: pointer
#         opacity: 0.9
#         &:hover
#             opacity: 1
#         vertical-align: initial
#         line-height: normal
#         display: inline-block
#         margin-left: 20px
#         position: relative
#         height: 20px
#         line-height: 15px
#         width: 15px
#         z-index: 11
#         @media screen and (max-width: 390px)
#             &:nth-child(4)
#                 float: left
#                 margin-left: 0
#     .iron
#         -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
#         -webkit-mask-size: 50%
#         animation: shine 2s infinite
#     @keyframes shine
#         0%
#             -webkit-mask-position: right
#         100%
#             -webkit-mask-position: left
module.exports = (store, web3)->
    return null if not store? or store.current.page in <[ locked ]>
    { current, open-account, lock, wallet-style, info, activate-s1, activate-s2, activate-s3, switch-network, refresh, lock } = menu-funcs store, web3t
    style = get-primary-info store
    menu-style=
        color: style.app.text
    icon-style =
        color: style.app.icon
    lang = get-lang store
    info = get-primary-info store
    syncing = 
        | store.current.refreshing => "syncing"
        | _ => ""
    border-style =
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.header
    logo-style =
        filter: style.app.filterLogo
    react.create-element 'div', { style: border-style, className: 'menu menu-52262224' }, children = 
        react.create-element 'div', { className: 'logo' }, children = 
            react.create-element 'img', { src: "#{info.branding.logo}", style: logo-style }
        if store.preference.refresh-visible is yes
            react.create-element 'div', { on-click: refresh, style: icon-style, className: "#{syncing} menu-item" }, children = 
                icon \Sync , 20
        if store.preference.settings-visible is yes
            react.create-element 'div', { on-click: open-account, style: icon-style, className: 'menu-item' }, children = 
                icon \Gear , 20
        if store.preference.lock-visible is yes
            react.create-element 'div', { on-click: lock, style: icon-style, className: 'menu-item' }, children = 
                icon \Lock , 20