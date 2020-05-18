require! {
    \react
    \../send-funcs.ls
    \prelude-ls : { map, find }
    \../get-primary-info.ls
    \./icon.ls
    \../get-lang.ls
    \../round5.ls
    \./switch-account.ls
    \../icons.ls
    \../round-human.ls
    \../wallets-funcs.ls
    \../icons.ls
    \./epoch.ls
    \react-middle-ellipsis : { default: MiddleEllipsis }
}
# .content-1757912783
#     position: relative
#     @import scheme
#     $border-radius: $border
#     $label-padding: 3px
#     $label-font: 13px
#     width: calc(100% - 60px) !important
#     margin-left: 60px !important
#     max-width: none !important
#     @media(max-width:800px)
#         margin-left: 0 !important
#     .icon-svg
#         position: relative
#         height: 12px
#         top: 2px
#     .icon-svg-history
#         width: auto !important
#         height: 20px
#     .content-body
#         max-width: 450px !important
#     >.title
#         position: sticky
#         position: -webkit-sticky
#         background: linear-gradient(100deg, #331462 4%, #15063c 100%)
#         box-sizing: border-box
#         top: 0
#         width: 100%
#         color: gray
#         font-size: 22px
#         padding: 10px
#         height: 60px
#         z-index: 2
#         @media(max-width:800px)
#             left: 0
#         >.header
#             margin: 5px
#             text-align: center
#             @media(max-width:800px)
#                 text-align: center
#         >.close
#             position: absolute
#             font-size: 20px
#             left: 20px
#             top: 13px
#             cursor: pointer
#             &:hover
#                 color: #CCC
#     .switch-account
#         float: right
#         position: relative
#         display: inline-flex
#         .ckeck
#             color: #3cd5af
#         .cancel
#             color: #c25b5f
#         .name
#             left: 12px
#             position: relative
#         input
#             outline: none
#             width: 100px
#             margin-top: -6px
#             height: 36px
#             line-height: 36px
#             border-radius: 0px
#             padding: 0px 10px
#             font-size: 12px
#             opacity: 1
#         span
#             cursor: pointer
#         .icon
#             vertical-align: middle
#             margin-left: 20px
#     .switch-menu
#         position: absolute
#         top: 35px
#         right: 0px
#         width: 25%
#         background: #321260
#         display: inline-grid
#         z-index: 3
#         .middle
#             padding: 5px 10px
#             height: 37px
#             &.account
#                 padding: 10px
#                 min-height: 50px
#                 overflow: scroll
#     .h1
#         font-size: 17px
#         text-transform: uppercase
#         letter-spacing: 2px
#         opacity: .8
#     .pending
#         color: orange
#     >*
#         display: inline-block
#         text-align: center
#         width: 94%
#         box-sizing: border-box
#         border-radius: $border-radius
#         left: 11px
#     .more-buttons
#         top: 30px
#         right: 0
#         width: 150px
#         box-shadow: 0px 0px 2px black
#         border-radius: $border
#         text-align: left
#         padding-bottom: 3px
#         >.more
#             display: block
#             cursor: pointer
#             padding: 5px 0
#             &:last-child
#                 border-bottom: 0px
#             .more-icon
#                 width: 50px
#                 text-align: center
#                 display: inline-block
#                 vertical-align: middle
#             .more-text
#                 width: 80px
#                 display: inline-block
#                 vertical-align: middle
#     >.content-body
#         margin-top: 15px
#         height: 531px
#         @import scheme
#         color: gray
#         a
#             color: #6f6fe2
#         >form
#             >table
#                 background: transparent
#                 border-radius: $border
#                 width: 100%
#                 border-spacing: 0
#                 tr
#                     &.gray
#                         color: #CCC
#                     &.orange
#                         color: #cf952c
#                     &.green
#                         color: #23b723
#                     td
#                         padding: 3px 10px
#                         font-size: 14px
#                         .label-coin
#                             left: 3px
#                             top: 3px
#                             padding: 0 2px 0 2px
#                             height: 16px
#                             position: relative
#                         &:last-child
#                             text-align: right
#             text-align: left
#             >.form-group
#                 >.control-label
#                     padding-top: 5px
#                     padding-left: $label-padding
#                     font-size: $label-font
#                 margin-top: 4px
#                 .address
#                     padding: 0px 10px
#                     height: 36px
#                     line-height: 36px
#                     overflow: hidden
#                     text-overflow: ellipsis
#                     background: transparent
#                     border-radius: $border-radius
#                     font-size: 14px
#                     overflow: hidden
#                     text-overflow: ellipsis
#                     color: #677897
#                 input
#                     outline: none
#                     width: 100%
#                     box-sizing: border-box
#                     height: 36px
#                     line-height: 36px
#                     border-radius: $border-radius
#                     padding: 0px 10px
#                     font-size: 14px
#                     border: 0px
#                     box-shadow: none
#                 .amount-field
#                     position: relative
#                     >.input-wrapper
#                         position: relative
#                         width: 65%
#                         &.choose-currency
#                             display: inline-flex
#                             width: 45% !important
#                         select
#                             -webkit-appearance: none
#                             -moz-appearance: none
#                             padding-right: 30px
#                             padding-left: 10px
#                             background-position: right 5px top 50%
#                             background-repeat: no-repeat
#                             display: block
#                             width: 30%
#                             height: 36px
#                             font-size: 14px
#                             line-height: 1.5
#                             color: #fff
#                             background-color: #421f7c
#                             background-clip: padding-box
#                             border-radius: 0
#                             border-color: #6b258e
#                             border-left: 0 solid
#                             margin-left: -1px
#                         &.small
#                             width: 35%
#                         display: inline-block
#                         box-sizing: border-box
#                         margin: 0
#                         >.label
#                             position: absolute
#                             top: 8px
#                             display: inline
#                             &.lusd
#                                 left: 5px
#                             &.crypto
#                                 right: 5px
#                                 top: 7px
#                                 height: 22px
#                         .label-coin
#                             height: 18px
#                             top: 3px
#                             position: relative
#                             padding: 0 0px 0 8px;
#                         input
#                             width: 100%
#                             color: white
#                             box-shadow: none
#                             outline: none
#                             ::placeholder
#                                 color: #eee
#                             &.amount
#                                 border-radius: $border-radius 0 0 $border-radius
#                                 border-right: 0
#                             &.amount-eur
#                                 background: #f1eeee
#                                 padding-left: 20px
#                                 border-radius: 0 $border-radius $border-radius 0
#                                 border-left: 0
#                             &.amount-usd
#                                 background: #f1eeee
#                                 border-radius: 0
#                                 padding-left: 20px
#         >.header
#             margin: 0
#             padding: 10px
#             min-height: 40px
#             text-align: left
#             padding: 0
#             >.head
#                 box-sizing: border-box
#                 width: 70%
#                 line-height: 70px
#                 font-size: 27px
#                 font-weight: 600
#                 vertical-align: middle
#                 line-height: 29px
#                 display: inline-block
#                 color: #677897
#                 width: 80%
#                 &.center
#                     padding-left: 10px
#                 &.left
#                     width: 10%
#                 &.right
#                     width: 10%
#                     text-align: right
#                     cursor: pointer
#                     >*
#                         vertical-align: middle
#             img
#                 width: 34px
#                 border-radius: 50px
#         .usd
#             font-size: 11px
#             padding-left: 3px
#             color: gray
#             margin-top: 5px
#             .switch-currency
#                 float: right
#                 background: transparent !important
#                 &.active
#                     background: rgb(67, 32, 124) !important
#                 &:last-child
#                     margin-right: 2px
#             .label-coin
#                 left: 3px
#                 top: 3px
#                 padding: 0 2px 0 2px
#                 height: 13px
#                 position: relative
#         .topup
#             display: inline-block
#             margin-left: 5px
#             color: orange
#             vertical-align: top
#             padding: 0 5px
#             border-radius: $border
#             line-height: 12px
#             font-size: 12px
#         .balance
#             color: #5E72E4
#         .send-all
#             background: #3a63e4
#             outline: none
#             border: 0
#             border-radius: $border
#             font-size: 12px
#             line-height: 16px
#             text-align: center
#             padding: 2px 5px
#             cursor: pointer
#         .not-enough
#             color: red
#             min-height: 33px
#             padding: 0 4px
#             font-size: 12px
#             max-height: 20px
#             overflow: hidden
#         .fast-cheap
#             text-align: right
#             height: 14px
#             line-height: 14px
#             padding: 0 3px
#             flex-direction: row
#             display: flex
#             margin-top: 5px
#             >*
#                 padding: 2px 5px
#                 font-size: 12px
#                 line-height: 8px
#                 border-radius: $border
#                 cursor: pointer
#                 text-align: center
#                 &.chosen
#                     cursor: default
#                     background: #3a63e4
#                     color: white
#                 &.space
#                     flex: 1
#         .escrow
#             padding: 5px 11px
#             min-height: 20px
#             @media screen and (max-width: 290px)
#                 min-height: 0
#             color: #cc625a
#             font-size: 14px
#         .bold
#             font-weight: bold
#         .button-container
#             text-align: center
#             .buttons
#                 margin-top: 40px
#                 text-align: center
#                 border-radius: $border
#                 width: 100%
#                 display: inline-block
#                 overflow: hidden
#                 .btn
#                     width: auto
#                     min-width: 80px
#                     padding: 0 6px
#                     line-height: 36px
#                     height: 36px
#                     text-transform: uppercase
#                     text-align: center
#                     font-weight: bold
#                     border: 0
#                     margin: 5px
#                     font-size: 10px
#                     border-radius: $border
#                     display: inline-block
#                     cursor: pointer
#                     box-sizing: border-box
#                     transaction: all .5s
#                     &.btn-primary
#                         background: #6CA7ED
#                         color: white
#                     &:hover
#                         background: rgba(#6CA7ED, 0.2)
#                         opacity: .9
build-send-option = ({ store, change-amount} , option)-->
    { send } = store.current
    chosen =
        | option is send.tx-type => \chosen
        | _ => ""
    select-option = ->
        send.tx-type = option
        <- change-amount store, send.amount-send, no
    react.create-element 'div', { on-click: select-option, className: "#{chosen} switch" }, ' ' + option.to-upper-case!
form-group = (title, style, content)->
    react.create-element 'div', { className: 'form-group' }, children = 
        react.create-element 'label', { style: style, className: 'control-label' }, ' ' + title
        content!
send = ({ store, web3t })->
    { token, name, fee-token, network, send, wallet, pending, primary-button-style, recipient-change, amount-change, amount-usd-change, amount-eur-change, use-max-amount, show-data, show-label, topup, history, cancel, send-anyway, choose-auto, choose-cheap, chosen-auto, chosen-cheap, get-address-link, get-address-title, default-button-style, round5edit, round5, send-options, send-title, is-data, encode-decode, change-amount, invoice } = send-funcs store, web3t
    round-money = (val)->
        +val |> (-> it * 100) |> Math.round |> (-> it / 100)
    cut-tx = (tx)->
        return \none if not tx?
        t = tx.to-string!
        r = t.substr(0, 4) + \.. + t.substr(tx.length - 25, 10) + \.. + t.substr(t.length - 4, 4)
        r.to-upper-case!
    style = get-primary-info store
    menu-style=
        background: style.app.background
        border: "1px solid #{style.app.border}"
    input-style=
        background: style.app.wallet
        border: "1px solid #{style.app.border}"
        color: style.app.text
    border-style=
        border: "1px solid #{style.app.border}"
    amount-style=
        border: "1px solid #{style.app.background}"
    icon-style =
        color: style.app.icon
    btn-icon =
        filter: style.app.btn-icon
    use-max-style =
        background: style.app.wallet
        color: style.app.text
    crypto-background =
        background: style.app.wallet
    more-text=
        color: style.app.text
    address-input=
        color: style.app.addressText
        background: style.app.addressBg
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary1-style=
        border: "1px solid #{style.app.primary1}"
        color: style.app.text
        background: style.app.primary1
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    border-header =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    expand-collapse = ->
        store.current.send-menu-open = not store.current.send-menu-open
    lang = get-lang store
    wallet-title = "#{name + network} #{lang.wallet ? 'wallet'}"
    open-invoice = ->
        invoice store, wallet
    activate = (convert)-> ->
        store.current.convert = convert 
    activate-usd = activate \usd
    activate-eur = activate \eur
    active-class = (convert)->
        if store.current.convert is convert then 'active' else ''
    active-usd = active-class \usd
    active-eur = active-class \eur
    cut-send = (tx)->
        return \none if not tx?
        t = tx.to-string!
        m = Math.max(document.documentElement.clientWidth, window.innerWidth or 0)
        r =
            | m > 800 => t.substr(0, 4) + \.. + t.substr(tx.length - 25, 20) + \.. + t.substr(t.length - 4, 4)
            | _ => t.substr(0, 4) + \.. + t.substr(tx.length - 25, 15) + \.. + t.substr(t.length - 4, 4)
    show-class =
        if store.current.open-menu then \hide else \ ""
    react.create-element 'div', { className: 'content content-1757912783' }, children = 
        react.create-element 'div', { style: border-header, className: 'title' }, children = 
            react.create-element 'div', { className: "#{show-class} header" }, ' Send'
            react.create-element 'div', { on-click: cancel, className: 'close' }, children = 
                react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg' }
            epoch store, web3t
            switch-account store, web3t
        react.create-element 'div', { style: more-text, className: 'content-body' }, children = 
            react.create-element 'div', { className: 'header' }, children = 
                react.create-element 'span', { className: 'head left' }, children = 
                    react.create-element 'img', { src: "#{send.coin.image}" }
                react.create-element 'span', { style: more-text, className: 'head center' }, ' ' + wallet-title
                if store.current.device is \mobile
                    react.create-element 'span', { on-click: history, style: icon-style, className: 'head right' }, children = 
                        react.create-element 'img', { src: "#{icons.history}", className: 'icon-svg-history' }
            if store.current.send-menu-open
                react.create-element 'div', { style: menu-style, className: 'more-buttons' }, children = 
                    if store.preference.invoice-visible is yes
                        if store.current.device is \desktop
                            react.create-element 'a', { on-click: open-invoice, className: 'more receive' }, children = 
                                react.create-element 'div', {}, children = 
                                    react.create-element 'span', { style: icon-style, className: 'more-icon' }, children = 
                                        icon \Mail, 20
                                    react.create-element 'span', { style: more-text, className: 'more-text' }, ' ' + lang.invoice ? 'Invoice'
                    if store.current.device is \mobile    
                        react.create-element 'a', { on-click: history, className: 'more history' }, children = 
                            react.create-element 'div', {}, children = 
                                react.create-element 'span', { style: icon-style, className: 'more-icon' }, children = 
                                    icon \Inbox, 20
                                react.create-element 'span', { style: more-text, className: 'more-text' }, ' ' + lang.history ? 'History'
                    if store.current.device is \desktop
                        react.create-element 'a', { on-click: topup, className: 'more history' }, children = 
                            react.create-element 'div', {}, children = 
                                react.create-element 'span', { style: icon-style, className: 'more-icon' }, children = 
                                    icon \DiffAdded, 20
                                react.create-element 'span', { style: more-text, className: 'more-text' }, ' ' + lang.topup ? 'Topup'
            react.create-element 'form', {}, children = 
                form-group lang.from, icon-style, ->
                    react.create-element 'div', { style: border-style, className: 'address' }, children = 
                        react.create-element MiddleEllipsis, {}, children = 
                            react.create-element 'a', { href: "#{get-address-link wallet}" }, ' ' + get-address-title wallet
                form-group lang.to, icon-style, ->
                    react.create-element 'input', { type: 'text', style: input-style, on-change: recipient-change, value: "#{send.to}", placeholder: "#{store.current.send-to-mask}" }
                form-group lang.amount, icon-style, ->
                    react.create-element 'div', {}, children = 
                        react.create-element 'div', { className: 'amount-field' }, children = 
                            react.create-element 'div', { className: 'input-wrapper' }, children = 
                                react.create-element 'div', { style: crypto-background, className: 'label crypto' }, children = 
                                    react.create-element 'img', { src: "#{send.coin.image}", className: 'label-coin' }
                                    """ #{token}"""
                                react.create-element 'input', { type: 'text', style: input-style, on-change: amount-change, placeholder: "0", title: "#{send.amount-send}", value: "#{round5edit send.amount-send}", className: 'amount' }
                            if active-usd is \active
                                react.create-element 'div', { style: amount-style, className: 'input-wrapper small' }, children = 
                                    react.create-element 'div', { className: 'label lusd' }, ' $'
                                    react.create-element 'input', { type: 'text', style: input-style, on-change: amount-usd-change, placeholder: "0", title: "#{send.amount-send-usd}", value: "#{round-money send.amount-send-usd}", className: 'amount-usd' }
                            if active-eur is \active
                                react.create-element 'div', { style: amount-style, className: 'input-wrapper small' }, children = 
                                    react.create-element 'div', { className: 'label lusd' }, ' €'
                                    react.create-element 'input', { type: 'text', style: input-style, on-change: amount-eur-change, placeholder: "0", title: "#{send.amount-send-eur}", value: "#{round-money send.amount-send-eur}", className: 'amount-eur' }
                        react.create-element 'div', { className: 'usd' }, children = 
                            react.create-element 'button', { on-click: use-max-amount, style: use-max-style, type: "button", className: 'send-all' }, ' ' + lang.use-max ? 'USE MAX'
                            react.create-element 'span', {}, ' ' + lang.balance ? 'balance'
                            react.create-element 'span', { className: 'balance' }, children = 
                                react.create-element 'span', { title: "#{wallet.balance}" }, ' ' + round-human wallet.balance
                                    react.create-element 'img', { src: "#{send.coin.image}", className: 'label-coin' }
                                    react.create-element 'span', {}, ' ' + token
                                if +wallet.pending-sent >0
                                    react.create-element 'span', { className: 'pending' }, ' ' + '(' + pending + ' ' + lang.pending + ')'
                            react.create-element 'button', { on-click: activate-eur, style: use-max-style, type: "button", className: "#{active-eur} send-all switch-currency" }, ' eur'
                            react.create-element 'button', { on-click: activate-usd, style: use-max-style, type: "button", className: "#{active-usd} send-all switch-currency" }, ' usd'
                        react.create-element 'div', { title: "#{send.error}", className: 'control-label not-enough text-left' }, ' ' + send.error
                if is-data
                    form-group 'Data', icon-style, ->
                        react.create-element 'input', { read-only: "readonly", style: input-style, value: "#{cut-tx show-data!}" }
                react.create-element 'table', { style: border-style }, children = 
                    react.create-element 'tbody', {}, children = 
                        react.create-element 'tr', {}, children = 
                            react.create-element 'td', {}, ' ' + lang.you-spend ? 'Total'
                            react.create-element 'td', {}, children = 
                                react.create-element 'span', { title: "#{send.amount-charged}" }, ' ' + round5(send.amount-charged)
                                    react.create-element 'img', { src: "#{send.coin.image}", className: 'label-coin' }
                                    react.create-element 'span', { title: "#{send.amount-charged}" }, ' ' + token
                                react.create-element 'div', { className: 'usd' }, ' $ ' + round5 send.amount-charged-usd
                        react.create-element 'tr', { className: 'orange' }, children = 
                            react.create-element 'td', {}, ' ' + lang.fee ? 'Transaction Fee'
                            react.create-element 'td', {}, children = 
                                react.create-element 'span', { title: "#{send.amount-send-fee}" }, ' ' + round5(send.amount-send-fee)
                                    react.create-element 'img', { src: "#{send.coin.image}", className: 'label-coin' }
                                    react.create-element 'span', { title: "#{send.amount-send-fee}" }, ' ' + fee-token
                                react.create-element 'div', { className: 'usd' }, ' $ ' + round5(send.amount-send-fee-usd)
                if false
                    react.create-element 'div', { className: 'fast-cheap' }, children = 
                        send-options |> map build-send-option { store, change-amount }
                        react.create-element 'div', { className: 'space' }
                        react.create-element 'div', { on-click: choose-auto, className: "#{chosen-auto} switch" }, ' ' + lang.auto ? 'auto'
                        react.create-element 'div', { on-click: choose-cheap, className: "#{chosen-cheap} switch" }, ' ' + lang.cheap ? 'cheap'
            react.create-element 'div', { className: 'button-container' }, children = 
                react.create-element 'div', { className: 'buttons' }, children = 
                    react.create-element 'button', { on-click: send-anyway, style: button-primary1-style, className: 'btn btn-primary' }, children = 
                        react.create-element 'span', {}, children = 
                            react.create-element 'img', { src: "#{icons.send}", className: 'icon-svg' }
                            """ #{send-title}"""
                        if send.sending
                            react.create-element 'span', {}, ' ...'
                    react.create-element 'button', { on-click: cancel, style: button-primary3-style, className: 'btn btn-default' }, children = 
                        react.create-element 'span', {}, children = 
                            react.create-element 'img', { src: "#{icons.close}", style: btn-icon, className: 'icon-svg' }
                            """ #{lang.cancel}"""
module.exports = send
module.exports.init = ({ store, web3t }, cb)->
    { wallet } = send-funcs store, web3t
    { wallets } = wallets-funcs store, web3t
    current-wallet = 
        wallets |> find (-> it.coin.token is wallet.coin.token)
    return cb null if current-wallet.address is wallet.address 
    { wallet } = send-funcs store, web3t
    return cb null if not web3t[wallet.coin.token]?
    { send-transaction } = web3t[wallet.coin.token]
    to = ""
    value = 0
    err <- send-transaction { to, value }
    cb null