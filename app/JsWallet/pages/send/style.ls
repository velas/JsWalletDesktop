.content.send-page
#     @import scheme
#     position: relative
#     $border-radius: var(--border-btn)
#     $label-padding: 3px
#     $label-font: 13px
#     width: calc(100% - 0px) !important
#     margin-left: 0px !important
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
#         background: var(--background)
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
#         width: 100%
#         box-sizing: border-box
#         border-radius: $border-radius
#     .more-buttons
#         top: 30px
#         right: 0
#         width: 150px
#         box-shadow: 0px 0px 2px black
#         border-radius: var(--border-btn)
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
#                 border-radius: 0 0 var(--border-btn) var(--border-btn)
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
#             margin: auto 10px
#             >.form-group
#                 &.sender, &.receiver
#                     input 
#                         padding: 0px 10px 0 40px  
#                 .identicon
#                     ~ span
#                         background: var(--input)
#                 &.send-amount
#                     overflow: hidden
#                 &:nth-child(2), &:nth-child(3)
#                     div
#                         position: relative
#                         img
#                             position: absolute
#                             right: auto
#                             left: 4px
#                             top: 3px
#                             height: 30px
#                             border-radius: var(--border-btn)
#                             margin: 0px
#                         input
#                             text-align: center
#                 .control-label
#                     padding-top: 5px
#                     padding-left: $label-padding
#                     font-size: $label-font
#                 &.network
#                     div
#                         position: relative
#                     .button
#                         width: 12px
#                         height: 16px
#                         display: inline-block
#                         padding: 9px
#                         border-radius: var(--border-btn)
#                         cursor: pointer
#                         vertical-align: top
#                         position: absolute
#                         &.left
#                             left: 0
#                         &.right
#                             right: 0
#                         svg
#                             vertical-align: inherit !important
#                 margin-top: 4px
#                 .address
#                     padding: 0px
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
#                         border-radius: var(--border-btn) 0 0 var(--border-btn)
#                         &.choose-currency
#                             display: inline-flex
#                             width: 45% !important
#                         .input-area
#                             margin: 0
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
#                             border-radius: 0 var(--border-btn) var(--border-btn) 0
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
#                             &:disabled
#                                 opacity:.2
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
#                                 border-radius: 0 $border-radius $border-radius 0
#                                 padding-left: 20px
#         .smart-contract
#             overflow: hidden
#             padding: 2px
#             box-sizing: border-box
#         >.header
#             padding: 10px
#             min-height: 40px
#             text-align: left
#             padding: 0
#             margin: 0 10px
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
#                     text-align: center
#                 &.right
#                     width: 10%
#                     text-align: right
#                     cursor: pointer
#                     >*
#                         vertical-align: middle
#             img
#                 width: 34px
#                 border-radius: 0px
#         .field
#             font-size: 12px
#             padding-left: 3px
#             color: gray
#             margin-top: 5px
#             &.type
#                 font-size: 14px
#                 color: #fff
#                 text-transform: capitalize
#             &.coin
#                 font-size: 14px
#                 color: #fff
#         .usd
#             font-size: 11px
#             padding-left: 3px
#             color: gray
#             margin-top: 5px
#             .switch-currency
#                 float: right
#                 &.active
#                     background: var(--primary3)
#                 &:last-child
#                     margin-right: 2px
#             .label-coin
#                 left: 3px
#                 top: 3px
#                 padding: 0 2px 0 2px
#                 height: 13px
#                 position: relative
#         .balance
#             color: #5E72E4
#         .send-all
#             background: transparent
#             outline: none
#             border: 0
#             border-radius: $border
#             font-size: 12px
#             line-height: 16px
#             text-align: center
#             padding: 2px 5px
#             cursor: pointer
#         .not-enough
#             color: white
#             background: rgba(#e06565 , 82%)
#             padding: 5px
#             font-size: 12px
#             max-height: 20px
#             font-weight: 400
#             overflow: hidden
#             min-height: 0
#             margin: 10px auto 0
#             height: auto
#             transition: transform .3s
#             transform: translateY(200px)
#             display: table
#             &.visible
#                 transform: translateY(0px)
#         .bold
#             font-weight: bold
#         .button-container
#             text-align: center
#             .buttons
#                 margin-top: 20px
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