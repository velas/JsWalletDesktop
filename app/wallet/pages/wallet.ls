require! {
    \react
    \../tools.ls : { money }
    \prelude-ls : { each }
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../address-link.ls : { get-address-link, get-address-title }
    \../wallet-funcs.ls
    \../get-lang.ls
    \./icon.ls
    \../get-primary-info.ls
}
#
# .wallet1380897047
#     $cards-height: 324px
#     $pad: 20px
#     $radius: 15px 
#     position: relative
#     cursor: pointer
#     $card-height: 60px
#     height: $card-height
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
#     .pending
#         color: orange
#     &.over
#         background: #CCC
#     &.big
#         height: 135px
#     &.active
#         >.wallet-middle
#             display: inline-block
#     >.wallet-top
#         padding: 0 12px
#         box-sizing: border-box
#         $card-top-height: 50px
#         width: 100%
#         color: #677897
#         font-size: 14px
#         text-align: center
#         overflow: hidden
#         >*
#             display: inline-block
#             box-sizing: border-box
#             vertical-align: top
#             padding-top: 12px
#             height: $card-top-height
#         >.top-left
#             width: 35%
#             text-align: left
#             overflow: hidden
#             text-overflow: ellipsis
#             >*
#                 display: inline-block
#             >.img
#                 line-height: $card-top-height
#                 vertical-align: top
#                 margin-right: 5px
#                 >img
#                     vertical-align: top
#                     max-width: 50px
#                     $s: 35px
#                     border-radius: $s
#                     width: $s
#                     height: $s
#             >.info
#                 text-align: left
#                 margin-left: 0px
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 width: 65px
#                 @media screen and (max-width: 390px)
#                     display: none
#                 >.name
#                     padding-left: 3px
#                 >.price
#                     padding-left: 3px
#                     font-size: 12px
#                     font-weight: bold
#                     overflow: hidden
#                     text-overflow: ellipsis
#         >.top-middle
#             width: 20%
#             text-align: center
#             >.balance
#                 &:last-child
#                     font-weight: bold
#                     font-size: 13px
#                 &.title
#                     @media screen and (max-width: 220px)
#                         display: none
#         >.top-right
#             width: 45%
#             text-align: right
#             >button
#                 outline: none
#                 margin-bottom: 5px
#                 margin-left: 5px
#                 cursor: pointer
#                 border: 1px solid
#                 $round: 36px
#                 padding: 0
#                 box-sizing: border-box
#                 border-radius: 6px
#                 font-size: 10px
#                 width: auto
#                 padding: 0 6px
#                 height: $round
#                 color: #6CA7ED
#                 text-transform: uppercase
#                 font-weight: bold
#                 background: transparent
#                 transition: all .5s
#                 @media screen and (max-width: 800px)
#                     width: 40px
#                 &:hover
#                     background: #7aa7f3
#                     color: white
#     >.wallet-middle
#         $card-top-height: 50px
#         width: 100%
#         padding: 0 12px
#         box-sizing: border-box
#         color: #A8BACB
#         font-size: 14px
#         margin-top: 10px
#         text-align: center
#         position: relative
#         >.uninstall
#             text-align: left
#             font-size: 10px
#             padding-top: 10px
#         >img
#             position: absolute
#             right: 3%
#             margin: 10px
#             margin-left: 50px
#             z-index: 2
#         >a
#             width: 100%
#             z-index: 1
#             position: relative
#             border-radius: 5px
#             border: 0
#             background: #E6F0FF
#             box-sizing: border-box
#             vertical-align: top
#             text-align: center
#             padding-left: 20px
#             padding-right: 25px
#             height: $card-top-height - 14px
#             color: #677897
#             font-size: 14px
#             line-height: $card-top-height - 14px
#             display: inline-block
#             text-overflow: ellipsis
#             overflow: hidden
#             @media screen and (max-width: 390px)
#                 padding-right: 35px
module.exports = (store, web3t, wallets, wallet)-->
    { button-style, uninstall, wallet, active, big, balance, pending, send, receive, expand, usd-rate, last } = wallet-funcs store, web3t, wallets, wallet
    lang = get-lang store
    style = get-primary-info store
    label-uninstall =
        | store.current.refreshing => \...
        | _ => \HIDE
    wallet-style=
        color: style.app.text3
    border-style =
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.wallet
    button-primary1-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text
        background: style.app.primary1
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    address-input=
        color: style.app.addressText
        background: style.app.addressBg
    filter-icon=
        filter: style.app.filterIcon
    react.create-element 'div', { on-click: expand, key: "#{wallet.coin.token}", style: border-style, className: "#{last + ' ' + active + ' ' + big} wallet wallet1380897047" }, children = 
        react.create-element 'div', { className: 'wallet-top' }, children = 
            react.create-element 'div', { style: wallet-style, className: 'top-left' }, children = 
                react.create-element 'div', { className: 'img' }, children = 
                    react.create-element 'img', { src: "#{wallet.coin.image}" }
                react.create-element 'div', { className: 'info' }, children = 
                    react.create-element 'div', { className: 'name' }, ' ' + lang.price ? "Price"
                    react.create-element 'div', { className: 'price' }, ' $' +  money(usd-rate)
            react.create-element 'div', { style: wallet-style, className: 'top-middle' }, children = 
                if +wallet.pending-sent is 0
                    react.create-element 'div', { className: 'balance title' }, ' ' + lang.balance ? 'Balance'
                react.create-element 'div', { className: 'balance' }, children = 
                    react.create-element 'div', {}, ' ' +  balance 
                    if +wallet.pending-sent >0
                        react.create-element 'div', { className: 'pending' }, children = 
                            react.create-element 'span', {}, ' -' + pending
            react.create-element 'div', { className: 'top-right' }, children = 
                react.create-element 'button', { on-click: send(wallet), style: button-primary3-style }, children = 
                    if store.current.device is \mobile
                        icon "ArrowSmallUp", 25
                    if store.current.device is \desktop
                        react.create-element 'span', {}, ' ' + lang.send
                react.create-element 'button', { on-click: receive(wallet), style: button-primary1-style }, children = 
                    if store.current.device is \mobile
                        icon "ArrowSmallDown", 25
                    if store.current.device is \desktop
                        react.create-element 'span', {}, ' ' + lang.receive
        react.create-element 'div', { className: 'wallet-middle' }, children = 
            react.create-element 'a', { target: "_blank", href: "#{get-address-link wallet}", style: address-input }, ' ' + get-address-title wallet
            react.create-element CopyToClipboard, { text: "#{get-address-title wallet}", on-copy: copied-inform(store), style: filter-icon }, children = 
                copy store
            if wallet.coin.token isnt \btc
                react.create-element 'div', { on-click: uninstall, style: wallet-style, className: 'uninstall' }, ' ' + label-uninstall