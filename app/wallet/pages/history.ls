require! {
    \react
    \prelude-ls : { sort-by, reverse, filter, map, find }
    \../history-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./loading.ls
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../icons.ls
    \react-middle-ellipsis : { default: MiddleEllipsis }
}
# .history944185242
#     @import scheme
#     width: 100%
#     position: relative
#     padding-bottom: 0px
#     display: inline-block
#     .icon-svg1
#         position: relative
#         border-radius: 0px
#         height: 15px
#         top: 2px
#     .icon-svg-arrow
#         position: relative
#         height: 12px
#         top: 0px
#     .smart-contract
#         padding-left: 10px
#         color: orange
#     &.normalheader
#         @media(max-width: 800px)
#             margin: 60px 0 0
#     .sign
#         margin-right: 5px
#         font-size: 15px !important
#         font-weight: 600
#         vertical-align: text-top
#     .nothin-to-show
#         color: rgba(white, 0.5)
#         padding-top: 50px
#         text-align: center
#         top: 30%
#         width: 100%
#         position: absolute
#         img
#             height: 50px
#             border-radius: 0
#             margin-bottom: 30px
#         .head
#             font-weight: 600
#             margin-bottom: 10px
#         .content
#             font-size: 14px
#             opacity: .7
#     .header-table
#         .cell
#             font-size: 12px
#             padding: 10px 15px
#             margin: 0
#             display: inline-block
#             vertical-align: top
#             box-sizing: border-box
#             color: rgb(204, 204, 204)
#             overflow-y: hidden
#             &.network
#                 width: 10%
#                 text-align: center
#             &.txhash
#                 width: 55%
#                 text-align: left
#             &.amount
#                 width: 35%
#                 text-align: right
#     .header, .header-table
#         text-align: left
#         height: 60px
#         box-sizing: border-box
#         left: 0
#         top: 0
#         width: 100%
#         .head
#             display: inline-block
#             &.left
#                 padding: 0px 0 10px 10px
#                 margin-top: 21px
#             &.right
#                 float: right
#                 padding: 0px 10px 0px 0
#                 margin-top: 17px
#                 cursor: pointer
#             &.h1
#                 font-size: 12px
#                 text-transform: uppercase
#                 letter-spacing: 2px
#                 opacity: .8
#         .filter
#             width: 226px
#             background: #321260
#             position: absolute
#             top: 59px
#             right: 0
#             display: inline-grid
#             z-index: 1
#             .bottom, .middle
#                 padding: 10px
#             .top
#                 padding: 0
#                 display: flex
#                 button
#                     width: 50% !important
#                     border: 0 !important
#                     border-radius: 0 !important
#                     margin: 0 !important
#                     height: 39px
#                     text-transform: uppercase
#                     &.active
#                         filter: brightness(1.3)
#             .middle
#                 div
#                     line-height: 7px
#                     &:first-child
#                         margin-bottom: 10px
#                 label
#                     font-size: 10px
#                     text-transform: uppercase
#                 input
#                     outline: none
#                     width: 100%
#                     box-sizing: border-box
#                     height: 36px
#                     line-height: 36px
#                     border-radius: $border
#                     padding: 0px 10px
#                     font-size: 14px
#                     border: 0px
#                     box-shadow: none
#                 button
#                     outline: none
#                     cursor: pointer
#                     border: 1px solid
#                     padding: 0
#                     box-sizing: border-box
#                     border-radius: $border
#                     font-size: 10px
#                     padding: 0 6px
#                     height: 36px
#                     color: #6CA7ED
#                     text-transform: uppercase
#                     font-weight: bold
#                     background: transparent
#                     transition: all .5s
#                     text-overflow: ellipsis
#                     overflow: hidden
#                     width: 100%
#                     margin: 0 auto
#                     opacity: 1
#                     margin-top: 10px
#             button
#                 border-radius: 50px
#                 margin: 2px
#                 border: 2px solid hsla(0, 0%, 79%, 0.15)
#                 opacity: .85
#                 border-width: 3px
#                 &.active
#                     opacity: 1
#                 img
#                     height: 33px
#                     &.icon-svg
#                         height: 10px
#                         padding: 0 0 3px 0
#                     &.icon-svg-btn
#                         height: 12px
#                         padding: 0px 5px 0 0px
#                 &.OUT
#                     img
#                         filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
#                     color: #be6ed2
#                 &.IN
#                     img
#                         filter: invert(15%) sepia(14%) saturate(950%) hue-rotate(110deg) brightness(87%) contrast(85%)
#                     color: #71c5aa
#         .separator
#             min-width: 2px
#             display: inline-block
#         button 
#             outline: none
#             cursor: pointer
#             border: 0
#             background: transparent
#             display: inline-block
#             vertical-align: top
#             margin-left: -1px
#             padding: 0
#             &.active
#                 border-color: #9d40eb
#                 background: rgba(59, 213, 175, 0.25)
#                 border-width: 3px
#             line-height: 12px
#             height: 45px
#             width: 45px
#             font-size: 10px
#             text-align: center
#             &.back
#                 height: 60px
#                 width: 60px
#             >*
#                 vertical-align: middle
#                 display: inline-block
#             &.fl
#                 float: right
#     .bold
#         color: #b2951bad
#         font-style: italic
#         &.delete
#             cursor: pointer
#             font-style: normal
#             font-size: 10px
#             margin-left: 7px
#             color: #ffffff
#             background: #e6307a
#             border-radius: $border
#             width: auto
#             letter-spacing: .5px
#             padding: 0px 3px 1px 0px
#         .icon-check
#             width: 12px
#             height: 12px !important
#             vertical-align: middle
#         &.confirmed
#             font-style: normal
#             font-size: 11px
#             margin-left: 3px
#             color: rgb(60, 213, 175)
#             border-radius: $border
#             width: auto
#             letter-spacing: .5px
#             padding: 0px 3px 1px 0px
#     .syncing
#         svg
#             color: orange
#             height: 12px
#             width: 15px
#             margin-left: 4px
#             @keyframes spin
#                 from
#                     transform: rotate(0deg)
#                 to 
#                     transform: rotate(360deg)
#             animation-name: spin
#             animation-duration: 4000ms
#             animation-iteration-count: infinite
#             animation-timing-function: linear
#     .fee
#         display: inline-block
#         margin-right: 5px
#     .balance
#         display: inline-block
#         >*
#             display: inline-block
#         .color
#             font-weight: 600
#         .rest
#             color: inherit
#             opacity: .75
#     .table
#         width: 100%
#         height: calc(100vh - 80px)
#         overflow-y: scroll
#         margin-top: -1px
#         .head, .record
#             &.record
#                 border-radius: 0px
#                 .tx-top
#                     cursor: default
#                     height: 59px
#                     position: relative
#                 .tx-middle
#                     height: 60px
#                 &:last-child
#                     margin-bottom: 12px
#                 &:first-child
#                     border-top: 1px solid rgb(107, 38, 142)
#             .cell
#                 padding: 10px 0 10px 10px
#                 display: inline-block
#                 vertical-align: top
#                 box-sizing: border-box
#                 text-align: left
#                 height: 59px
#                 white-space: nowrap
#                 overflow: hidden
#                 &:last-child
#                     padding-right: 10px
#                 @media screen and (max-width: 800px)
#                     overflow-x: scroll
#                     overflow-y: hidden
#                 &.network
#                     width: 10%
#                     div
#                         text-align: center
#                 &.txhash
#                     width: 60%
#                     div:first-child
#                         display: inline
#                     .loader-ios
#                         margin-left: 10px
#                     a
#                         font-size: 14px
#                     img
#                         border-radius: inherit
#                         border: none
#                         margin-left: 3px
#                         height: 12px
#                         left: 3px
#                         position: relative
#                 &.amount
#                     width: 24%
#                     text-align: right
#                 &.divider2
#                     width: 30%
#                 &.divider
#                     width: 10%
#                     .direction
#                         text-align: center
#                         line-height: 40px
#                 &.arrow
#                     width: 5%
#                     text-align: center
#                     line-height: 40px
#                     opacity: .5
#                     padding-left: 0
#                 &.created
#                     width: 20%
#                     text-align: left
#                     .syncing
#                         svg
#                             width: auto
#                             height: 14px
#                             margin: 0
#                             vertical-align: middle !important
#                     .bold
#                         margin-right: 5px
#                         .icon-check
#                             opacity: .8;
#                             vertical-align: inherit
#                             top: 1px
#                             position: relative
#                             width: 15px
#                             height: 13px !important
#                     a
#                         display: block
#                         text-overflow: ellipsis
#                         overflow: hidden
#                         width: 100%
#                         font-size: 14px
#                         text-decoration: none
#                 &.more
#                     text-align: center
#                     width: 6%
#                     line-height: 40px
#                     cursor: pointer
#                     &:hover
#                         .arrow_box
#                             opacity: 1
#                     .arrow_box
#                         position: absolute
#                         text-transform: uppercase
#                         right: 6%
#                         top: 17px
#                         z-index: 1
#                         line-height: 14px
#                         font-size: 10px
#                         font-weight: 600
#                         color: #fff
#                         padding: 5px
#                         background: #210b4a
#                         opacity: 0
#                         transition: opacity .5s
#                         border: 1px solid #6b268e
#                         &:after, &:before
#                             left: 100%
#                             top: 15%
#                             border: solid transparent
#                             content: " "
#                             height: 0
#                             width: 0
#                             position: absolute
#                             pointer-events: none
#                         &:after
#                             border-color: rgba(136, 183, 213, 0)
#                             border-left-color: #210b4a
#                             border-width: 6px
#                             margin-top: 2px
#                         &:before
#                             border-color: rgba(194, 225, 245, 0)
#                             border-left-color: #6b268e
#                             border-width: 8px
#                             margin-top: 0px
#                 &.details-from, &.details-to
#                     width: 40%
#                     text-align: left
#                     height: 60px
#                     div:last-child
#                         width: 330px
#                     a
#                         display: block
#                         font-size: 14px
#                         text-decoration: none
#                         &:hover
#                             text-decoration: underline
#             .gray
#                 $gray: #8290ad
#                 color: $gray
#                 font-size: 12px
#                 .color
#                     font-size: 12px
#                     color: $gray
#                 img
#                     border-radius: inherit
#                     border: none
#                     margin-left: 3px
#                     height: 12px
#                     left: 3px
#                     position: relative
#             .type
#                 text-align: center
#             .direction
#                 font-size: 11px
#                 text-overflow: ellipsis
#                 white-space: nowrap
#                 overflow: hidden
#                 text-transform: uppercase
#             &.OUT
#                 &.record
#                     .tx-top
#                         .details-from
#                             display: none
#                 .direction
#                     img
#                         filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
#                     color: #be6ed2
#                 .txhash a
#                     color: #be6ed2
#             &.IN
#                 &.record
#                     .tx-top
#                         .details-to
#                             display: none
#                 .direction
#                     img
#                         filter: invert(15%) sepia(14%) saturate(950%) hue-rotate(110deg) brightness(87%) contrast(85%)
#                     color: #71c5aa
#                 .txhash a
#                     color: #71c5aa
#     .panel-footer
#         padding: 10px
#     img
#         height: 20px
#         border-radius: 0
#         &.icon-svg
#             position: relative
#             border-radius: 0px
#             height: 12px
#             top: 2px
#     .hidden
#         display: none !important
#     .loader-ios
#         position: relative
#         display: inline-block
#         vertical-align: middle
#         -webkit-animation: iosIntro 0.6s
#         animation: iosIntro 0.6s
#         svg
#             fill: #c5c5c5
#             path
#                 &:nth-of-type(1)
#                     -webkit-animation: pulsed 1s infinite linear
#                     animation: pulsed 1s infinite linear
#                 &:nth-of-type(2)
#                     -webkit-animation: pulsed 1s -0.083s infinite linear
#                     animation: pulsed 1s -0.083s infinite linear
#                 &:nth-of-type(3)
#                     -webkit-animation: pulsed 1s -0.166s infinite linear
#                     animation: pulsed 1s -0.166s infinite linear
#                 &:nth-of-type(4)
#                     -webkit-animation: pulsed 1s -0.249s infinite linear
#                     animation: pulsed 1s -0.249s infinite linear
#                 &:nth-of-type(5)
#                     -webkit-animation: pulsed 1s -0.332s infinite linear
#                     animation: pulsed 1s -0.332s infinite linear
#                 &:nth-of-type(6)
#                     -webkit-animation: pulsed 1s -0.415s infinite linear
#                     animation: pulsed 1s -0.415s infinite linear
#                 &:nth-of-type(7)
#                     -webkit-animation: pulsed 1s -0.498s infinite linear
#                     animation: pulsed 1s -0.498s infinite linear
#                 &:nth-of-type(8)
#                     -webkit-animation: pulsed 1s -0.581s infinite linear
#                     animation: pulsed 1s -0.581s infinite linear
#                 &:nth-of-type(9)
#                     -webkit-animation: pulsed 1s -0.664s infinite linear
#                     animation: pulsed 1s -0.664s infinite linear
#                 &:nth-of-type(10)
#                     -webkit-animation: pulsed 1s -0.747s infinite linear
#                     animation: pulsed 1s -0.747s infinite linear
#                 &:nth-of-type(11)
#                     -webkit-animation: pulsed 1s -0.83s infinite linear
#                     animation: pulsed 1s -0.83s infinite linear
#                 &:nth-of-type(12)
#                     -webkit-animation: pulsed 1s -0.913s infinite linear
#                     animation: pulsed 1s -0.913s infinite linear
#     @-webkit-keyframes pulsed
#         50%
#             fill: #868686
#         to
#             fill: rgba(134, 134, 134, 0.4)
#     @keyframes pulsed
#         50%
#             fill: #868686
#         to
#             fill: rgba(134, 134, 134, 0.4)
#     @-webkit-keyframes iosIntro
#         from
#             -webkit-transform: scale(1)
#             transform: scale(1)
#             opacity: 1
#         to
#             -webkit-transform: scale(1)
#             transform: scale(1)
#             opacity: 1
#     @keyframes iosIntro
#         from
#             -webkit-transform: scale(1)
#             transform: scale(1)
#             opacity: 1
#         to
#             -webkit-transform: scale(1)
#             transform: scale(1)
#             opacity: 1
loader = ({ store, web3t })->
    react.create-element 'div', { className: 'loader-ios' }, children = 
        react.create-element 'svg', { width: '15px', height: '15px', viewbox: '0 0 15 15', version: '1.1', xmlns: 'http://www.w3.org/2000/svg' }, children = 
            react.create-element 'path', { d: 'M10.3866667,5.83333333 C10.2338889,5.56722222 10.3238889,5.22777778 10.5894444,5.07388889 L13.2333333,3.54555556 C13.5011111,3.39388889 13.8416667,3.48444444 13.9944444,3.75 C14.1477778,4.01611111 14.0583333,4.35666667 13.7922222,4.50777778 L11.1455556,6.03611111 C10.8794444,6.18944444 10.5405556,6.09833333 10.3866667,5.83333333 Z' }
            react.create-element 'path', { d: 'M8.96277778,3.85444444 L10.4905556,1.20722222 C10.6438889,0.941666667 10.9844444,0.85 11.25,1.00388889 C11.5161111,1.15722222 11.6061111,1.49611111 11.4527778,1.76277778 L9.92611111,4.40833333 C9.77277778,4.675 9.43277778,4.76666667 9.16666667,4.61277778 C8.90055556,4.45944444 8.80888889,4.11888889 8.96277778,3.85444444 Z' }
            react.create-element 'path', { d: 'M7.49944444,4.16666667 C7.19277778,4.16666667 6.94388889,3.91777778 6.94388889,3.61055556 L6.94388889,0.555555556 C6.94388889,0.247777778 7.19277778,0 7.49944444,0 C7.80722222,0 8.05666667,0.248333333 8.05666667,0.555555556 L8.05666667,3.61055556 C8.05555556,3.91833333 7.80722222,4.16666667 7.49944444,4.16666667 Z' }
            react.create-element 'path', { d: 'M4.61277778,5.83333333 C4.45888889,6.09833333 4.11944444,6.18944444 3.85444444,6.03611111 L1.20833333,4.50777778 C0.942777778,4.35666667 0.851111111,4.01611111 1.00444444,3.75 C1.15833333,3.48388889 1.49888889,3.39333333 1.76388889,3.54555556 L4.40944444,5.07388889 C4.67555556,5.22777778 4.76666667,5.56722222 4.61277778,5.83333333 Z' }
            react.create-element 'path', { d: 'M5.07388889,4.40944444 L3.54611111,1.76333333 C3.39277778,1.49666667 3.48444444,1.15777778 3.74888889,1.00444444 C4.015,0.850555556 4.35444444,0.941111111 4.50833333,1.20777778 L6.03611111,3.855 C6.18833333,4.11944444 6.09833333,4.45944444 5.83222222,4.61277778 C5.56722222,4.76722222 5.22722222,4.675 5.07388889,4.40944444 Z' }
            react.create-element 'path', { d: 'M3.61055556,8.05555556 L0.555555556,8.05555556 C0.247777778,8.05555556 0,7.80666667 0,7.5 C0,7.19222222 0.248333333,6.94388889 0.555555556,6.94388889 L3.61055556,6.94388889 C3.91722222,6.94388889 4.16666667,7.19277778 4.16666667,7.5 C4.16666667,7.80666667 3.91777778,8.05555556 3.61055556,8.05555556 Z' }
            react.create-element 'path', { d: 'M4.61277778,9.16777778 C4.76666667,9.43333333 4.67555556,9.77222222 4.41,9.92666667 L1.76444444,11.4538889 C1.49888889,11.6055556 1.15833333,11.5161111 1.00444444,11.2505556 C0.851111111,10.9844444 0.942777778,10.6455556 1.20833333,10.4905556 L3.85388889,8.96388889 C4.11944444,8.80888889 4.45888889,8.90055556 4.61277778,9.16777778 Z' }
            react.create-element 'path', { d: 'M6.03666667,11.1455556 L4.50888889,13.7938889 C4.355,14.0577778 4.01444444,14.1488889 3.74944444,13.995 C3.48444444,13.8411111 3.39277778,13.5027778 3.54666667,13.2366667 L5.07444444,10.59 C5.22833333,10.325 5.56777778,10.2355556 5.83333333,10.3872222 C6.09888889,10.5411111 6.18944444,10.8805556 6.03666667,11.1455556 Z' }
            react.create-element 'path', { d: 'M7.49944444,10.8344444 C7.80722222,10.8344444 8.05666667,11.0833333 8.05666667,11.3911111 L8.05666667,14.4455556 C8.05666667,14.7511111 7.80777778,15.0005556 7.49944444,15.0005556 C7.19277778,15.0005556 6.94388889,14.7522222 6.94388889,14.4455556 L6.94388889,11.3911111 C6.94388889,11.0833333 7.19222222,10.8344444 7.49944444,10.8344444 Z' }
            react.create-element 'path', { d: 'M9.92611111,10.59 L11.4527778,13.2366667 C11.6055556,13.5027778 11.5155556,13.8411111 11.25,13.995 C10.9838889,14.1483333 10.6438889,14.0572222 10.4905556,13.7938889 L8.96277778,11.1455556 C8.80944444,10.8805556 8.90111111,10.5411111 9.16666667,10.3872222 C9.43277778,10.2355556 9.77277778,10.325 9.92611111,10.59 Z' }
            react.create-element 'path', { d: 'M10.3866667,9.16777778 C10.54,8.90111111 10.8794444,8.80888889 11.145,8.96388889 L13.7922222,10.4905556 C14.0583333,10.6455556 14.1477778,10.9844444 13.9944444,11.2505556 C13.8416667,11.5166667 13.5011111,11.6061111 13.2333333,11.4538889 L10.5894444,9.92666667 C10.3238889,9.77222222 10.2338889,9.43277778 10.3866667,9.16777778 Z' }
            react.create-element 'path', { d: 'M14.4433333,6.94388889 L11.3872222,6.94388889 C11.0805556,6.94388889 10.8311111,7.19277778 10.8311111,7.5 C10.8311111,7.80666667 11.0794444,8.05555556 11.3872222,8.05555556 L14.4433333,8.05555556 C14.7511111,8.05555556 15,7.80666667 15,7.5 C15,7.19222222 14.7511111,6.94388889 14.4433333,6.94388889 Z' }
render-transaction = (store, web3t, tran)-->
    { transaction-info, coins, cut-tx, arrow, arrow-lg, sign, delete-pending-tx, amount-beautify, ago } = history-funcs store, web3t
    style = get-primary-info store
    filter-icon=
        filter: style.app.filterIcon
    lang = get-lang store
    menu-style=
        color: style.app.text
    border-style =
        border-bottom: "1px solid #{style.app.border}"
    line-style =
        background: style.app.wallet
    light-style =
        background: style.app.wallet-light
    lightText=
        color: style.app.addressText
    { token, tx, amount, fee, time, url, type, pending, from, to, recipient-type, description } = tran
    coin = 
        coins |> find (.token is token)
    return null if not coin?
    network = coin[store.current.network]
    request = { network, tx }
    tx-details = ->
        store.history.tx-details = 
            | store.history.tx-details is tx => null
            | _ => tx
    cut-tx = (tx)->
        return \none if not tx?
        t = tx.to-string!
        m = Math.max(document.documentElement.clientWidth, window.innerWidth or 0)
        r =
            | m > 800 => t.substr(0, 4) + \.. + t.substr(tx.length - 25, 0) + \.. + t.substr(t.length - 4, 4)
            | _ => t.substr(0, 4) + \.. + t.substr(tx.length - 25, 0) + \.. + t.substr(t.length - 4, 4)
    cut-hash = (tx)->
        return \none if not tx?
        t = tx.to-string!
        r = t.substr(0, 4) + \.. + t.substr(tx.length - 25, 15) + \.. + t.substr(t.length - 4, 4)
        #r.to-upper-case!
    icon-pending=
        filter: if pending is yes then 'grayscale(100%) brightness(40%) sepia(100%) hue-rotate(-370deg) saturate(790%) contrast(0.5)' else ''
    amount-pending=
        color: if pending is yes then 'orange' else ''
    about = 
        | recipient-type is \contract => 'Smart'
        | description is \internal => 'Smart'
        | description is \external => 'User'
        | _ => 'Unknown'
    react.create-element 'div', { key: "#{tx + type}", style: border-style, className: "#{type} record" }, children = 
        react.create-element 'div', { style: line-style, className: 'tx-top' }, children = 
            react.create-element 'div', { className: 'cell text-center network' }, children = 
                react.create-element 'div', {}, children = 
                    react.create-element 'img', { src: "#{coin.image}" }
                if no    
                    react.create-element 'div', { className: 'direction' }, ' ' + arrow(type)
                react.create-element 'div', { className: 'direction' }, children = 
                    react.create-element 'img', { src: "#{arrow-lg(type)}", className: 'icon-svg' }
            react.create-element 'div', { className: 'cell details-from' }, children = 
                react.create-element 'div', { style: lightText, className: 'gray' }, children = 
                    react.create-element 'span', {}, ' ' + lang.tx-from + ':'
                    react.create-element CopyToClipboard, { text: "#{from}", on-copy: copied-inform(store), style: filter-icon }, children = 
                        copy store
                    react.create-element 'span', { className: 'smart-contract' }, ' ' + about
                react.create-element MiddleEllipsis, {}, children = 
                    react.create-element 'a', { target: "_blank", style: menu-style }, ' ' + from
            if no
                react.create-element 'div', { className: 'cell arrow' }, children = 
                    react.create-element 'img', { src: "#{icons.arrow-right}", className: 'icon-svg1' }
            react.create-element 'div', { className: 'cell details-to' }, children = 
                react.create-element 'div', { style: lightText, className: 'gray' }, children = 
                    react.create-element 'span', {}, ' ' + lang.tx-to + ':'
                    react.create-element CopyToClipboard, { text: "#{to}", on-copy: copied-inform(store), style: filter-icon }, children = 
                        copy store
                    react.create-element 'span', { className: 'smart-contract' }, ' ' + about
                react.create-element MiddleEllipsis, {}, children = 
                    react.create-element 'a', { target: "_blank", style: menu-style }, ' ' + to
            react.create-element 'div', { className: 'cell created' }, children = 
                react.create-element 'div', { style: lightText, className: 'gray' }, children = 
                    react.create-element 'span', {}, ' ' + lang.created + ': '
                react.create-element 'a', {}, children = 
                    if pending is yes
                        react.create-element 'span', {}, children = 
                            react.create-element 'span', { className: 'bold' }, children = 
                                loader store, web3t
                                if no
                                    icon \Sync, 10
                    else
                        react.create-element 'span', {}, children = 
                            react.create-element 'span', { className: 'bold' }, children = 
                                react.create-element 'img', { src: 'data:image/svg+xml;base64,\PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTI7IiB4bWw6c3BhY2U9InByZXNlcnZlIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiI+PGc+PGc+Cgk8Zz4KCQk8cGF0aCBkPSJNNTA0LjUwMiw3NS40OTZjLTkuOTk3LTkuOTk4LTI2LjIwNS05Ljk5OC0zNi4yMDQsMEwxNjEuNTk0LDM4Mi4yMDNMNDMuNzAyLDI2NC4zMTFjLTkuOTk3LTkuOTk4LTI2LjIwNS05Ljk5Ny0zNi4yMDQsMCAgICBjLTkuOTk4LDkuOTk3LTkuOTk4LDI2LjIwNSwwLDM2LjIwM2wxMzUuOTk0LDEzNS45OTJjOS45OTQsOS45OTcsMjYuMjE0LDkuOTksMzYuMjA0LDBMNTA0LjUwMiwxMTEuNyAgICBDNTE0LjUsMTAxLjcwMyw1MTQuNDk5LDg1LjQ5NCw1MDQuNTAyLDc1LjQ5NnoiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIGNsYXNzPSJhY3RpdmUtcGF0aCIgc3R5bGU9ImZpbGw6IzNDRDVBRiIgZGF0YS1vbGRfY29sb3I9IiMwMDAwMDAiPjwvcGF0aD4KCTwvZz4KPC9nPjwvZz4gPC9zdmc+', className: 'icon-check' }
                                if no
                                    react.create-element 'img', { src: "#{icons.sent-check}", className: 'icon-check' }, ' '
                    """#{ago time}"""
            react.create-element 'div', { style: menu-style, className: 'cell amount' }, children = 
                react.create-element 'div', { title: "#{amount}", style: amount-pending }, children = 
                    react.create-element 'span', { className: 'sign direction' }, ' ' + sign(type)
                    amount-beautify amount, 8
                react.create-element 'div', { style: lightText, className: 'gray' }, children = 
                    react.create-element 'span', { className: 'fee' }, ' ' + lang.fee + ':'
                    amount-beautify fee, 10
            react.create-element 'div', { on-click: tx-details, className: 'cell divider more' }, children = 
                react.create-element 'img', { src: "#{icons.more}", style: icon-pending, className: 'icon-svg1' }
                react.create-element 'div', { className: 'arrow_box' }, ' details'
        if store.history.tx-details is tx
            react.create-element 'div', { style: light-style, on-click: transaction-info(request), className: 'tx-middle' }, children = 
                react.create-element 'div', { className: 'cell divider' }, children = 
                    if no
                        react.create-element 'div', { className: 'direction' }, ' ' + arrow(type)
                react.create-element 'div', { className: 'cell txhash' }, children = 
                    react.create-element MiddleEllipsis, {}, children = 
                        react.create-element 'a', { href: "#{url}", target: "_blank" }, ' ' + tx
                    react.create-element CopyToClipboard, { text: "#{tx}", on-copy: copied-inform(store), style: filter-icon }, children = 
                        copy store
                    react.create-element 'div', { style: lightText, className: 'gray' }, children = 
                        react.create-element 'span', {}, ' ' + lang.created + ': '
                            """ #{ago time}"""
                        if pending is yes
                            react.create-element 'span', {}, children = 
                                react.create-element 'span', { on-click: delete-pending-tx(tran), className: 'bold delete' }, ' ' + lang.delete
                        else
                            react.create-element 'span', {}, children = 
                                react.create-element 'span', { className: 'bold' }, children = 
                                    react.create-element 'img', { src: 'data:image/svg+xml;base64,\PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTI7IiB4bWw6c3BhY2U9InByZXNlcnZlIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiI+PGc+PGc+Cgk8Zz4KCQk8cGF0aCBkPSJNNTA0LjUwMiw3NS40OTZjLTkuOTk3LTkuOTk4LTI2LjIwNS05Ljk5OC0zNi4yMDQsMEwxNjEuNTk0LDM4Mi4yMDNMNDMuNzAyLDI2NC4zMTFjLTkuOTk3LTkuOTk4LTI2LjIwNS05Ljk5Ny0zNi4yMDQsMCAgICBjLTkuOTk4LDkuOTk3LTkuOTk4LDI2LjIwNSwwLDM2LjIwM2wxMzUuOTk0LDEzNS45OTJjOS45OTQsOS45OTcsMjYuMjE0LDkuOTksMzYuMjA0LDBMNTA0LjUwMiwxMTEuNyAgICBDNTE0LjUsMTAxLjcwMyw1MTQuNDk5LDg1LjQ5NCw1MDQuNTAyLDc1LjQ5NnoiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIGNsYXNzPSJhY3RpdmUtcGF0aCIgc3R5bGU9ImZpbGw6IzNDRDVBRiIgZGF0YS1vbGRfY29sb3I9IiMwMDAwMDAiPjwvcGF0aD4KCTwvZz4KPC9nPjwvZz4gPC9zdmc+', className: 'icon-check' }
                                react.create-element 'span', { className: 'bold confirmed' }, ' confirmed'
                react.create-element 'div', { className: 'cell divider2' }
module.exports = ({ store, web3t })->
    { go-back, switch-type-in, switch-type-out, coins, is-active, switch-filter } = history-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    header-style =
        border-bottom: "1px solid #{style.app.border}"
        color: style.app.text
    header-style-light =
        border-bottom: "1px solid #{style.app.border-light}"
        color: style.app.text
    button-style=
        color: style.app.text
        border-right: "1px solid #{style.app.border}"
        border-left: "1px solid #{style.app.border}"
    filter-style=
        background: style.app.header
        font-weight: "600"
    btn-style=
        background: style.app.header
        border-right: "1px solid #{style.app.border}"
        font-weight: "600"
    menu-style=
        color: style.app.text
    border-b =
        border-bottom: "1px solid #{style.app.border}"
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    input-style=
        background: style.app.wallet
        border: "1px solid #{style.app.border}"
        color: style.app.text
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    button-primary1-style=
        border: "1px solid #{style.app.primary1}"
        color: style.app.text
        background: style.app.primary1
    lightText=
        color: style.app.addressText
    nothing-icon=
        filter: style.app.nothingIcon
    header-table-style=
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.wallet-light
    expand-collapse = ->
        store.history.filter-open = not store.history.filter-open
    react.create-element 'div', { className: 'normalheader history history944185242' }, children = 
        react.create-element 'div', { style: header-style-light, className: 'header' }, children = 
            if store.current.device is \mobile
                react.create-element 'button', { on-click: go-back, style: button-style, className: 'back' }, children = 
                    react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg-arrow' }
            react.create-element 'span', { className: 'head left h1' }, ' ' + lang.your-transactions
            react.create-element 'span', { on-click: expand-collapse, className: 'head right' }, children = 
                react.create-element 'img', { src: "#{icons.filter}", className: 'icon-svg1' }
            if store.history.filter-open
                react.create-element 'div', { style: filter-body, className: 'filter' }, children = 
                    react.create-element 'div', { style: border-b, className: 'top' }, children = 
                        react.create-element 'button', { style: btn-style, on-click: switch-type-in, className: "#{is-active('IN')} IN" }, children = 
                            react.create-element 'img', { src: "#{icons.get}", className: 'icon-svg' }
                            react.create-element 'br', {}
                            """#{lang.in}"""
                        react.create-element 'div', { style: btn-style }
                        react.create-element 'button', { style: btn-style, on-click: switch-type-out, className: "#{is-active('OUT')} OUT" }, children = 
                            react.create-element 'img', { src: "#{icons.send}", className: 'icon-svg' }
                            react.create-element 'br', {}
                            """#{lang.out}"""
                    react.create-element 'div', { style: border-b, className: 'middle' }, children = 
                        react.create-element 'div', {}, children = 
                            react.create-element 'input', { type: 'text', style: input-style, placeholder: "#{lang.from}" }
                        react.create-element 'div', {}, children = 
                            react.create-element 'input', { type: 'text', style: input-style, placeholder: "#{lang.to}" }
                        react.create-element 'button', { on-click: '', style: button-primary1-style }, children = 
                            react.create-element 'span', {}, children = 
                                react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-btn' }
                                """ #{lang.apply}"""
                    react.create-element 'div', { className: 'bottom' }, children = 
                        for coin in coins
                            react.create-element 'button', { key: "#{coin.token}", style: filter-style, on-click: switch-filter(coin.token), className: "#{is-active(coin.token)}" }, children = 
                                react.create-element 'img', { src: "#{coin.image}" }
        if no    
            if store.transactions.applied.length > 0
                react.create-element 'div', { style: header-table-style, className: 'header-table' }, children = 
                    react.create-element 'span', { style: lightText, className: 'cell network' }, ' ' + lang.network
                    react.create-element 'span', { style: lightText, className: 'cell txhash' }, ' ' + lang.trx-id
                    react.create-element 'span', { style: lightText, className: 'cell amount' }, ' ' + lang.trx-amount
        react.create-element 'div', {}, children = 
            react.create-element 'div', { className: 'table' }, children = 
                if store.transactions.applied.length > 0
                    store.transactions.applied |> map render-transaction store, web3t
            if store.transactions.applied.length is 0
                react.create-element 'div', { style: menu-style, className: 'nothin-to-show' }, children = 
                    react.create-element 'img', { style: nothing-icon, src: "#{icons.search-history}" }
                    react.create-element 'div', { className: 'head' }, ' ' + lang.nothing-to-show
                    react.create-element 'div', { className: 'content' }, ' ' + lang.make-tx