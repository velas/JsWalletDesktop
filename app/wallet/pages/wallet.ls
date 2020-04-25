require! {
    \react
    \../tools.ls : { money }
    \prelude-ls : { each, find }
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../address-link.ls : { get-address-link, get-address-title }
    \../wallet-funcs.ls
    \../get-lang.ls
    \./icon.ls
    \../get-primary-info.ls
    \../../web3t/providers/superagent.ls : { get }
    \../icons.ls
    \../round-human.ls
}
#
# .wallet-1835115290
#     @import scheme
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
#     &:last-child
#         margin-bottom: 12px
#     .pending
#         color: orange
#     &.over
#         background: #CCC
#     &.big
#         height: 120px
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
#             width: 30%
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
#                 width: auto
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
#             width: 30%
#             text-align: center
#             .label-coin
#                 height: 16px
#                 top: 3px
#                 padding-left: 4px
#                 position: relative
#             @media screen and (max-width: 800px)
#                 width: 35%
#             >.balance
#                 &:last-child
#                     font-weight: bold
#                     font-size: 13px
#                 &.title
#                     @media screen and (max-width: 220px)
#                         display: none
#                 .title-balance
#                     display: none
#         >.top-right
#             width: 40%
#             text-align: right
#             @media screen and (max-width: 800px)
#                 width: 35%
#             >button
#                 outline: none
#                 margin-bottom: 5px
#                 margin-left: 5px
#                 cursor: pointer
#                 border: 1px solid
#                 $round: 36px
#                 padding: 0
#                 box-sizing: border-box
#                 border-radius: $border
#                 font-size: 10px
#                 width: auto
#                 padding: 0 6px
#                 height: $round
#                 color: #6CA7ED
#                 text-transform: uppercase
#                 font-weight: bold
#                 background: transparent
#                 transition: all .5s
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 width: 80px
#                 .icon-svg
#                     @media screen and (max-width: 800px)
#                         padding: 0
#                 .icon
#                     position: relative
#                     height: 16px
#                     top: 2px
#                 @media screen and (max-width: 800px)
#                     width: 40px
#                     line-height: 30px
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
#         .browse
#             display: none
#         &:last-child
#             display: none
#         >.uninstall
#             text-align: left
#             font-size: 10px
#             padding-top: 5px
#         >img
#             position: absolute
#             right: 3%
#             margin: 10px
#             margin-left: 50px
#             z-index: 2
#         >span
#             width: 100%
#             z-index: 1
#             position: relative
#             border-radius: $border
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
#             user-select: text !important
#             cursor: auto
#             @media screen and (max-width: 390px)
#                 padding-right: 25px
#             a
#                 width: auto
#                 z-index: 1
#                 position: relative
#                 border-radius: $border
#                 border: 0
#                 background: transparent
#                 box-sizing: border-box
#                 vertical-align: top
#                 text-align: center
#                 height: $card-top-height - 14px
#                 color: rgb(204, 204, 204)
#                 font-size: 14px
#                 line-height: $card-top-height - 14px
#                 display: inline-block
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 cursor: pointer
#                 user-select: text !important
#                 @media screen and (max-width: 390px)
#                     width: 90%
module.exports = (store, web3t, wallets, wallet)-->
    { button-style, uninstall, wallet, active, big, balance, balance-usd, pending, send, receive, expand, usd-rate, last } = wallet-funcs store, web3t, wallets, wallet
    lang = get-lang store
    style = get-primary-info store
    label-uninstall =
        | store.current.refreshing => \...
        | _ => \ "#{lang.hide}"
    wallet-style=
        color: style.app.text3
    border-style =
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.wallet
    button-primary1-style=
        border: "1px solid #{style.app.primary1}"
        color: style.app.text
        background: style.app.primary1
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary1-style-m=
        border: "1px solid rgb(195, 92, 95)"
        color: style.app.text
        background: "rgb(195, 92, 95)"
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    address-input=
        color: style.app.addressText
        background: style.app.addressBg
    filter-icon=
        filter: style.app.filterIcon
    btn-icon =
        filter: style.app.btn-icon
    placeholder = 
        | store.current.refreshing => "placeholder"
        | _ => ""
    placeholder-coin = 
        | store.current.refreshing => "placeholder-coin"
        | _ => ""
    name = wallet.coin.name ? wallet.coin.token
    load-terms = (cb)->
        #return cb null if store.current.content-migrate?
        err, res <- get \https://raw.githubusercontent.com/okhrimenkoalexey/Velas/master/terms.md .end
        return cb err if err?
        store.terms2 = res.text
        cb null
    migrate = (wallet)-> ->
        #return alert "disabled" if window.location.href.index-of('internal') is -1
        err <- load-terms
        address = 
            store.current.account.wallets 
                |> find (-> it.coin.token is \vlx2) 
                |> (.address)
        return alert "addres #{address} is wrong" if typeof! address isnt \String
        err, data <- get "https://mainnet-v2.velas.com/migration/topup-velas-address/#{address}" .end
        return alert "#{err}" if err?
        return alert "cannot create address" if not data.body?address?
        store.current.token-migration = data.body.address
        #store.current.token-migration = "V123"
    react.create-element 'div', { on-click: expand, key: "#{wallet.coin.token}", style: border-style, className: "#{last + ' ' + active + ' ' + big} wallet wallet-1835115290" }, children = 
        react.create-element 'div', { className: 'wallet-top' }, children = 
            react.create-element 'div', { style: wallet-style, className: 'top-left' }, children = 
                react.create-element 'div', { className: "#{placeholder-coin} img" }, children = 
                    react.create-element 'img', { src: "#{wallet.coin.image}" }
                react.create-element 'div', { className: 'info' }, children = 
                    react.create-element 'div', { title: "#{usd-rate}", className: "#{placeholder} name" }, ' $' +  round-human usd-rate
                    react.create-element 'div', { title: "#{balance-usd}", className: "#{placeholder} price" }, ' $' +  round-human balance-usd
            react.create-element 'div', { style: wallet-style, className: 'top-middle' }, children = 
                if +wallet.pending-sent is 0
                    react.create-element 'div', { className: "#{placeholder} balance title" }, ' ' + name
                react.create-element 'div', { className: "#{placeholder} balance" }, children = 
                    react.create-element 'span', { title: "#{wallet.balance}" }, ' ' +  round-human wallet.balance 
                        react.create-element 'img', { src: "#{wallet.coin.image}", className: "#{placeholder-coin} label-coin" }
                        react.create-element 'span', {}, ' ' +  wallet.coin.token.to-upper-case! 
                    if +wallet.pending-sent >0
                        react.create-element 'div', { className: 'pending' }, children = 
                            react.create-element 'span', {}, ' -' +  pending 
                react.create-element 'div', { title: "#{balance-usd}", className: "#{placeholder} price" }, ' $' +  round-human balance-usd 
            react.create-element 'div', { className: 'top-right' }, children = 
                if store.current.device is \desktop
                    react.create-element 'button', { on-click: expand, style: button-primary3-style, className: 'btn-open' }, children = 
                        react.create-element 'img', { src: "#{icons.open}", style: btn-icon, className: 'icon' }
                react.create-element 'button', { on-click: send(wallet), style: button-primary1-style }, children = 
                    if store.current.device is \mobile
                        react.create-element 'img', { src: "#{icons.send}", className: 'icon-svg' }
                    if store.current.device is \desktop
                        react.create-element 'span', {}, children = 
                            react.create-element 'img', { src: "#{icons.send}", className: 'icon-svg' }
                            """ #{lang.send}"""
                if wallet.coin.token isnt \vlx or store.current.device isnt \desktop
                    react.create-element 'button', { on-click: receive(wallet), style: button-primary2-style }, children = 
                        if store.current.device is \mobile
                            react.create-element 'img', { src: "#{icons.get}", className: 'icon-svg' }
                        if store.current.device is \desktop
                            react.create-element 'span', {}, children = 
                                react.create-element 'img', { src: "#{icons.get}", className: 'icon-svg' }
                                """ #{lang.receive}"""
                else
                    react.create-element 'button', { on-click: migrate(wallet), style: button-primary1-style-m }, children = 
                        react.create-element 'span', {}, children = 
                            react.create-element 'img', { src: "#{icons.migrate}", className: 'icon-svg' }
                            """ #{lang.btn-migrate}"""
        react.create-element 'div', { className: 'wallet-middle' }, children = 
            react.create-element 'span', { style: address-input }, children = 
                react.create-element 'a', { target: "_blank", href: "#{get-address-link wallet}", className: 'browse' }, children = 
                    react.create-element 'img', { src: "#{icons.browse-open}" }
                react.create-element 'a', { target: "_blank", href: "#{get-address-link wallet}" }, ' ' + get-address-title wallet
            react.create-element CopyToClipboard, { text: "#{get-address-title wallet}", on-copy: copied-inform(store), style: filter-icon }, children = 
                copy store
            if wallet.coin.token not in <[ btc vlx vlx2 ]>
                react.create-element 'div', { on-click: uninstall, style: wallet-style, className: 'uninstall' }, ' ' + label-uninstall
        react.create-element 'div', { className: 'wallet-middle title-balance' }, children = 
            react.create-element 'div', { title: "#{usd-rate}", className: "#{placeholder} name" }, ' $' +  round-human(usd-rate)
            react.create-element 'div', { className: "#{placeholder} name per" }, ' Per 1 ' +  wallet.coin.token.to-upper-case! 