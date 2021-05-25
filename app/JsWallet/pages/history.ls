require! {
    \react
    \prelude-ls : { sort-by, reverse, filter, map, find, take, obj-to-pairs }
    \../history-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./loading.ls
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../icons.ls
    \../components/middle-ellipsis : MiddleEllipsis
    \../components/address-holder.ls
    \../round-number.ls
    \../components/popups/loading.ls
}
# .history95075167
#     @import scheme
#     width: 100%
#     position: relative
#     padding-bottom: 0px
#     display: inline-block
#     .filters
#         white-space: nowrap
#         height: 30px
#         overflow: auto
#         .filter-item
#             display: inline-block
#             background: #404167
#             color: white
#             padding: 5px 10px
#             text-align: center
#             font-size: 10px
#             margin: 0 5px 5px 0
#             cursor: pointer
#             .key
#                 font-weight: bold
#             .close-icon
#                 margin-left: 5px
#     .from-to
#         width: 40px
#         display: inline-block
#         line-height: 25px
#     .tooltip
#         position: absolute
#         text-transform: uppercase
#         left: 25px
#         top: -8px
#         z-index: 1
#         line-height: 14px
#         font-size: 9px
#         font-weight: 600
#         color: #fff
#         padding: 5px
#         background: #000
#         visibility: hidden
#         &:after, &:before
#             right: 100%
#             top: 21%
#             border: solid transparent
#             content: " "
#             height: 0
#             width: 0
#             position: absolute
#             pointer-events: none
#         &:after
#             border-color: rgba(136, 183, 213, 0)
#             border-right-color: #000
#             border-width: 6px
#             margin-top: 2px
#         &:before
#             border-color: rgba(194, 225, 245, 0)
#             border-width: 8px
#             margin-top: 0px
#     .icon-svg1
#         position: relative
#         border-radius: 0px
#         height: 15px
#         top: 2px
#         &.more
#             height: 8px
#             top: 0
#     .icon-svg-arrow
#         position: relative
#         height: 12px
#         top: 0px
#     .smart-contract
#         color: orange
#         position: relative
#         .help
#             cursor: help
#         &:hover
#             .tooltip
#                 visibility: visible
#     &.normalheader
#         @media(max-width: 800px)
#             margin: 60px 0 0
#     .sign
#         margin-right: 3px
#         margin-left: 5px
#         font-size: 15px !important
#         font-weight: 600
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
#             margin-bottom: 15px
#         .head
#             font-weight: 600
#             margin-bottom: 10px
#             font-size: 14px
#             opacity: .7
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
#                 text-align: left
#     .header, .header-table
#         text-align: left
#         box-sizing: border-box
#         width: 100%
#         .table-header
#             width: 100%
#             display: inline-flex
#             margin-top: 10px
#             span
#                 font-size: 12px
#                 opacity: .5
#                 padding: 10px 0
#                 line-height: 1.8
#                 &.from-to
#                     width: 50%
#                 &.created
#                     width: 12%
#                 &.amount
#                     width: 16%
#                 &.status
#                     width: 16%
#                 &.details
#                     width: 6%
#                     text-align: center
#         .head
#             display: inline-block
#             &.left
#                 padding: 0px 0 10px 0px
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
#             background: inherit
#             position: absolute
#             top: 59px
#             right: 0
#             display: inline-grid
#             z-index: 1
#             border-radius: $border
#             .bottom, .middle
#                 padding: 10px
#             .top
#                 padding: 0
#                 display: flex
#                 button
#                     width: 50% !important
#                     border: 0 !important
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
#                     border-left: 8px solid
#                     &.from
#                         border-color: #0349fb
#                     &.from
#                         border-color: #6cf8f9
#                 button
#                     outline: none
#                     cursor: pointer
#                     border: 0
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
#                 opacity: .25
#                 border-width: 3px
#                 &.active
#                     opacity: 1
#                 img
#                     height: 25px
#                     &.icon-svg
#                         height: 12px
#                         padding: 0 0 3px 0
#                         margin: 0
#                     &.icon-svg-btn
#                         height: 12px
#                         padding: 0px 5px 0 0px
#                 &.OUT
#                     border-radius: $border 0 0 0
#                     img
#                         filter: invert(105%)
#                     background: var(--primary2)
#                 &.IN
#                     border-radius: 0 $border 0 0
#                     img
#                         filter: invert(105%)
#                     background: var(--primary1)
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
#                 border-color: var(--primary2)
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
#             font-size: 14px
#             margin-left: 3px
#             color: gray
#             border-radius: $border
#             width: auto
#             letter-spacing: .5px
#             padding: 0px 3px 1px 0px
#             &.done
#                 background-image: var(--confirm)
#                 -webkit-text-fill-color: transparent
#                 -webkit-background-clip: text
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
#             opacity: .5
#     .table
#         width: 100%
#         overflow-y: scroll
#         margin-top: -1px
#         height: calc(100vh - 450px)
#         opacity: .8
#         .head, .record
#             &.record
#                 border-radius: 0px
#                 .tx-top
#                     cursor: default
#                     height: 59px
#                     position: relative
#                 .tx-middle
#                     height: 60px
#                     animation: appear .1s ease-in
#                 &:last-child
#                     margin-bottom: 0px
#             .cell
#                 padding: 10px 0
#                 display: inline-block
#                 vertical-align: top
#                 box-sizing: border-box
#                 text-align: left
#                 height: 59px
#                 white-space: nowrap
#                 overflow: hidden
#                 .action
#                     margin-top: 7px
#                     display: block
#                 &:first-child
#                     padding-right: 10px
#                 @media screen and (max-width: 800px)
#                     overflow-x: scroll
#                     overflow-y: hidden
#                 &.network
#                     width: 5%
#                     div
#                         text-align: center
#                 &.txhash
#                     width: 54%
#                     div:first-child
#                         display: inline
#                     .loader-ios
#                         margin-left: 10px
#                     a
#                         font-size: 14px
#                     img
#                         border-radius: inherit
#                         border: none
#                         margin-right: 0px
#                         margin-left: 5px
#                         height: 13px
#                         top: 3px
#                         left: 3px
#                         position: relative
#                 &.amount
#                     width: 16%
#                     text-align: left
#                     line-height: 40px
#                     @media screen and (max-width: 1020px)
#                         width: 16%
#                 &.status
#                     width: 16%
#                     text-align: left
#                     line-height: 40px
#                     @media screen and (max-width: 1020px)
#                         width: 16%
#                 &.divider2
#                     width: 38%
#                 &.divider
#                     width: 4%
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
#                     width: 12%
#                     text-align: left
#                     @media screen and (max-width: 1020px)
#                         width: 12%
#                     .syncing
#                         svg
#                             width: auto
#                             height: 14px
#                             margin: 0
#                             vertical-align: middle !important
#                     .bold
#                         margin-right: 0px
#                         .icon-check
#                             opacity: .8;
#                             vertical-align: inherit
#                             top: 1px
#                             margin-right: 2px
#                             position: relative
#                             width: 15px
#                             height: 13px !important
#                     .time-ago
#                         display: inline-block
#                         text-overflow: ellipsis
#                         overflow: hidden
#                         width: 100%
#                         font-size: 13px
#                         line-height: 22px
#                         text-decoration: none
#                         line-height: 1.1
#                         margin-top: 7px
#                         white-space: break-spaces
#                         vertical-align: -webkit-baseline-middle
#                 &.more
#                     text-align: center
#                     width: 6%
#                     line-height: 40px
#                     cursor: pointer
#                     &:hover
#                         .arrow_box
#                             display: block
#                     .arrow_box
#                         position: absolute
#                         text-transform: uppercase
#                         right: 6%
#                         top: 17px
#                         z-index: 1
#                         line-height: 14px
#                         font-size: 9px
#                         font-weight: 600
#                         color: #fff
#                         padding: 5px
#                         background: #210b4a
#                         display: none
#                         transition: opacity .5s
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
#                             border-left-color: #000
#                             border-width: 6px
#                             margin-top: 2px
#                         &:before
#                             border-color: rgba(194, 225, 245, 0)
#                             border-width: 8px
#                             margin-top: 0px
#                 &.details-from, &.details-to
#                     width: 45%
#                     text-align: left
#                     height: 60px
#                     div:last-child
#                         height: 36px
#                     .action
#                         .address-holder
#                             text-align: left
#                             height: 22px
#                             width: 85%
#                             .copy
#                                 margin-left: 0px
#                                 width: 13px
#                                 height: 15px
#                             >img
#                                 margin: 5px
#                                 &:first-child
#                                     top: 0px
#                                     margin: 0 10px 0 0
#                                     height: 25px
#                                     border-radius: var(--border-btn)
#                             .browse
#                                 right: 0px
#                                 padding: 0
#                             >span a
#                                 height: 25px
#                                 line-height: 25px
#                             span
#                                 padding: 0
#                                 width: 80%
#                                 text-align: left
#                                 @media screen and (min-width: 1921px)
#                                     width: 340px
#                                 @media screen and (min-width: 1441px) and (max-width: 1920px)
#                                     width: 100%
#                                 a
#                                     img
#                                         height: 16px
#                                 div
#                                     width: 90%
#                                     margin-right: 0px
#                                     a
#                                         padding: 0
#                                         min-width: 250px
#                                         text-align: left
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
#                     margin-right: 13px
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
#                 .direction
#                     img
#                         filter: invert(105%)
#                         vertical-align: bottom
#                     color: #0037c1
#                     &.label-icon
#                         width: 25px
#                         height: 25px
#                         background: var(--primary2)
#                         border-radius: var(--border-btn)
#                         text-align: center
#                         margin-top: 7px
#                 .txhash a
#                     color: #0037c1
#             &.IN
#                 .direction
#                     img
#                         filter: invert(105%)
#                         vertical-align: bottom
#                     color: #0bffb7
#                     &.label-icon
#                         width: 25px
#                         height: 25px
#                         background: var(--primary1)
#                         border-radius: var(--border-btn)
#                         text-align: center
#                         margin-top: 7px
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
#             margin: 0
#             margin-top: 5px
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
#seen-txs = {}
render-transaction = (store, web3t, tran)-->
    { transaction-info, coins, checked, arrow, arrow-lg, sign, delete-pending-tx, amount-beautify, ago } = history-funcs store, web3t
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
        color: style.app.color3
    icon1=
        filter: style.app.icon1
    tooltip=
        background: "black"
    { token, tx, amount, fee, time, url, type, pending, from, to, recipient-type, description } = tran
    console.log "tran" tran.action if token is \vlx_native3
    coin =
        coins |> find (.token is token)
    return null if not coin?
    network = coin[store.current.network]
    request = { network, tx }
    tx-details = ->
        store.history.tx-details =
            | store.history.tx-details is "#{tx}#{type}" => null
            | _ => "#{tx}#{type}"
    icon-pending=
        filter: if pending is yes then 'grayscale(100%) brightness(40%) sepia(100%) hue-rotate(-370deg) saturate(790%) contrast(0.5)' else style.app.icon-filter
    amount-pending=
        color: if pending is yes then 'orange' else ''
    about =
        | recipient-type is \contract => 'Smart'
        | description is \internal => 'Smart'
        | description is \external => 'User'
        | _ => 'Unknown'
    about-icon =
        | recipient-type is \contract => \ "#{icons.smart}"
        | description is \internal => \ "#{icons.smart}"
        | description is \external => \ "#{icons.user}"
        | _ => \ "#{icons.unknown}"
    wallet-from =
        address: from
        network: network
        coin: coin
    wallet-to =
        address: to
        network: network
        coin: coin
    cut-hash = (tx)->
        return \none if not tx?
        t = tx.to-string!
        r = t.substr(0, 15) + \.. + t.substr(t.length - 15, 15)
    time-ago =
        | time => ago time
        | _ => ""
    wallet = store.current.account.wallets[store.current.walletIndex]
    rounded-fee = round-number fee, {decimals: wallet.network.decimals}
    react.create-element 'div', { key: "#{tx + type}", style: border-style, datatesting: "transaction", className: "#{type} record" }, children = 
        react.create-element 'div', { style: line-style, className: 'tx-top' }, children = 
            react.create-element 'div', { className: 'cell text-center network' }, children = 
                react.create-element 'div', { className: 'direction label-icon' }, children = 
                    react.create-element 'img', { src: "#{arrow-lg(type)}", className: 'icon-svg' }
            if type is \IN
                react.create-element 'div', { className: 'cell details-from' }, children = 
                    react.create-element 'div', { style: lightText, className: 'gray' }, children = 
                        react.create-element 'span', { className: 'action' }, children = 
                            if tran.tx-type? then
                                address-holder { store, wallet: wallet-from, text: tran.tx-type  }
                            else
                                address-holder { store, wallet: wallet-from }
                        if no
                            react.create-element 'span', { className: 'from-to' }, children = 
                                react.create-element 'span', { className: 'smart-contract' }, children = 
                                    react.create-element 'div', { className: 'tooltip' }, ' ' + about
                                    react.create-element 'img', { src: "#{about-icon}", className: 'help' }
                                react.create-element 'span', {}, ' ' + lang.from
            else
                react.create-element 'div', { className: 'cell details-to' }, children = 
                    react.create-element 'div', { style: lightText, className: 'gray' }, children = 
                        react.create-element 'span', { className: 'action' }, children = 
                            if tran.tx-type? then
                                address-holder { store, wallet: wallet-to, text: tran.tx-type  }
                            else
                                address-holder { store, wallet: wallet-to }
                        if no
                            react.create-element 'span', { className: 'from-to' }, children = 
                                react.create-element 'span', { className: 'smart-contract' }, children = 
                                    react.create-element 'div', { className: 'tooltip' }, ' ' + about
                                    react.create-element 'img', { src: "#{about-icon}", className: 'help' }
                                react.create-element 'span', {}, ' ' + lang.to
            react.create-element 'div', { className: 'cell created' }, children = 
                react.create-element 'div', { className: 'time-ago' }, ' ' + time-ago
            react.create-element 'div', { style: menu-style, className: 'cell amount' }, children = 
                react.create-element 'div', { title: "#{amount}", style: amount-pending }, children = 
                    react.create-element 'span', { className: 'sign direction' }, ' ' + sign(type)
                    amount-beautify amount, 8
            react.create-element 'div', { style: menu-style, className: 'cell status' }, children = 
                if pending is yes
                    react.create-element 'span', {}, children = 
                        react.create-element 'span', { className: 'bold confirmed' }, ' ' + lang.created
                        react.create-element 'span', { className: 'bold' }, children = 
                            loader store, web3t
                else
                    react.create-element 'span', {}, children = 
                        react.create-element 'span', { className: 'bold confirmed done' }, ' ' + lang.confirmed
            react.create-element 'div', { on-click: tx-details, className: 'cell divider more' }, children = 
                react.create-element 'img', { src: "#{icons.arrow-down}", style: icon1, className: 'icon-svg1 more' }
                react.create-element 'div', { style: tooltip, className: 'arrow_box' }, ' ' + lang.details
        if store.history.tx-details is "#{tx}#{type}"
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
                        react.create-element 'span', {}, ' ' + lang.created + ':'
                            """ #{time-ago}"""
                        if pending is yes
                            react.create-element 'span', {}, children = 
                                react.create-element 'span', { className: 'bold' }, ' ' + lang.created
                        else
                            react.create-element 'span', { className: 'bold confirmed done' }, ' ' + lang.confirmed
                        react.create-element 'span', { className: 'smart-contract' }, children = 
                            react.create-element 'div', { className: 'tooltip' }, ' ' + about
                            react.create-element 'img', { src: "#{about-icon}", className: 'help' }
                react.create-element 'div', { className: 'cell divider' }
                react.create-element 'div', { className: 'cell divider2' }, children = 
                    react.create-element 'div', { style: lightText, className: 'gray' }, children = 
                        react.create-element 'span', { className: 'fee' }, ' ' + lang.fee + ':              '
                        react.create-element 'div', { className: 'balance' }, children = 
                            react.create-element 'span', { className: 'color' }, ' ' + rounded-fee
module.exports = ({ store, web3t })->
    { go-back, switch-type-in, switch-type-out, switch-sender, switch-receiver, remove-type-from-filter, remove-filter-raram, coins, is-active, switch-filter } = history-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    header-style =
        border-bottom: "1px solid #{style.app.border}"
        color: style.app.text
    icon2=
        filter: style.app.icon2
    header-style-light =
        color: style.app.text
    button-style=
        color: style.app.text
        border-right: "1px solid #{style.app.border}"
        border-left: "1px solid #{style.app.border}"
    filter-style=
        background: style.app.header
        font-weight: "600"
    split=
        border: "1px solid #{style.app.border}"
    menu-style=
        color: style.app.text
    border-b =
        border-bottom: "1px solid #{style.app.border}"
    border-t =
        border-top: "1px solid #{style.app.border}"
        position: "relative"
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.account-bg
    input-style=
        background: style.app.bg-primary-light
        border: "1px solid #{style.app.border}"
        color: style.app.text
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    button-primary1-style=
        border: "0"
        color: style.app.text
        background: style.app.primary1
        background-color: style.app.primary1-spare
    lightText=
        color: style.app.color3
    nothing-icon=
        filter: style.app.nothingIcon
    header-table-style=
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.wallet-light
    icon-filter=
        filter: style.app.icon-filter
    expand-collapse = ->
        store.history.filter-open = not store.history.filter-open
    length = store.transactions.applied.length
    rowRenderer = ({ key, index, isScrolling, isVisible, style })->
        return render-transaction store, web3t, store.transactions.applied[index] # if isVisible
        null
    build-types = (item)->
        remove-type = remove-type-from-filter(item)
        react.create-element 'span', { on-click: remove-type, className: 'filter-item' }, children = 
            react.create-element 'span', { className: 'key' }, ' ' + item
            react.create-element 'span', { className: 'close-icon' }, children = 
                icon \X, 10
    build-filter-items = (item)->
        key = item.0
        value = item.1
        return null if not value?
        return null if key is \token
        $key = (item.0 ? "").to-upper-case!
        obj = {}
        obj["#{key}"] = value
        react.create-element 'span', { on-click: remove-filter-raram(obj), className: 'filter-item' }, children = 
            react.create-element 'span', {}, children = 
                react.create-element 'span', { className: 'key' }, ' ' + $key + ':'
                react.create-element 'span', { className: 'value' }, ' ' + value
                react.create-element 'span', { className: 'close-icon' }, children = 
                    icon \X, 10
    history-width = store.current.size.width / 1.9
    history-height = store.current.size.height - 200 - 60
    on-sender-filter = (e) ->
        e.target.value = (e.target.value ? "").trim!
        switch-sender(e.target.value)    
    on-receiver-filter = (e) ->
        e.target.value = (e.target.value ? "").trim!
        switch-receiver(e.target.value)
    send-from = (store.current.filter.from ? "")
    send-to = (store.current.filter.to ? "")
    react.create-element 'div', { className: 'normalheader history history1064831901' }, children = 
        react.create-element 'div', { style: header-style-light, className: 'header' }, children = 
            if store.current.device is \mobile
                react.create-element 'button', { on-click: go-back, style: button-style, className: 'back' }, children = 
                    react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg-arrow' }
            react.create-element 'span', { className: 'head left h1' }, ' ' + lang.your-transactions
            react.create-element 'span', { on-click: expand-collapse, className: 'head right' }, children = 
                react.create-element 'img', { src: "#{icons.filter}", style: icon2, className: 'icon-svg1' }
            react.create-element 'div', { className: 'filters' }, children = 
                react.create-element 'div', { className: 'filter__types' }, children = 
                    store.current.filter-txs-types |> map build-types      
                    store.current.filter
                        |> obj-to-pairs 
                        |> map build-filter-items
            react.create-element 'div', { className: 'table-header' }, children = 
                react.create-element 'span', { className: 'from-to' }, children = 
                    """ #{lang.from}"""
                    """ /"""
                    """ #{lang.to}"""
                react.create-element 'span', { className: 'created' }, ' ' + lang.created
                react.create-element 'span', { className: 'amount' }, ' ' + lang.amount
                react.create-element 'span', { className: 'status' }, ' ' + lang.status
                react.create-element 'span', { className: 'details' }, ' ' + lang.details
            if store.history.filter-open
                react.create-element 'div', { style: filter-body, className: 'filter' }, children = 
                    react.create-element 'div', { style: border-b, className: 'top' }, children = 
                        react.create-element 'button', { on-click: switch-type-out, className: "#{is-active('OUT')} OUT" }, children = 
                            react.create-element 'img', { src: "#{icons.send}", className: 'icon-svg' }
                        react.create-element 'div', { style: split }
                        react.create-element 'button', { on-click: switch-type-in, className: "#{is-active('IN')} IN" }, children = 
                            react.create-element 'img', { src: "#{icons.get}", className: 'icon-svg' }
                    react.create-element 'div', { style: border-b, className: 'middle' }, children = 
                        react.create-element 'div', {}, children = 
                            react.create-element 'input', { type: 'text', value: "#{send-from}", on-change: on-sender-filter, style: input-style, placeholder: "#{lang.from}", className: 'from' }
                        react.create-element 'div', {}, children = 
                            react.create-element 'input', { type: 'text', value: "#{send-to}", on-change: on-receiver-filter, style: input-style, placeholder: "#{lang.to}", className: 'to' }
                        if no
                            react.create-element 'button', { on-click: filter-txs, style: button-primary1-style }, children = 
                                react.create-element 'span', {}, children = 
                                    react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-btn' }
                                    """ #{lang.btn-apply}"""
                    if no
                        react.create-element 'div', { className: 'bottom' }, children = 
                            for coin in coins
                                react.create-element 'button', { key: "#{coin.token}", style: filter-style, on-click: switch-filter(coin.token), className: "#{is-active(coin.token)}" }, children = 
                                    react.create-element 'img', { src: "#{coin.image}" }
        react.create-element 'div', {}, children = 
            react.create-element 'div', {}, children = 
                loading { store }
            react.create-element 'div', { style: border-t, className: 'table' }, children = 
                store.transactions.applied 
                    |> take 30 
                    |> map render-transaction store, web3t
            if length is 0 and store.current.transactions-are-loading isnt yes
                react.create-element 'div', { style: menu-style, className: 'nothin-to-show' }, children = 
                    react.create-element 'img', { style: nothing-icon, src: "#{icons.search-history}" }
                    react.create-element 'div', { className: 'head' }, ' ' + lang.nothing-to-show