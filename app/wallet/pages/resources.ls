require! {
    \react
    \react-dom
    \../navigate.ls
    \../get-primary-info.ls
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../address-link.ls : { get-address-link, get-address-title }
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \./switch-account.ls
    \../icons.ls
    \./epoch.ls
    \./alert-demo.ls
}
# .resources-1831468487
#     @import scheme
#     position: relative
#     display: block
#     width: auto
#     margin-left: 60px
#     top: 0
#     height: auto
#     min-height: 100vh
#     padding-top: 5%
#     box-sizing: border-box
#     padding: 0px
#     background: transparent
#     @media(max-width:800px)
#         width: 100%
#         margin: 0
#     .container-price
#         text-align: center
#         padding: 40px 0
#     .plan
#         display: inline-block
#         margin: 10px 1%
#         vertical-align: text-top
#     .plan-inner
#         border: 1px solid rgb(107, 38, 142);
#         background: rgb(51, 20, 99);
#         margin: 0 auto
#         min-width: 340px
#         max-width: 100%
#         position: relative
#     .entry-title
#         position: relative
#         text-align: center
#         padding-bottom: 15px
#         >.wallet-middle
#             display: none
#             $card-top-height: 50px
#             width: 100%
#             padding: 0 12px
#             box-sizing: border-box
#             color: #A8BACB
#             font-size: 14px
#             text-align: center
#             position: relative
#             >img
#                 position: absolute
#                 right: 3%
#                 margin: 10px
#                 margin-left: 50px
#                 z-index: 2
#             >a
#                 width: 100%
#                 z-index: 1
#                 position: relative
#                 border-radius: $border
#                 border: 0
#                 background: #E6F0FF
#                 box-sizing: border-box
#                 vertical-align: top
#                 text-align: center
#                 padding-left: 20px
#                 padding-right: 25px
#                 height: $card-top-height - 14px
#                 color: #677897
#                 font-size: 12px
#                 line-height: $card-top-height - 14px
#                 display: inline-block
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 @media screen and (max-width: 390px)
#                     padding-right: 35px
#         .top
#             display: inline-block
#         > h3
#             background: #4b2788
#             font-size: 20px
#             padding: 5px 0
#             text-transform: uppercase
#             font-weight: 600
#             margin: 0
#             &:first-letter
#                 color: orange
#         .price
#             width: 100%
#             margin: 20px auto
#             background-repeat: no-repeat !important
#             background-size: contain !important
#             height: 100px
#             background-position: center !important
#             img
#                 width: 100px
#     .price span
#         height: 100px
#         width: 100px
#         display: inline-block
#         margin: 20px auto
#     .price-month
#         width: 100%
#         .per-price
#             color: #6f6fe2
#             font-size: 16px
#     .entry-content
#         padding: 20px 12px
#         color: #323232
#         block-li 
#             border-bottom: 1px solid #fff
#         ul
#             margin: 0
#             padding: 0
#             list-style: none
#             text-align: center
#         li
#             border-bottom: 1px solid #5c3f89
#             padding: 10px 0
#             color: #fff
#             &:last-child
#                 border: none
#     button
#         background-color: $primary
#         border: 1px solid $primary
#         border-radius: $border
#         color: white
#         height: 36px
#         width: 100%
#         margin-top: 5px
#         padding: 0 6px
#         text-decoration: none
#         text-transform: uppercase
#         font-size: 10px
#         font-weight: bold
#         cursor: pointer
#         outline: none
#         display: block
#         text-overflow: ellipsis
#         overflow: hidden
#         white-space: nowrap
#         &:hover
#             background: transparent
#             color: $primary
#         &.link
#             min-width: 190px
#         float: center
#         margin-top: 20px
#     >.title
#         position: sticky
#         position: -webkit-sticky
#         z-index: 1
#         background: linear-gradient(100deg, #331462 4%, #15063c 100%)
#         box-sizing: border-box
#         top: 0
#         width: 100%
#         color: gray
#         font-size: 22px
#         padding: 10px
#         height: 60px
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
#     .wrapper-task
#         margin: 0 auto
#         padding: 0 40px
#         max-width: 1080px
#     .table-task
#         margin: 20px 0 40px 0
#         width: 100%
#         display: table
#         @media screen and (max-width: 800px)
#             display: table
#     .table-deposit
#         margin: 20px 0 40px 0
#         width: 100%
#         display: table
#         border: 1px solid #6b268e;
#         background: #331463;
#         @media screen and (max-width: 800px)
#             display: block
#     .row-deposit
#         &:nth-of-type(odd)
#             background: transparent !important
#         .content-deposit
#             margin: 40px 40px 0
#             span
#                 color: #6f6fe2
#                 cursor: pointer
#                 &:hover
#                     text-decoration: underline
#         .wallet-middle
#             $card-top-height: 50px
#             margin: 20px auto 50px
#             width: 100%
#             max-width: 400px
#             padding: 0 12px
#             box-sizing: border-box
#             color: #A8BACB
#             font-size: 14px
#             margin-top: 10px
#             text-align: center
#             position: relative
#             >img
#                 position: absolute
#                 top: 20px
#                 right: 10px
#                 margin: 10px
#                 margin-left: 50px
#                 z-index: 2
#                 &.icon-svg
#                     position: relative
#                     height: 12px
#                     top: 2px
#                     padding-right: 5px
#             >a
#                 width: 100%
#                 z-index: 1
#                 position: relative
#                 border-radius: $border
#                 border: 0
#                 background: #E6F0FF
#                 margin-top: 20px
#                 box-sizing: border-box
#                 vertical-align: top
#                 text-align: center
#                 padding-left: 20px
#                 padding-right: 25px
#                 height: $card-top-height - 14px
#                 color: #677897
#                 font-size: 15px
#                 line-height: $card-top-height - 14px
#                 display: inline-block
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 @media screen and (max-width: 390px)
#                     padding-right: 35px
#     .row-task, .row-deposit
#         display: table-row
#         color: #fff
#         background: rgba(98, 52, 171, 0.4)
#         @media screen and (max-width: 580px)
#             display: block
#         &:nth-of-type(odd)
#             background: #4b278769
#         &.header
#             text-transform: uppercase
#             color: #ffffff
#             background: #4b2788
#             .cell-task
#                 @media screen and (max-width: 580px)
#                     display: none
#         @media screen and (max-width: 800px)
#             padding: 14px 0 7px
#             &.header
#                 padding: 0
#             .cell-task
#                 margin-bottom: 10px
#                 &:before
#             margin-bottom: 3px
#             content: attr(data-title)
#             min-width: 98px
#     .cell-task
#         padding: 10px 12px
#         display: table-cell
#         @media screen and (max-width: 580px)
#             padding: 2px 16px
#             display: block
#     .cell-deposit
#         padding: 10px 12px
#         display: table-cell
#         @media screen and (max-width: 580px)
#             padding: 2px 16px
#             display: block
resources = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    goto-search = ->
        navigate store, web3t, \search
    info = get-primary-info store
    action = ->
        store.current.active = not store.current.active
    active =
        if store.current.active then \active else \ ""
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.background
    resource =
        color: info.app.text
        border: "1px solid #{info.app.border}"
        background: info.app.header
    resource-header =
        color: info.app.text
        background: info.app.demo
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    button-primary2-style=
        border: "1px solid #{info.app.primary2}"
        color: info.app.text
        background: info.app.primary2
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    filter-icon=
        filter: info.app.filterIcon
    address-input=
        color: info.app.addressText
        background: info.app.addressBg
    lightText=
        color: info.app.addressText
    expand-collapse = ->
        store.filestore.menu-open = not store.filestore.menu-open
    bg-cpu=
        background: "url('#{icons.bg-cpu}')"
    bg-gpu=
        background: "url('#{icons.bg-gpu}')"
    bg-spacing=
        background: "url('#{icons.bg-spacing}')"
    th=
        background: info.app.th
    tr-odd=
        background: info.app.tr-odd
    tr-even=
        background: info.app.tr-even
    show-class =
        if store.current.open-menu then \hide else \ ""
    react.create-element 'div', { className: 'resources resources-1831468487' }, children = 
        alert-demo store, web3t
        react.create-element 'div', { style: border-style, className: 'title' }, children = 
            react.create-element 'div', { className: "#{show-class} header" }, ' Resources Center'
            react.create-element 'div', { on-click: goto-search, className: 'close' }, children = 
                react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg' }
            epoch store, web3t
            switch-account store, web3t
        react.create-element 'div', { className: 'container-price' }, children = 
            react.create-element 'div', { className: 'plan' }, children = 
                react.create-element 'div', { style: resource, className: 'plan-inner' }, children = 
                    react.create-element 'div', { className: 'entry-title cpu' }, children = 
                        react.create-element 'h3', { style: resource-header }, ' CPU'
                        react.create-element 'div', { className: 'top' }, children = 
                            react.create-element 'div', { style: bg-cpu, className: 'price' }
                            react.create-element 'div', { className: 'price-month' }, children = 
                                """ 300 VLX """
                                react.create-element 'span', { className: 'per-price' }, children = 
                                    """ / PER MONTH"""
                        react.create-element 'div', { className: 'entry-content' }, children = 
                            react.create-element 'ul', {}, children = 
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """  for mining"""
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """  for distributed calculations"""
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """   for remote serverside"""
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """   for VFR, etc"""
                        react.create-element 'div', { className: 'wallet-middle' }, children = 
                            react.create-element 'a', { placeholder: "VLX6JfKoyrbErHzBWUyM3cyA9kRaMVL2x3n", style: address-input }, ' VLX6JfKoyrbErHzBWUyM3cyA9kRaMVL2x3n'
                            react.create-element CopyToClipboard, { text: "VLX6JfKoyrbErHzBWUyM3cyA9kRaMVL2x3n", on-copy: copied-inform(store), style: filter-icon }, children = 
                                copy store
                            react.create-element 'button', { style: button-primary2-style }, ' Deposit'
            react.create-element 'div', { className: 'plan' }, children = 
                react.create-element 'div', { style: resource, className: 'plan-inner' }, children = 
                    react.create-element 'div', { className: 'entry-title gpu' }, children = 
                        react.create-element 'h3', { style: resource-header }, ' GPU'
                        react.create-element 'div', { className: 'top' }, children = 
                            react.create-element 'div', { style: bg-gpu, className: 'price' }
                            react.create-element 'div', { className: 'price-month' }, children = 
                                """ 400 VLX """
                                react.create-element 'span', { className: 'per-price' }, children = 
                                    """ / PER MONTH"""
                        react.create-element 'div', { className: 'entry-content' }, children = 
                            react.create-element 'ul', {}, children = 
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """  for mining"""
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """  for rendering of video"""
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """  for distributed calculations"""
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """  for science"""
                        react.create-element 'div', { className: 'wallet-middle' }, children = 
                            react.create-element 'a', { placeholder: "VLX7SxUoyrbErHzBWUyM3cyA9kRaMVL2x6n", style: address-input }, ' VLX7SxUoyrbErHzBWUyM3cyA9kRaMVL2x6n'
                            react.create-element CopyToClipboard, { text: "VLX7SxUoyrbErHzBWUyM3cyA9kRaMVL2x6n", on-copy: copied-inform(store), style: filter-icon }, children = 
                                copy store
                            react.create-element 'button', { style: button-primary2-style }, ' Deposit'
            react.create-element 'div', { className: 'plan' }, children = 
                react.create-element 'div', { style: resource, className: 'plan-inner' }, children = 
                    react.create-element 'div', { className: 'entry-title spcng' }, children = 
                        react.create-element 'h3', { style: resource-header }, ' STORAGE'
                        react.create-element 'div', { className: 'top' }, children = 
                            react.create-element 'div', { style: bg-spacing, className: 'price' }
                            react.create-element 'div', { className: 'price-month' }, children = 
                                """ 500 VLX"""
                                react.create-element 'span', { className: 'per-price' }, children = 
                                    """ / PER MONTH"""
                        react.create-element 'div', { className: 'entry-content' }, children = 
                            react.create-element 'ul', {}, children = 
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """  for file sharing"""
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """  for file storage"""
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """  for distributed AI"""
                                react.create-element 'li', {}, children = 
                                    react.create-element 'strong', {}
                                    """  for DAPPS"""
                        react.create-element 'div', { className: 'wallet-middle' }, children = 
                            react.create-element 'a', { placeholder: "VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n", style: address-input }, ' VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n'
                            react.create-element CopyToClipboard, { text: "VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n", on-copy: copied-inform(store), style: filter-icon }, children = 
                                copy store
                            react.create-element 'button', { style: button-primary2-style }, ' Deposit'
        react.create-element 'div', { className: 'wrapper-task' }, children = 
            react.create-element 'div', { className: 'title' }, children = 
                react.create-element 'div', { className: 'header' }, ' Deposit'
            react.create-element 'div', { style: resource, className: 'table-deposit' }, children = 
                react.create-element 'div', { className: 'row-deposit' }, children = 
                    react.create-element 'div', { className: 'content-deposit' }, children = 
                        """ Please deposit VLX on this address to buy all these 3 resources. Once you use RESOURCES via"""
                        react.create-element 'span', {}, ' [StorageDapp] '
                        """ or """
                        react.create-element 'span', {}, ' [API] '
                        """ one of them or all together nodes will send invoices automatically. Please use the private key of that account you deposit to pass authorization in network"""
                    react.create-element 'div', { className: 'wallet-middle' }, children = 
                        react.create-element 'a', { placeholder: "VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n", style: address-input }, ' VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n'
                        react.create-element CopyToClipboard, { text: "VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n", on-copy: copied-inform(store), style: filter-icon }, children = 
                            copy store
                        react.create-element 'button', { style: button-primary2-style }, children = 
                            react.create-element 'span', {}, children = 
                                react.create-element 'img', { src: "#{icons.deposit}", className: 'icon-svg' }
                                """ Deposit"""
        react.create-element 'div', { className: 'wrapper-task' }, children = 
            react.create-element 'div', { className: 'title' }, children = 
                react.create-element 'div', { className: 'header' }, ' Invoices'
            react.create-element 'div', { className: 'table-task' }, children = 
                react.create-element 'div', { style: th, className: 'row-task header' }, children = 
                    react.create-element 'div', { className: 'cell-task' }, ' Task Name'
                    react.create-element 'div', { className: 'cell-task' }, ' Task Status'
                    react.create-element 'div', { className: 'cell-task' }, ' Date Finished'
                    react.create-element 'div', { className: 'cell-task' }, ' Budget Spent'
                react.create-element 'div', { style: tr-odd, className: 'row-task' }, children = 
                    react.create-element 'div', { data-title: 'Task Name', className: 'cell-task' }, children = 
                        """ CPU Usage"""
                    react.create-element 'div', { data-title: 'Task Status', className: 'cell-task' }, children = 
                        """ Finished"""
                    react.create-element 'div', { data-title: 'Date Finished', className: 'cell-task' }, children = 
                        """ 2020/03/24"""
                    react.create-element 'div', { data-title: 'Budget Spent', className: 'cell-task' }, children = 
                        """ 200 VLX"""
                react.create-element 'div', { style: tr-even, className: 'row-task' }, children = 
                    react.create-element 'div', { data-title: 'Task Name', className: 'cell-task' }, children = 
                        """ GPU Usage"""
                    react.create-element 'div', { data-title: 'Task Status', className: 'cell-task' }, children = 
                        """ in Progress"""
                    react.create-element 'div', { data-title: 'Date Finished', className: 'cell-task' }, children = 
                        """ 2020/03/24"""
                    react.create-element 'div', { data-title: 'Budget Spent', className: 'cell-task' }, children = 
                        """ 400 VLX"""
                react.create-element 'div', { style: tr-odd, className: 'row-task' }, children = 
                    react.create-element 'div', { data-title: 'Task Name', className: 'cell-task' }, children = 
                        """ Disk Write"""
                    react.create-element 'div', { data-title: 'Task Status', className: 'cell-task' }, children = 
                        """ in Progress"""
                    react.create-element 'div', { data-title: 'Date Finished', className: 'cell-task' }, children = 
                        """ 2020/03/24"""
                    react.create-element 'div', { data-title: 'Budget Spent', className: 'cell-task' }, children = 
                        """ 500 VLX"""
                react.create-element 'div', { style: tr-even, className: 'row-task' }, children = 
                    react.create-element 'div', { data-title: 'Task Name', className: 'cell-task' }, children = 
                        """ Disk Keep"""
                    react.create-element 'div', { data-title: 'Task Status', className: 'cell-task' }, children = 
                        """ in Progress"""
                    react.create-element 'div', { data-title: 'Date Finished', className: 'cell-task' }, children = 
                        """ 2020/03/24"""
                    react.create-element 'div', { data-title: 'Budget Spent', className: 'cell-task' }, children = 
                        """ 600 VLX"""
module.exports = resources