require! {
    \react
    \../send-funcs.ls
    \prelude-ls : { map }
    \../get-primary-info.ls
    \./icon.ls
    \../get-lang.ls
}
# .content-209746772
#     position: relative
#     @import scheme
#     $border-radius: 5px
#     $label-padding: 3px
#     $label-font: 13px
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
#         border-radius: 3px
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
#             color: gray
#         >form
#             >table
#                 background: transparent
#                 border-radius: 5px
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
#                     margin: 1px
#                     border: 0px
#                     box-shadow: none
#                 .amount-field
#                     >.input-wrapper
#                         position: relative
#                         width: 50%
#                         &.small
#                             width: 25%
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
#                                 padding-left: 20px
#                                 border-radius: 0
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
#         .topup
#             display: inline-block
#             margin-left: 5px
#             color: orange
#             vertical-align: top
#             padding: 0 5px
#             border-radius: 3px
#             line-height: 12px
#             font-size: 12px
#         .balance
#             color: #5E72E4
#         .send-all
#             background: #3a63e4
#             outline: none
#             border: 0
#             border-radius: 4px
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
#                 border-radius: 4px
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
#                 border-radius: 5px
#                 width: 100%
#                 display: inline-block
#                 overflow: hidden
#                 .btn
#                     width: auto
#                     min-width: 110px
#                     padding: 0 6px
#                     line-height: 36px
#                     text-transform: uppercase
#                     text-align: center
#                     font-weight: 600
#                     border: 0
#                     margin: 5px
#                     font-size: 12px
#                     border-radius: 5px
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
        change-amount store, send.amount-send
    react.create-element 'div', { on-click: select-option, className: "#{chosen} switch" }, ' ' + option.to-upper-case!
form-group = (title, style, content)->
    react.create-element 'div', { className: 'form-group' }, children = 
        react.create-element 'label', { style: style, className: 'control-label' }, ' ' + title
        content!
send = ({ store, web3t })->
    { token, name, fee-token, network, send, wallet, pending, primary-button-style, recipient-change, amount-change, amount-usd-change, amount-eur-change, use-max-amount, show-data, show-label, topup, history, cancel, send-anyway, choose-auto, choose-cheap, chosen-auto, chosen-cheap, get-address-link, get-address-title, default-button-style, round5edit, round5, send-options, send-title, is-data, encode-decode, change-amount, invoice } = send-funcs store, web3t
    round-money = (val)->
        +val |> (-> it * 100) |> Math.round |> (-> it / 100)
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
    use-max-style =
        background: style.app.wallet
        color: style.app.text
    more-text=
        color: style.app.text
    address-input=
        color: style.app.addressText
        background: style.app.addressBg
    expand-collapse = ->
        store.current.send-menu-open = not store.current.send-menu-open
    lang = get-lang store
    wallet-title = "#{name + network} #{lang.wallet ? 'wallet'}"
    open-invoice = ->
        invoice store, wallet
    react.create-element 'div', { className: 'content content-209746772' }, children = 
        react.create-element 'div', { style: more-text, className: 'content-body' }, children = 
            react.create-element 'div', { className: 'header' }, children = 
                react.create-element 'span', { className: 'head left' }, children = 
                    react.create-element 'img', { src: "#{send.coin.image}" }
                react.create-element 'span', { style: more-text, className: 'head center' }, ' ' + wallet-title
                if store.current.device is \mobile
                    react.create-element 'span', { on-click: expand-collapse, style: icon-style, className: 'head right' }, children = 
                        icon \KebabHorizontal
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
                form-group lang.send-from, icon-style, ->
                    react.create-element 'div', { style: border-style, className: 'address' }, children = 
                        react.create-element 'a', { href: "#{get-address-link wallet}" }, ' ' + get-address-title wallet
                form-group lang.recipient, icon-style, ->
                    react.create-element 'input', { type: 'text', style: input-style, on-change: recipient-change, value: "#{send.to}", placeholder: "#{store.current.send-to-mask}" }
                form-group lang.amount, icon-style, ->
                    react.create-element 'div', {}, children = 
                        react.create-element 'div', { className: 'amount-field' }, children = 
                            react.create-element 'div', { className: 'input-wrapper' }, children = 
                                react.create-element 'div', { className: 'label crypto' }, ' ' + token
                                react.create-element 'input', { type: 'text', style: input-style, on-change: amount-change, placeholder: "0", title: "#{send.amount-send}", value: "#{round5edit send.amount-send}", className: 'amount' }
                            react.create-element 'div', { style: amount-style, className: 'input-wrapper small' }, children = 
                                react.create-element 'div', { className: 'label lusd' }, ' $'
                                react.create-element 'input', { type: 'text', style: input-style, on-change: amount-usd-change, placeholder: "0", title: "#{send.amount-send-usd}", value: "#{round-money send.amount-send-usd}", className: 'amount-usd' }
                            react.create-element 'div', { style: amount-style, className: 'input-wrapper small' }, children = 
                                react.create-element 'div', { className: 'label lusd' }, ' €'
                                react.create-element 'input', { type: 'text', style: input-style, on-change: amount-eur-change, placeholder: "0", title: "#{send.amount-send-eur}", value: "#{round-money send.amount-send-eur}", className: 'amount-eur' }
                        react.create-element 'div', { className: 'usd' }, children = 
                            react.create-element 'button', { on-click: use-max-amount, style: use-max-style, type: "button", className: 'send-all' }, ' ' + lang.use-max ? 'USE MAX'
                            react.create-element 'span', {}, ' ' + lang.balance ? 'balance'
                            react.create-element 'span', { className: 'balance' }, children = 
                                react.create-element 'span', {}, ' ' + wallet.balance + ' ' + token
                                if +wallet.pending-sent >0
                                    react.create-element 'span', { className: 'pending' }, ' - ' + pending + ' ' + lang.pending
                        react.create-element 'div', { title: "#{send.error}", className: 'control-label not-enough text-left' }, ' ' + send.error
                if is-data
                    form-group 'Data', icon-style, ->
                        react.create-element 'div', {}, children = 
                            react.create-element 'input', { read-only: "readonly", value: "#{show-data!}" }
                            react.create-element 'button', { type: "button", on-click: encode-decode }, ' Show ' + show-label!
                react.create-element 'table', { style: border-style }, children = 
                    react.create-element 'tbody', {}, children = 
                        react.create-element 'tr', {}, children = 
                            react.create-element 'td', {}, ' ' + lang.you-spend ? 'You Spend'
                            react.create-element 'td', {}, children = 
                                react.create-element 'div', { title: "#{send.amount-charged}" }, ' ' + round5(send.amount-charged) + '  ' + token
                                react.create-element 'div', { className: 'usd' }, ' $ ' + round5 send.amount-charged-usd
                        react.create-element 'tr', { className: 'green' }, children = 
                            react.create-element 'td', {}, ' ' + lang.recipient-obtains ? 'Recipient Obtains'
                            react.create-element 'td', {}, children = 
                                react.create-element 'div', { className: 'bold' }, ' ' + round5(send.amount-obtain) + '  ' + token
                                react.create-element 'div', { className: 'usd' }, ' $ ' + round5 send.amount-obtain-usd
                        react.create-element 'tr', { className: 'orange' }, children = 
                            react.create-element 'td', {}, ' ' + lang.transaction-fee ? 'Transaction Fee'
                            react.create-element 'td', {}, children = 
                                react.create-element 'div', { title: "#{send.amount-send-fee}" }, ' ' + round5(send.amount-send-fee) + '  ' + fee-token
                                react.create-element 'div', { className: 'usd' }, ' $ ' + round5(send.amount-send-fee-usd)
                react.create-element 'div', { className: 'fast-cheap' }, children = 
                    send-options |> map build-send-option { store, change-amount }
                    react.create-element 'div', { className: 'space' }
                    react.create-element 'div', { on-click: choose-auto, className: "#{chosen-auto} switch" }, ' ' + lang.auto ? 'auto'
                    react.create-element 'div', { on-click: choose-cheap, className: "#{chosen-cheap} switch" }, ' ' + lang.cheap ? 'cheap'
            react.create-element 'div', { className: 'button-container' }, children = 
                react.create-element 'div', { className: 'buttons' }, children = 
                    react.create-element 'a', { on-click: send-anyway, style: primary-button-style, className: 'btn btn-primary' }, children = 
                        react.create-element 'span', {}, ' ' + send-title
                        if send.sending
                            react.create-element 'span', {}, ' ...'
                    react.create-element 'a', { on-click: cancel, style: default-button-style, className: 'btn btn-default' }, ' ' + lang.cancel
module.exports = send