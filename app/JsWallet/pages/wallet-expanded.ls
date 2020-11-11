require! {
    \react
    \../tools.ls : { money }
    \prelude-ls : { each, find, filter, foldl, map }
    \../wallet-funcs.ls
    \../get-lang.ls
    \../math.ls : { plus }
    \./icon.ls
    \../get-primary-info.ls
    \../../web3t/providers/superagent.ls : { get }
    \../icons.ls
    \../round-human.ls
    \./confirmation.ls : { alert }
    \../components/button.ls
    \../components/address-holder.ls
    \./wallet-stats.ls
}
#
# .wallet-detailed399861167
#     height: 200px
#     box-sizing: border-box
#     $tablet: 1200px
#     >.wallet-part
#         display: inline-block
#         position: relative
#         box-sizing: border-box
#         vertical-align: top
#         width: 50%
#         @media screen and (max-width: $tablet)
#             padding: 0
#         &.left
#             text-align: left
#             @media screen and (max-width: $tablet)
#                 width: 60%
#             >.buttons
#                 margin-top: 15px
#                 .btn
#                     margin: 0
#                     width: 130px
#                     &:last-child
#                         margin-left: 10px
#             >.details
#                 display: none
#             .uninstall
#                 position: relative
#                 text-transform: uppercase
#                 font-size: 10px
#                 padding: 1px 5px 1px 2px
#                 margin-left: 5px
#                 letter-spacing: 2px
#                 cursor: pointer
#                 border-radius: 5px
#             >.address-holder
#                 margin-top: 10px
#                 width: calc((130px * 2) + 10px)
#                 a
#                     padding-left: 10px
#                 @media screen and (max-width: $tablet)
#                     margin-top: 20px
#         &.right
#             @media screen and (max-width: $tablet)
#                 width: 40%
#         >.wallet-header
#             &.chart
#                 text-align: right
#                 padding-top: 0px
#                 border-left: 1px solid rgba(white, 0.2)
#                 border-color: var(--border-color)
#                 @media screen and (max-width: $tablet)
#                     >.wallet-header-part
#                         width: 100%
#                         text-align: center
#                         &.left
#                             display: none
#                         >.stats
#                             margin: 0 auto
#             >.wallet-header-part
#                 display: inline-block
#                 box-sizing: border-box
#                 vertical-align: top
#                 .stats-style
#                     height: 90%
#                     width: 90%
#                     top: 4%
#                     right: 4%
#                     content: ''
#                     display: block
#                     position: absolute
#                     border-radius: 100px
#                     .coin
#                         margin: 20% 28%
#                         text-align: center
#                         .course
#                             font-size: 12px
#                             opacity: .5
#                 &.left
#                     img
#                         width: 40px
#                 &.right
#                     text-align: left
#                     padding: 0
#                     .title
#                         font-size: 10px
#                         text-transform: uppercase
#                         letter-spacing: 2px
#                     .token-balance
#                         font-size: 24px
#                     .usd-balance
#                         font-size: 14px
#                         opacity: .5
#                     .pending
#                         font-size: 14px
#                         color: orange
#                 .counts
#                     margin-bottom: 5px
#                     .label
#                         font-weight: bold
#                         font-size: 12px
#                     .label-icon
#                         width: 25px
#                         height: 25px
#                         background: #f7618a
#                         border-radius: 6px
#                         text-align: center
#                         margin-bottom: 6px
#                         .icon-svg
#                             filter: invert(105%)
#         .stats
#             $size: 150px
#             $size-tablet: 100px
#             margin-right: 20px
#             display: inline-block
#             height: $size
#             max-height: $size
#             width: $size
#             max-width: $size
#             position: relative
#             @media screen and (max-width: $tablet)
#                 height: $size-tablet - 10
#                 max-height: $size-tablet - 10
#                 width: $size-tablet - 10
#                 max-width: $size-tablet - 10
#             >*
#                 height: inherit
#                 width: inherit
cb = console~log
module.exports = (store, web3t, wallets, wallet)-->
    { uninstall, wallet, balance, balance-usd, pending, send, receive, usd-rate } = wallet-funcs store, web3t, wallets, wallet
    lang = get-lang store
    style = get-primary-info store
    label-uninstall =
        | store.current.refreshing => \...
        | _ => "#{lang.hide}"
    wallet-style=
        color: style.app.text3
    placeholder =
        | store.current.refreshing => "placeholder"
        | _ => ""
    placeholder-coin =
        | store.current.refreshing => "placeholder-coin"
        | _ => ""
    name = wallet.coin.name ? wallet.coin.token
    receive-click = receive(wallet)
    send-click = send(wallet)
    token = wallet.coin.token.to-upper-case!
    style = get-primary-info store
    color1 =
        color: style.app.text
        opacity: ".5"
    color2 =
        color: style.app.text
        opacity: ".5"
    get-total = (type, address)->
        transactions = ^^store.transactions.applied
        transactions
            |> filter (it)-> it.type is type and not it.pending?
            |> map (it)->
                return it.amount if it.from isnt it.to
                (-+it.fee) + ''
            |> foldl plus, \0
            |> round-human
    total-sent = get-total \OUT, wallet.address
    total-received = get-total \IN, wallet.address
    wallet-style=
        color: style.app.text3
        background: style.app.wallet
        border-bottom: "0"
        border-color: "#{style.app.border-color}"
    uninstall-style=
        background: style.app.menu
    text=
        color: style.app.text
    color-label=
        background: style.app.primary1
        background-color: style.app.primary1-spare
    color-label2=
        background: style.app.primary2
        background-color: style.app.primary2-spare
    token-display = if token == \VLX2 then \VLX else token
    react.create-element 'div', { key: "#{token}", style: wallet-style, className: 'wallet-detailed wallet-detailed399861167' }, children = 
        react.create-element 'div', { style: text, className: 'wallet-part left' }, children = 
            react.create-element 'div', { className: 'wallet-header' }, children = 
                if no
                    react.create-element 'div', { className: 'wallet-header-part left' }, children = 
                        react.create-element 'img', { src: "#{wallet.coin.image}", className: "#{placeholder-coin} label-coin" }
                react.create-element 'div', { className: 'wallet-header-part right' }, children = 
                    react.create-element 'div', {}, children = 
                        react.create-element 'span', { className: "#{placeholder} title" }, ' ' + name
                        if wallet.coin.token not in <[ btc vlx2 ]>
                            react.create-element 'span', { on-click: uninstall, style: uninstall-style, className: 'uninstall' }, ' ' + label-uninstall
                    react.create-element 'div', { className: "#{placeholder} balance" }, children = 
                        react.create-element 'div', { title: "#{wallet.balance}", className: 'token-balance' }, children = 
                            react.create-element 'span', {}, ' ' +  round-human wallet.balance 
                            react.create-element 'span', {}, ' ' +  token-display 
                        react.create-element 'div', { title: "#{balance-usd}", className: "#{placeholder} usd-balance" }, children = 
                            react.create-element 'span', {}, ' ' +  round-human balance-usd 
                            react.create-element 'span', {}, ' USD'
                        if +wallet.pending-sent >0
                            react.create-element 'div', { className: 'pending' }, children = 
                                react.create-element 'span', {}, ' -' +  pending 
            address-holder { store, wallet, type: \bg }
            react.create-element 'div', { className: 'buttons' }, children = 
                button { store, on-click=send-click, text: \send , icon: \send , type: \primary }
                button { store, on-click=receive-click, text: \receive , icon: \get  , type : \secondary }
            react.create-element 'div', { className: 'details' }, children = 
                react.create-element 'div', { title: "#{balance-usd}", className: "#{placeholder} price" }, ' $' +  round-human balance-usd 
                react.create-element 'div', { title: "#{usd-rate}", className: "#{placeholder} name" }, ' $' +  round-human usd-rate
        react.create-element 'div', { className: 'wallet-part right' }, children = 
            react.create-element 'div', { className: 'wallet-header chart' }, children = 
                react.create-element 'div', { className: 'wallet-header-part left' }, children = 
                    react.create-element 'div', { className: 'stats' }, children = 
                        react.create-element 'span', { className: 'stats-style' }, children = 
                            react.create-element 'div', { style: text, className: 'coin' }, children = 
                                react.create-element 'img', { src: "#{wallet.coin.image}", className: "#{placeholder-coin} label-coin" }
                                react.create-element 'span', { className: "#{placeholder}" }, ' ' +  token-display 
                                react.create-element 'span', { title: "#{usd-rate}", className: "#{placeholder} course" }, ' $' +  round-human usd-rate
                        wallet-stats store, web3t
                react.create-element 'div', { style: text, className: 'wallet-header-part right' }, children = 
                    react.create-element 'div', { className: 'counts' }, children = 
                        react.create-element 'div', { style: color-label, className: 'label-icon' }, children = 
                            react.create-element 'img', { src: "#{icons.send}", className: 'icon-svg' }
                        react.create-element 'div', { className: "#{placeholder}" }, ' ' +  total-sent + ' ' token-display 
                        react.create-element 'div', { style: color1, className: 'label' }, ' ' + lang.totalSent
                    react.create-element 'div', { className: 'counts' }, children = 
                        react.create-element 'div', { style: color-label2, className: 'label-icon' }, children = 
                            react.create-element 'img', { src: "#{icons.get}", className: 'icon-svg' }
                        react.create-element 'div', { className: "#{placeholder}" }, ' ' +  total-received + ' ' token-display 
                        react.create-element 'div', { style: color2, className: 'label' }, ' ' + lang.totalReceived