require! {
    \react
    \../menu-funcs.ls 
    \./naming.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../navigate.ls
}
# .manage-account-207821059
#     @import scheme
#     @keyframes bounceIn
#         from
#             opacity: 0
#             transform: scale3d(0.8, 0.8, 0.8)
#         to
#             opacity: 1
#             transform: scale3d(1, 1, 1)
#     position: fixed
#     width: 100%
#     top: 0
#     z-index: 999
#     height: 100%
#     min-height: 100vh
#     padding-top: 5%
#     box-sizing: border-box
#     padding: 10px
#     background: rgba(black, 0.8)
#     >.account-body
#         max-width: 600px
#         display: inline-block
#         overflow: hidden
#         animation-duration: 0.5s
#         animation-name: bounceIn
#         background: white
#         width: 100%
#         margin-top: 5vh
#         margin-bottom: 25vh
#         padding-bottom: 50px
#         border-radius: $border
#         position: relative
#         max-height: 70vh
#         box-sizing: border-box
#         >.title
#             position: absolute
#             z-index: 999
#             box-sizing: border-box
#             top: 0
#             width: 100%
#             color: gray
#             font-size: 22px
#             padding: 10px
#             height: 60px
#             background: black
#             >.header
#                 margin: 5px
#         >.settings
#             padding-top: 60px
#             overflow-y: auto
#             height: calc(65vh - 30px)
#             .title
#                 color: $primary
#                 text-transform: uppercase
#                 font-size: 14px
#                 a
#                     color: #ee8791
#             .box
#                 input
#                     width: 104px
#             input
#                 border-radius: $border
#                 height: 36px
#                 width: 40px
#                 line-height: 36px
#                 text-align: center
#                 font-size: 13px
#             textarea
#                 border-radius: $border
#             input, textarea
#                 outline: none
#                 margin-bottom: 3px
#                 border: 0px
#                 padding: 3px 10px
#                 box-sizing: border-box
#             button
#                 background-color: $primary
#                 border: 1px solid $primary
#                 border-radius: $border
#                 color: white
#                 height: 36px
#                 width: 104px
#                 margin-top: 5px
#                 padding: 0 6px
#                 text-decoration: none
#                 text-transform: uppercase
#                 font-size: 10px
#                 font-weight: bold
#                 cursor: pointer
#                 outline: none
#                 display: inline-block
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 white-space: nowrap
#                 &:hover
#                     background: transparent
#                     color: $primary
#                 &.link
#                     min-width: 190px
#             textarea
#                 width: 250px
#                 height: 72px
#                 resize: none
#                 font-size: 15px
#             .switch-account
#                 color: #8e8e93
#                 font-size: 12px
#                 margin-top: 5px
#                 .bold
#                     font-weight: bold
#                 .button
#                     background: #8e8e93
#                     width: 12px
#                     height: 16px
#                     display: inline-block
#                     color: white
#                     padding: 9px
#                     border-radius: $border
#                     cursor: pointer
#                     vertical-align: top
#                     &:hover
#                         background: gray
#                     &.left
#                         border-radius: $border 0 0 $border
#                     &.right
#                         border-radius: 0 $border $border 0
#                 .mb-12
#                     margin-bottom: 12px
#         .bold
#             color: #f0c16b
#         .section
#             border-bottom: 1px solid rgba(240, 237, 237, 0.16)
#             &.last
#                 border-bottom: 0
#             &:first-child
#                 background: $logo-opacity
#                 background-repeat: no-repeat
#                 background-position: left 10px
#             padding: 20px
#             .title
#                 padding: 2px
#             .description
#                 padding: 7px
#                 font-size: 13px
#                 color: #b0aeae
#             .logo
#                 margin-bottom: 5px
#                 img
#                     width: 30px
#             .cap
#                 text-transform: capitalize
#             .low
#                 text-transform: lowercase
#             .link
#                 color: #6f6fe2
#                 text-decoration: underline
#                 cursor: pointer
#             .pb-0
#                 padding-bottom: 0
#             .content
#         .change-index
#             width: 80px
#             padding: 1px
#             border-radius: 0 !important
#             text-align: center
switch-account = (store, web3t)->
    {  account-left, account-right, change-account-index } = menu-funcs store, web3t
    style = get-primary-info store
    input-style =
        background: style.app.wallet
        color: style.app.text
        border: "0"
    color =
        color: style.app.text
    button-primary2-style=
        border: "1px solid #{style.app.wallet}"
        color: style.app.text
        background: style.app.primary2
    react.create-element 'div', { style: color, className: 'switch-account' }, children = 
        react.create-element 'div', { className: 'mb-12' }, ' Account Index:'
        react.create-element 'span', { on-click: account-left, style: button-primary2-style, className: 'button left' }, children = 
            icon \ChevronLeft, 15
        react.create-element 'span', { className: 'bold' }, children = 
            react.create-element 'input', { value: "#{store.current.account-index}", style: input-style, on-change: change-account-index, className: 'change-index' }
        react.create-element 'span', { on-click: account-right, style: button-primary2-style, className: 'button right' }, children = 
            icon \ChevronRight, 15
naming-part = ({ store, web3t })->
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, ' ' + lang.your-nickname ? 'Your Nickname'
        react.create-element 'div', { className: 'description' }, ' ' + lang.your-nickname-info ? 'You are able to attach nickname, email or phone number to your account and share it with friends. They will use your nick to resolve your crypto-address'
        react.create-element 'div', { className: 'content' }, children = 
            naming { store, web3t }
manage-account = (store, web3t)->
    { current, generate, enter-pin, cancel-try, edit-seed, save-seed, change-seed, export-private-key } = menu-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    input-style =
        background: style.app.wallet
        color: style.app.text
    color =
        color: style.app.text
    logo-style =
        filter: style.app.filterLogo
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    goto-terms = ->
        navigate store, web3t, \terms2
    react.create-element 'div', {}, children = 
        react.create-element 'div', { className: 'section' }, children = 
            react.create-element 'div', { className: 'logo' }, children = 
                react.create-element 'img', { src: "#{style.branding.logo}", style: logo-style }
            react.create-element 'div', { style: color, className: 'title' }, children = 
                react.create-element 'span', {}, ' Velas Wallet'
                react.create-element 'span', { className: 'bold low' }, ' ' + store.version
            react.create-element 'div', { style: color, className: 'description pb-0' }, children = 
                react.create-element 'span', {}, ' ' + lang.about-wallet ? 'Multi-currency Wallet Managed by one mnemonic phrase' + '.'
                react.create-element 'br', {}
                react.create-element 'span', {}, ' ' + lang.pls-read ? 'Please read our' + ' '
                react.create-element 'span', {}, children = 
                    react.create-element 'a', { href: "https://velas.com/privacy.html", target: "_blank", className: 'link' }, ' ' + lang.privacy-policy ? 'Privacy Policy'
                react.create-element 'span', {}, '  & '
                react.create-element 'span', { on-click: goto-terms, className: 'link' }, ' ' + lang.terms-of-use ? 'Terms of Use'
        react.create-element 'div', { className: 'section' }, children = 
            react.create-element 'div', { style: color, className: 'title' }, ' ' + lang.secret-phrase ? 'Secret Phrase'
            react.create-element 'div', { style: color, className: 'description' }, ' ' + lang.secret-phrase-warning ? 'You are responsible for keeping this phrase safe. In case of loss of this phrase, we will not be able to help you restore it.'
            react.create-element 'div', { className: 'content' }, children = 
                switch
                    case current.try-edit-seed is yes
                        react.create-element 'div', { className: 'box' }, children = 
                            react.create-element 'div', {}, children = 
                                react.create-element 'input', { on-change: enter-pin, value: "#{current.pin}", type: "password", style: input-style, placeholder: "#{lang.enter-pin ? 'Enter PIN'}" }
                            react.create-element 'div', {}, '    '
                                react.create-element 'button', { on-click: cancel-try, style: button-primary2-style }, ' ' + lang.cancel
                    case current.saved-seed is no
                        react.create-element 'div', { className: 'box' }, children = 
                            react.create-element 'div', { className: 'title' }, children = 
                                react.create-element 'span', {}, ' ' + lang.secret-phrase ? 'Secret Phrase'
                                react.create-element 'a', { on-click: generate, className: 'generate' }, ' (generate)'
                            react.create-element 'textarea', { on-change: change-seed, value: "#{current.seed}", style: input-style, placeholder: "#{lang.secret-phrase ? 'Secret Phrase'}" }
                            react.create-element 'div', {}, children = 
                                react.create-element 'button', { on-click: save-seed, style: button-primary2-style }, ' ' + lang.save
                    case current.saved-seed is yes
                        react.create-element 'div', {}, children = 
                            react.create-element 'button', { on-click: edit-seed, style: button-primary2-style }, ' ' + lang.edit-secret ? 'Edit Secret'
        react.create-element 'div', { className: 'section' }, children = 
            react.create-element 'div', { style: color, className: 'title' }, ' ' + lang.switch-account-index ? 'Switch Account Index'
            react.create-element 'div', { style: color, className: 'description' }, children = 
                react.create-element 'span', { className: 'bold' }, ' ' + lang.for-advanced-users ? 'For advanced users only' + '.'
                react.create-element 'span', {}, ' ' + lang.switch-account-info ? 'You could have a lot of unique addresses by switching account index. By default, you are given an index of 1, but you can change it in range 0 - 2,147,483,647'
            react.create-element 'div', { className: 'content' }, children = 
                switch-account store, web3t
        react.create-element 'div', { className: 'section last' }, children = 
            react.create-element 'div', { style: color, className: 'title' }, ' ' + lang.export-private-key ? 'Export PRIVATE KEY'
            react.create-element 'div', { style: color, className: 'description' }, children = 
                react.create-element 'span', { className: 'bold' }, ' ' + lang.for-advanced-users ? 'For advanced users only'
                react.create-element 'span', {}, ' ' + lang.export-private-key-warning ? 'Please never do it in case when you do not understand exact reason of this action and do not accept risks' + '.'
            react.create-element 'div', { className: 'content' }, children = 
                react.create-element 'button', { on-click: export-private-key, style: button-primary2-style }, ' ' + lang.show-secret ? 'Show Secret'
module.exports = ({ store, web3t } )->
    return null if store.current.manage-account isnt yes
    { close-account } = menu-funcs store, web3t
    style = get-primary-info store
    account-body-style = 
        background: style.app.background
        color: style.app.text
    border-style =
        background: style.app.header
        color: style.app.text
    lang = get-lang store
    react.create-element 'div', { className: 'manage-account manage-account-207821059' }, children = 
        react.create-element 'div', { style: account-body-style, className: 'account-body' }, children = 
            react.create-element 'div', { style: border-style, className: 'title' }, children = 
                react.create-element 'div', { className: 'header' }, ' ' + lang.manage-account
                react.create-element 'div', { on-click: close-account, className: 'close' }, children = 
                    icon \X, 20
            react.create-element 'div', { className: 'settings' }, children = 
                manage-account store, web3t