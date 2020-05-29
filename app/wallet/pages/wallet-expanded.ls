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
# .wallet-detailed1801120048
#     height: 200px
#     box-sizing: border-box
#     >.wallet-part
#         display: inline-block
#         box-sizing: border-box
#         vertical-align: top
#         width: 50%
#         padding: 20px
#         &.left
#             text-align: left
#             >.buttons
#                 margin-top: 10px
#                 .btn
#                     margin: 0
#                     &:last-child
#                         margin-left: 10px
#             >.details
#                 display: none
#         &.right
#         >.wallet-header
#             &.chart
#                 text-align: right
#                 padding-top: 0px
#                 border-left: 1px solid rgba(white, 0.2)
#             >.wallet-header-part
#                 display: inline-block
#                 box-sizing: border-box
#                 vertical-align: top
#                 &.left
#                     img
#                         width: 60px
#                 &.right
#                     padding: 0 10px
#                     >.title
#                         font-size: 25px
#                 .counts
#                     margin-bottom: 5px
#                     .label
#                         font-weight: bold
#                         font-size: 12px
#         .stats
#             $size: 150px
#             $size-tablet: 100px
#             margin-right: 20px
#             display: inline-block
#             height: $size
#             max-height: $size
#             width: $size
#             max-width: $size
#             @media screen and (max-width: 1200px)
#                 height: $size-tablet
#                 max-height: $size-tablet
#                 width: $size-tablet
#                 max-width: $size-tablet
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
        color: style.app.primary1
    color2 =
        color: style.app.primary2
    get-total = (type)->
        store.transactions.applied 
            |> filter (.type is type)
            |> map (.amount)
            |> foldl plus, 0
            |> round-human
    total-sent = get-total \OUT
    total-received = get-total \IN
    wallet-style=
        color: style.app.text3
        background: style.app.wallet
        border-bottom: "1px solid #{style.app.border}"
    react.create-element 'div', { key: "#{token}", style: wallet-style, className: 'wallet-detailed wallet-detailed1801120048' }, children = 
        react.create-element 'div', { className: 'wallet-part left' }, children = 
            react.create-element 'div', { className: 'wallet-header' }, children = 
                react.create-element 'div', { className: 'wallet-header-part left' }, children = 
                    react.create-element 'img', { src: "#{wallet.coin.image}", className: "#{placeholder-coin} label-coin" }
                react.create-element 'div', { className: 'wallet-header-part right' }, children = 
                    react.create-element 'div', { className: "#{placeholder} title" }, ' ' + name
                    react.create-element 'div', { className: "#{placeholder} balance" }, children = 
                        react.create-element 'span', { title: "#{wallet.balance}" }, ' '
                            react.create-element 'span', {}, ' ' +  round-human wallet.balance 
                            react.create-element 'span', {}, ' ' +  token 
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
            react.create-element 'div', {}, children = 
                if wallet.coin.token not in <[ btc vlx vlx2 ]>
                    react.create-element 'div', { on-click: uninstall, className: 'uninstall' }, ' ' + label-uninstall
        react.create-element 'div', { className: 'wallet-part right' }, children = 
            react.create-element 'div', { className: 'wallet-header chart' }, children = 
                react.create-element 'div', { className: 'wallet-header-part left' }, children = 
                    react.create-element 'div', { className: 'stats' }, children = 
                        wallet-stats store, web3t
                react.create-element 'div', { className: 'wallet-header-part right' }, children = 
                    react.create-element 'div', { className: 'counts' }, children = 
                        react.create-element 'div', {}, ' ' +  total-sent + ' ' token 
                        react.create-element 'div', { style: color1, className: 'label' }, ' Total Sent'
                    react.create-element 'div', { className: 'counts' }, children = 
                        react.create-element 'div', {}, ' ' +  total-received + ' ' token 
                        react.create-element 'div', { style: color2, className: 'label' }, ' Total Received'