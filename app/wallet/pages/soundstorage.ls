require! {
    \react
    \react-dom
    \superagent : { get }
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \./switch-account.ls
    \./epoch.ls
    \../icons.ls
}
# .videostorage1006399051
#     @import scheme
#     $border-radius: $border
#     $smooth: opacity .15s ease-in-out
#     position: relative
#     display: block
#     width: auto
#     overflow: hidden
#     margin-left: 60px
#     top: 0
#     height: 100%
#     min-height: 100vh
#     padding-top: 5%
#     box-sizing: border-box
#     padding: 0px
#     background: transparent
#     .play-bar
#         background: #321463
#         border-top: 1px solid #6b258e
#         height: 60px
#         width: 100%
#         position: fixed
#         bottom: 0px
#         padding: 0 20px
#         display: flex
#         z-index: 3
#         box-sizing: border-box
#         text-align: left
#         ul
#             display: inline-flex
#             list-style: none
#             padding: 0
#             margin-top: 15px
#             margin-bottom: 0
#             &.btn-area
#                 float: left
#                 width: 15%
#                 li
#                     margin-right: 25px 
#             &.play-area
#                 width: 40%
#                 padding: 0 20px
#                 li
#                     &.start
#                         color: orange
#                     .progress
#                         border-bottom: 1px solid #5d4588
#                         display: block
#                         width: 300px
#                         padding-top: 15px
#                         position: relative
#                         .progress
#                             padding: 0
#                             margin: 0
#                             width: 110px
#                             border-bottom: 1px solid orange
#                             box-sizing: border-box
#                             margin-top: -1px
#                             position: absolute
#                             bottom: -1px
#             &.album-area
#                 float: right
#                 text-align: right
#                 width: 45%
#                 margin-left: 0
#                 .album
#                     display: flex
#                     text-align: left
#                     img
#                         width: 30px
#                         height: 30px
#                         margin-right: 10px
#                     span
#                         .user
#                             line-height: 15px
#                             opacity: .5
#                             &:hover
#                                 opacity: 1
#                         .singer
#                             line-height: 15px
#                             opacity: .8
#                             &:hover
#                                 opacity: 1
#             li
#                 margin-right: 15px
#                 cursor: pointer
#                 font-size: 12px
#                 line-height: 30px
#                 >img
#                     width: auto
#                     height: 12px
#                     vertical-align: middle
#     .active-download
#         bottom: 70px
#         right: 10px
#         width: 226px
#         background: #321260
#         position: fixed
#         display: inline-grid
#         z-index: 3
#         >.hide-progress
#             display: none
#         .file-name
#             text-overflow: ellipsis
#             overflow: hidden
#             width: 90px
#         progress
#             width: 45px
#             height: 16px
#         .pending
#             opacity: .5
#         .progress
#             float: right
#         .cancel
#             text-transform: uppercase
#             float: right
#             cursor: pointer
#             font-weight: 600
#             font-size: 11px !important
#             text-align: right
#             color: #6f6fe2 !important
#         .action
#             position: absolute
#             right: 0px
#             li
#                 display: inline-block
#                 margin-left: 12px
#                 cursor: pointer
#                 &.hide-progress
#                     transform: rotate(180deg)
#         .top
#             border: 0
#         img
#             width: 20px
#             height: 15px
#             margin-right: 10px
#         .col
#             font-size: 12px
#             padding: 10px 15px
#             margin: 0
#             display: inline-block
#             vertical-align: top
#             box-sizing: border-box
#             color: rgb(204, 204, 204)
#             overflow-y: hidden
#             &.folder-menu
#                 text-align: left
#                 display: inline-flex
#                 span
#                     margin-right: 10px
#         .table-row-menu
#             text-align: left
#             &.active
#                 background: rgba(75, 40, 136, 0.2)
#         .bottom, .middle
#             padding: 10px
#         .middle
#             button
#                 outline: none
#                 cursor: pointer
#                 border: 1px solid
#                 padding: 0
#                 box-sizing: border-box
#                 border-radius: $border
#                 font-size: 10px
#                 padding: 0 6px
#                 height: 36px
#                 color: #6CA7ED
#                 text-transform: uppercase
#                 font-weight: bold
#                 background: transparent
#                 transition: all .5s
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 width: 100%
#                 margin: 0 auto
#                 opacity: 1
#                 margin-top: 10px
#     .menu
#         width: 160px
#         background: #321260
#         position: absolute
#         top: 172px
#         right: 0px
#         display: inline-grid
#         z-index: 3
#         .col
#             font-size: 12px
#             padding: 10px 15px
#             margin: 0
#             display: inline-block
#             vertical-align: top
#             box-sizing: border-box
#             color: rgb(204, 204, 204)
#             overflow-y: hidden
#             &.folder-menu
#                 text-align: left
#                 display: inline-flex
#                 span
#                     margin-right: 10px
#         .table-row-menu
#             text-align: left
#             &:hover
#                 cursor: pointer
#                 background: rgba(75, 40, 136, 0.2)
#             &.active
#                 background: rgba(75, 40, 136, 0.2)
#         .bottom, .middle
#             padding: 10px
#         .middle
#             button
#                 outline: none
#                 cursor: pointer
#                 border: 1px solid
#                 padding: 0
#                 box-sizing: border-box
#                 border-radius: $border
#                 font-size: 10px
#                 padding: 0 6px
#                 height: 36px
#                 color: #6CA7ED
#                 text-transform: uppercase
#                 font-weight: bold
#                 background: transparent
#                 transition: all .5s
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 width: 100%
#                 margin: 0 auto
#                 opacity: 1
#                 margin-top: 10px
#     @media(max-width:800px)
#         width: 100%
#         margin: 0
#     .search-input
#         position: fixed
#         background: linear-gradient(100deg, #331462 4%, #15063c 100%)
#         z-index: 1
#         width: 100%
#         .add
#             cursor: pointer
#             position: relative
#             top: 7px
#             margin: 0 20px
#             padding: 8px 0px
#         .close
#             line-height: 2.4
#             cursor: pointer
#             width: 20px
#             margin-right: 20px
#             img
#                 height: 15px
#                 width: 15px
#         .menu-content
#             .tabs
#                 ul
#                     display: inline-flex
#                     padding: 0
#                     margin: 0
#                     list-style: none
#                     li
#                         padding: 15px 25px
#                         cursor: pointer
#                         &.active
#                             background: #43207c
#     @media(max-width:800px)
#         width: 100%
#         margin: 0
#     .search-field
#         .left
#             position: relative
#         .icon
#             position: absolute
#             top: 8px
#             right: 0
#             padding: 8px 10px 9px
#     .section
#         border-bottom: 1px solid rgba(240, 237, 237, 0.16)
#         padding: 0px
#         display: flex
#         width: 100%
#         @media(max-width: 800px)
#             width: auto
#         img
#             width: 80%
#             transition: .5s
#             &.icon-svg-video
#                 position: relative
#                 height: 12px
#                 top: 2px
#                 width: auto
#             &.icon-svg-menu
#                 height: 12px
#                 margin-right: 10px
#                 width: auto
#         &.filter
#             padding: 0px
#         &:last-child
#             border: 0
#         .title
#             padding: 0px
#             text-align: left
#             width: 70px
#             font-size: 14px
#             background: linear-gradient(#250a50, #430f5d)
#             @media(max-width: 800px)
#                 display: none
#             h2
#                 font-family: 'Roboto', sans-serif
#             h3, h2
#                 margin: 0
#                 line-height: 36px
#                 font-weight: 400
#         .description
#             padding: 0px
#             font-size: 14px
#             text-align: left
#             &.tabs
#                 overflow: hidden
#                 ul
#                     overflow-x: scroll
#                     scrollbar-width: none
#                     white-space: nowrap
#             @media(max-width: 800px)
#                 width: 100%
#             ul
#                 list-style: none
#                 padding: 0
#                 margin: 10px 0 0
#                 li
#                     display: inline-block
#                     padding: 15px
#                     cursor: pointer
#                     &:first-child
#                         padding-left: 0
#                     .icon
#                         margin-right: 5px
#                         svg
#                             vertical-align: middle !important
#                     &.active
#                         color: #c671f1
#                         border-bottom: 1px solid
#                         padding-bottom: 15px
#             input
#                 outline: none
#                 width: 200px
#                 box-sizing: border-box
#                 height: 36px
#                 line-height: 36px
#                 border-radius: $border-radius
#                 border-radius: 4px
#                 padding: 0px 10px
#                 font-size: 14px
#                 margin-top: 8px
#                 margin-left: 8px
#                 border: 0px
#                 box-shadow: none
#     button
#         background-color: $primary
#         border: 1px solid $primary
#         border-radius: $border
#         color: white
#         height: 36px
#         width: 104px
#         margin-top: 5px
#         padding: 0 6px
#         text-decoration: none
#         text-transform: uppercase
#         font-size: 10px
#         font-weight: bold
#         cursor: pointer
#         outline: none
#         display: inline-block
#         text-overflow: ellipsis
#         overflow: hidden
#         white-space: nowrap
#         &:hover
#             background: transparent
#             color: $primary
#         &.link
#             min-width: 190px
#         float: right
#         margin-top: 12px
#         margin-right: 10px
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
#     >.toolbar
#         position: relative
#         height: 60px
#         ul
#             display: inline-flex
#             float: left
#             list-style: none
#             padding: 0 20px
#             line-height: 1.8
#             &.path
#     >.wrapper
#         height: 540px
#         display: flex
#         flex-wrap: wrap
#         overflow-y: scroll
#         scrollbar-width: none
#         padding: 0
#         margin-top: 52px
#         >.stats-content
#             width: 30%
#             padding: 20px
#             box-sizing: border-box
#         >.panel-content
#             padding: 20px
#             box-sizing: border-box
#             width: 70%
#             .block-content
#                 padding-bottom: 20px
#                 margin-bottom: 20px
#                 overflow: hidden
#                 &:last-child
#                     border: 0 !important
#                 .horizontal
#                     display: flex
#                     overflow: auto
#                     white-space: nowrap
#             &.dragarea
#                 overflow: inherit
#             &.library
#                 display: grid
#             &.file-tree
#                 margin-left: 0px
#                 @media(max-width: 800px)
#                     margin-left: 0px
#             .dragfile
#                 position: absolute
#                 height: 100vh
#                 background: rgba(35, 16, 68, 0.85)
#                 display: none
#                 &.dragarea
#                     display: block
#                     width: calc(100% - 0px)
#                     display: block
#                     top: 173px
#                     left: 0px
#                     z-index: 2
#                     @media(max-width:800px)
#                         left: 0
#                         width: 100%
#                 div
#                     top: 10rem
#                     text-align: center !important
#                     position: relative
#                     width: 60% !important
#                     padding: 50px 20px
#                     border: 1px dashed
#                     margin: 0 auto
#                     display: block
#                     @media (max-width: 800px)
#                         width: 80% !important
#                     img
#                         display: block
#                         width: 40px
#                         margin: 0 auto 20px
#                     span
#                         color: #6f6fe2
#                         cursor: pointer
#                         display: block
#             iframe
#                 width: 100%
#                 height: 150px
#             @media(max-width: 800px)
#                 width: 100%
#                 margin-left: 0
#             .results
#                 text-align: left
#                 font-size: 13px
#                 margin: 0
#             .header
#                 text-align: left
#                 font-size: 18px
#                 font-weight: 400
#                 margin: 0 0 20px
#             .section
#                 padding: 0 15px 0 0
#                 display: inline-block
#                 width: 25%
#                 min-width: 205px
#                 min-height: 230px
#                 border: 0
#                 box-sizing: border-box
#                 vertical-align: text-top
#                 margin-bottom: 20px
#                 float: left
#                 @media(max-width:800px)
#                     width: 50%
#                 @media(max-width:640px)
#                     width: 100%
#                 .play
#                     @media(max-width:800px)
#                         top: 120px !important
#                 iframe
#                     @media(max-width:800px)
#                         height: 240px
#                 .source
#                     cursor: pointer
#                     position: relative
#                     .title-video
#                         display: flex
#                         .account
#                             border-radius: 50px
#                             width: 20px
#                             height: 20px
#                             padding: 10px
#                             margin-top: 5px
#                             background: #4b2788
#                             margin-right: 10px
#                     .play
#                         width: 100%
#                         height: 150px
#                         display: block
#                         line-height: 43px
#                         border-radius: 0
#                         position: absolute
#                         z-index: 1
#                         top: 80px
#                         left: 50%
#                         margin-right: -50%
#                         transform: translate(-50%, -50%)
#                         opacity: 0
#                         transition: .5s
#                         svg
#                             width: 30px
#                             height: 30px
#                             background: rgba(102, 51, 153, 0.55)
#                             padding: 10px
#                             border-radius: 50px
#                             margin-top: 43px
#                     &:hover
#                         .play
#                             opacity: 1
#                             transition: .5s
#                         img
#                             opacity: 1
#                             transition: .5s
#                         .header
#                             text-decoration: underline
#                 &.developing
#                     opacity: .5
#                     .source
#                         cursor: pointer
#                         &:hover
#                             .header, .address
#                                 text-decoration: none
#                                 cursor: not-allowed
#                 .address, .header, .description
#                     width: 100%
#                     text-align: left
#                     margin: 5px 0
#                 .address
#                     color: #969696
#                     font-size: 13px
#                     cursor: pointer
#                 .header
#                     font-weight: 500
#                     color: #fff
#                     font-size: 17px
#                     cursor: pointer
#                     -webkit-line-clamp: 2
#                     -webkit-box-orient: vertical
#                     overflow: hidden
#                     text-overflow: ellipsis
#                     display: block
#                     display: -webkit-box
#                 .description
#                     opacity: .8
#                     line-height: 1.6
#                     font-size: 13px
#                 ul.stat
#                     list-style: none
#                     padding: 0
#                     margin-bottom: 0
#                     color: #969696
#                     font-size: 13px
#                     text-align: left
#                     margin-top: 0
#                     li
#                         display: inline-block
#                         margin-left: 4px
#                         cursor: pointer
#                         + li
#                             &:before
#                                 content: ' · '
#                         &:first-child
#                             margin-left: 0
#         >.similarvideo
#             margin-left: 180px
#             padding: 20px
#             width: 100%
#             box-sizing: border-box
#             &.file-tree
#                 margin-left: 0px
#                 @media(max-width: 800px)
#                     margin-left: 0px
#             iframe
#                 width: 25%
#                 height: 140px
#             .content-right
#                 width: 60%
#                 margin-left: 20px
#                 @media screen and (max-width: 800px)
#                     width: 100%
#             img
#                 width: 100%
#                 height: 140px
#                 opacity: .8
#                 transition: .5s
#             @media(max-width: 800px)
#                 width: 100%
#                 margin-left: 0
#             .results
#                 text-align: left
#                 font-size: 13px
#                 margin: 0
#             .header
#                 text-align: left
#                 font-size: 18px
#                 font-weight: 400
#                 margin: 0 0 20px
#             .section
#                 padding: 0
#                 display: inline-block
#                 width: 100%
#                 min-width: 205px
#                 min-height: auto
#                 border: 0
#                 box-sizing: border-box
#                 vertical-align: text-top
#                 margin-bottom: 20px
#                 float: left
#                 .source
#                     cursor: pointer
#                     position: relative
#                     display: flex
#                     .play
#                         width: 30%
#                         height: 140px
#                         display: block
#                         line-height: 43px
#                         border-radius: 0
#                         position: absolute
#                         z-index: 1
#                         top: 70px
#                         left: 12%
#                         margin-right: -50%
#                         transform: translate(-50%, -50%)
#                         opacity: 0
#                         transition: .5s
#                         svg
#                             width: 30px
#                             height: 30px
#                             background: rgba(102, 51, 153, 0.55)
#                             padding: 10px
#                             border-radius: 50px
#                             margin-top: 43px
#                     &:hover
#                         .play
#                             opacity: 1
#                             transition: .5s
#                         img
#                             opacity: 1
#                             transition: .5s
#                         .header
#                             text-decoration: underline
#                 &.developing
#                     opacity: .5
#                     .source
#                         cursor: pointer
#                         &:hover
#                             .header, .address
#                                 text-decoration: none
#                                 cursor: not-allowed
#                 .address, .header, .description
#                     width: 100%
#                     text-align: left
#                     margin: 5px 0
#                 .address
#                     color: #969696
#                     font-size: 13px
#                     cursor: pointer
#                 .header
#                     font-weight: 500
#                     color: #fff
#                     font-size: 17px
#                     cursor: pointer
#                     -webkit-line-clamp: 2
#                     -webkit-box-orient: vertical
#                     overflow: hidden
#                     text-overflow: ellipsis
#                     display: block
#                     display: -webkit-box
#                 .description
#                     opacity: .8
#                     line-height: 1.6
#                     font-size: 13px
#                 ul.stat
#                     list-style: none
#                     padding: 0
#                     margin-bottom: 0
#                     color: #969696
#                     font-size: 13px
#                     text-align: left
#                     margin-top: 0
#                 ul.stat-text
#                     list-style: none
#                     padding: 0
#                     margin-bottom: 0
#                     color: #969696
#                     font-size: 13px
#                     text-align: left
#                     margin-top: 0
#                     padding-top: 8px
#                     li
#                         display: inline-block
#                         margin-left: 4px
#                         cursor: pointer
#                         + li
#                             &:before
#                                 content: ' · '
#                         &:first-child
#                             margin-left: 0
#         >.menu-content
#             width: 180px
#             position: fixed
#             box-sizing: border-box
#             @media(max-width: 800px)
#                 display: none
#             &.file-tree
#                 display: none
#                 @media(max-width: 800px)
#                     display: none
#             .tabs
#                 height: 100vh
#                 ul
#                     overflow-x: scroll
#                     scrollbar-width: none
#                     text-align: left
#             @media(max-width: 800px)
#                 width: 100%
#             ul
#                 list-style: none
#                 margin: 0
#                 padding: 0
#                 li
#                     display: inline-block
#                     padding: 15px 25px
#                     font-size: 14px
#                     cursor: pointer
#                     width: 100%
#                     box-sizing: border-box
#                     transition: .5s
#                     .icon
#                         margin-right: 15px
#                         svg
#                             vertical-align: middle !important
#                     &.active
#                         color: #c671f1
#                         background: rgb(67, 32, 124)
#                         padding-bottom: 15px
#                         img
#                             filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
#                     &:hover
#                         background: rgb(67, 32, 124)
#                         padding-bottom: 15px
#                         transition: .5s
#     .iron
#         .logo
#             padding: 6px
#             height: auto
#             display: inline-block
#             line-height: 0px
#             text-align: center
#             vertical-align: text-top
#             border-radius: 5px
#             margin-top: 5px
#             img
#                 transform: scale(-1, 1)
#             svg
#                 vertical-align: top !important
#     .bounce
#         animation: bounce_9418 3.6s ease infinite
#         transform-origin: 50% 50%
#     @keyframes bounce_9418
#         0%
#             transform: translateY(0)
#         5.55556%
#             transform: translateY(0)
#         11.11111%
#             transform: translateY(0)
#         22.22222%
#             transform: translateY(-5px)
#         27.77778%
#             transform: translateY(0)
#         33.33333%
#             transform: translateY(-5px)
#         44.44444%
#             transform: translateY(0)
#         100%
#             transform: translateY(0)
menu = (store, web3t)->
    info = get-primary-info store
    drag-file = ->
        store.sound.drag = not store.sound.drag
        store.sound.menu-open = not store.sound.menu-open
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    react.create-element 'div', { style: filter-body, className: 'menu' }, children = 
        react.create-element 'div', { className: 'middle' }, children = 
            react.create-element 'div', { on-click: drag-file, className: 'table-row-menu' }, children = 
                react.create-element 'div', { className: 'col folder-menu' }, children = 
                    react.create-element 'span', {}, children = 
                        react.create-element 'img', { src: "#{icons.add-video}", className: 'icon-svg' }
                        """ Upload video"""
play-bar = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    react.create-element 'div', { className: 'play-bar' }, children = 
        react.create-element 'ul', { className: 'btn-area' }, children = 
            react.create-element 'li', {}, children = 
                react.create-element 'img', { src: "#{icons.prev}" }
            react.create-element 'li', {}, children = 
                react.create-element 'img', { src: "#{icons.play}" }
            react.create-element 'li', {}, children = 
                react.create-element 'img', { src: "#{icons.next}" }
            react.create-element 'li', {}, children = 
                react.create-element 'img', { src: "#{icons.shuffle}" }
            react.create-element 'li', {}, children = 
                react.create-element 'img', { src: "#{icons.repeat}" }
        react.create-element 'ul', { className: 'play-area' }, children = 
            react.create-element 'li', { className: 'start' }, ' 1:45'
            react.create-element 'li', {}, children = 
                react.create-element 'span', { className: 'progress' }, children = 
                    react.create-element 'span', { className: 'progress' }
            react.create-element 'li', {}, ' 4:21'
            react.create-element 'li', {}, children = 
                react.create-element 'img', { src: "#{icons.volume}" }
        react.create-element 'ul', { className: 'album-area' }, children = 
            react.create-element 'li', { className: 'album' }, children = 
                react.create-element 'span', {}, children = 
                    react.create-element 'img', { src: 'data:image/png;base64,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' }
                react.create-element 'span', {}, children = 
                    react.create-element 'div', { className: 'user' }, ' velas'
                    react.create-element 'div', { className: 'singer' }, ' Lana Del Rey - West Coast - Solomun Remix'
            react.create-element 'li', {}, children = 
                react.create-element 'img', { src: "#{icons.like}" }
            react.create-element 'li', {}, children = 
                react.create-element 'img', { src: "#{icons.next-up}" }
home = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    switch-files = ->
        store.current.files = not store.current.files
    file-tree =
        if store.current.files then \file-tree else \ ""
    style=
        background: info.app.wallet
        color: info.app.text
    header-style-light =
        border-bottom: "1px solid #{info.app.border-light}"
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-style3 =
        color: info.app.text
        border-bottom: "0"
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
        position: "sticky"
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.addressText
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    input-style=
        background: info.app.wallet
        border: "0"
        color: info.app.text
    lightText=
        color: info.app.addressText
    icon-style=
        filter: info.app.nothingIcon
    goto-details = ->
        navigate store, web3t, \videostoragedetails
    drag-file-close = ->
        store.sound.drag = not store.sound.drag
    border-right-light =
        border-right: "1px solid #{info.app.border-light}"
        color: info.app.text
    react.create-element 'div', { style: border-right-light, className: "#{file-tree} panel-content dragarea library" }, children = 
        if store.sound.drag
            react.create-element 'div', { on-click: drag-file-close, className: 'header-table dragfile dragarea' }, children = 
                react.create-element 'div', { style: dashed-border, className: 'cell network' }, children = 
                    react.create-element 'img', { src: "#{icons.img-drag}", style: icon-style, className: 'bounce' }
                    """ Drag and Drop here"""
                    react.create-element 'br', {}
                    """ or"""
                    react.create-element 'span', {}, ' Browse files'
        react.create-element 'div', { style: header-style-light, className: 'block-content' }, children = 
            react.create-element 'h2', { className: 'header' }, ' Chill'
            react.create-element 'div', { className: 'horizontal' }, children = 
                react.create-element 'div', { className: 'section' }, children = 
                    react.create-element 'div', { className: 'source' }, children = 
                        react.create-element 'iframe', { width: '100%', height: '300', scrolling: 'no', frameborder: 'no', allow: 'autoplay', src: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true' }
                        react.create-element 'div', { className: 'title-video' }, children = 
                            react.create-element 'span', {}, children = 
                                react.create-element 'div', { className: 'header' }, ' Morning Chillout'
                                react.create-element 'ul', { className: 'stat' }, children = 
                                    react.create-element 'li', {}, children = 
                                        react.create-element 'span', {}, ' Mighty'
                react.create-element 'div', { className: 'section' }, children = 
                    react.create-element 'div', { className: 'source' }, children = 
                        react.create-element 'iframe', { width: '100%', height: '300', scrolling: 'no', frameborder: 'no', allow: 'autoplay', src: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true' }
                        react.create-element 'div', { className: 'title-video' }, children = 
                            react.create-element 'span', {}, children = 
                                react.create-element 'div', { className: 'header' }, ' Morning Chillout'
                                react.create-element 'ul', { className: 'stat' }, children = 
                                    react.create-element 'li', {}, children = 
                                        react.create-element 'span', {}, ' Mighty'
                react.create-element 'div', { className: 'section' }, children = 
                    react.create-element 'div', { className: 'source' }, children = 
                        react.create-element 'iframe', { width: '100%', height: '300', scrolling: 'no', frameborder: 'no', allow: 'autoplay', src: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true' }
                        react.create-element 'div', { className: 'title-video' }, children = 
                            react.create-element 'span', {}, children = 
                                react.create-element 'div', { className: 'header' }, ' Morning Chillout'
                                react.create-element 'ul', { className: 'stat' }, children = 
                                    react.create-element 'li', {}, children = 
                                        react.create-element 'span', {}, ' Mighty'
                react.create-element 'div', { className: 'section' }, children = 
                    react.create-element 'div', { className: 'source' }, children = 
                        react.create-element 'iframe', { width: '100%', height: '300', scrolling: 'no', frameborder: 'no', allow: 'autoplay', src: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true' }
                        react.create-element 'div', { className: 'title-video' }, children = 
                            react.create-element 'span', {}, children = 
                                react.create-element 'div', { className: 'header' }, ' Morning Chillout'
                                react.create-element 'ul', { className: 'stat' }, children = 
                                    react.create-element 'li', {}, children = 
                                        react.create-element 'span', {}, ' Mighty'
        react.create-element 'div', { style: header-style-light, className: 'block-content' }, children = 
            react.create-element 'h2', { className: 'header' }, ' Party'
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'source' }, children = 
                    react.create-element 'iframe', { width: '100%', height: '300', scrolling: 'no', frameborder: 'no', allow: 'autoplay', src: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true' }
                    react.create-element 'div', { className: 'title-video' }, children = 
                        react.create-element 'span', {}, children = 
                            react.create-element 'div', { className: 'header' }, ' Morning Chillout'
                            react.create-element 'ul', { className: 'stat' }, children = 
                                react.create-element 'li', {}, children = 
                                    react.create-element 'span', {}, ' Mighty'
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'source' }, children = 
                    react.create-element 'iframe', { width: '100%', height: '300', scrolling: 'no', frameborder: 'no', allow: 'autoplay', src: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true' }
                    react.create-element 'div', { className: 'title-video' }, children = 
                        react.create-element 'span', {}, children = 
                            react.create-element 'div', { className: 'header' }, ' Morning Chillout'
                            react.create-element 'ul', { className: 'stat' }, children = 
                                react.create-element 'li', {}, children = 
                                    react.create-element 'span', {}, ' Mighty'
stream = (store, web3t)->
    info = get-primary-info store
    border-right-light =
        border-right: "1px solid #{info.app.border-light}"
        color: info.app.text
    react.create-element 'div', { style: border-right-light, className: 'panel-content' }, children = 
        react.create-element 'p', { className: 'results' }, ' This tab is under development'
library = (store, web3t)->
    info = get-primary-info store
    border-right-light =
        border-right: "1px solid #{info.app.border-light}"
        color: info.app.text
    react.create-element 'div', { style: border-right-light, className: 'panel-content' }, children = 
        react.create-element 'p', { className: 'results' }, ' This tab is under development'
stats = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    react.create-element 'div', { className: 'stats-content' }, children = 
        react.create-element 'p', { className: 'results' }, ' This part is under development'
videostorage = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
        position: "sticky"
    active =
        if store.current.active then \active else \ ""
    switch-progress = ->
        store.current.progress = not store.current.progress
    hide-progress =
        if store.current.progress then \hide-progress else \ ""
    switch-files = ->
        store.current.files = not store.current.files
    file-tree =
        if store.current.files then \file-tree else \ ""
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-style3 =
        color: info.app.text
        border-bottom: "0"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
        background: info.app.header
    border-menu =
        color: info.app.text
        border-right: "1px solid #{info.app.border-light}"
    button-primary2-style=
        border: "1px solid #{info.app.primary2}"
        color: info.app.text
        background: info.app.primary2
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
        position: "sticky"
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.addressText
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    input-style=
        background: info.app.wallet
        border: "0"
        color: info.app.text
    lightText=
        color: info.app.addressText
    icon-style=
        filter: info.app.nothingIcon
    activate = (tab)-> ->
        store.sound.tab = tab 
    activate-home = activate \home
    activate-stream = activate \stream
    activate-library = activate \library
    active-class = (tab)->
        if store.sound.tab is tab then 'active' else ''
    active-home = active-class \home
    active-stream = active-class \stream
    active-library = active-class \library
    expand-collapse = ->
        store.sound.menu-open = not store.sound.menu-open
    show-class =
        if store.current.open-menu then \hide else \ ""
    react.create-element 'div', { className: 'videostorage videostorage1006399051' }, children = 
        play-bar store, web3t
        react.create-element 'div', { style: filter-body, className: 'active-download' }, children = 
            react.create-element 'div', { style: header-table-style, className: 'top' }, children = 
                react.create-element 'div', { className: 'table-row-menu' }, children = 
                    react.create-element 'span', { className: 'col folder-menu' }, children = 
                        react.create-element 'div', {}, ' Uploading 1 item'
                    react.create-element 'ul', { className: "#{active} action col" }, children = 
                        react.create-element 'li', { on-click: switch-progress, className: "#{hide-progress}" }, children = 
                            react.create-element 'span', {}, children = 
                                icon "ChevronDown", 15
                        react.create-element 'li', {}, children = 
                            react.create-element 'span', {}, children = 
                                icon \X, 15
            react.create-element 'div', { style: header-table-style, className: "#{hide-progress}" }, children = 
                react.create-element 'div', { className: 'table-row-menu' }, children = 
                    react.create-element 'span', { className: 'col folder-menu' }, children = 
                        react.create-element 'div', {}, ' Left 7min.'
                    react.create-element 'span', { className: 'col cancel' }, ' Cancel'
            react.create-element 'div', { className: "#{hide-progress}" }, children = 
                react.create-element 'div', { className: 'table-row-menu' }, children = 
                    react.create-element 'div', { className: 'col folder-menu pending' }, children = 
                        react.create-element 'img', { src: "#{store.filestore.extension-icons.txt}" }
                        react.create-element 'div', { className: 'file-name' }, ' File.txt'
                    react.create-element 'div', { className: 'col folder-menu progress' }, children = 
                        react.create-element 'progress', { value: "30", max: "100" }
        react.create-element 'div', { style: border-style2, className: 'title alert' }, children = 
            react.create-element 'div', { className: 'header' }, ' This page is under development. You see this only as demo'
        react.create-element 'div', { style: border-style, className: 'title' }, children = 
            react.create-element 'div', { className: "#{show-class} header" }, ' Sound storage'
            react.create-element 'div', { on-click: go-back, className: 'close' }, children = 
                react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg' }
            epoch store, web3t
            switch-account store, web3t
        if store.sound.menu-open
            menu store, web3t
        react.create-element 'div', { className: 'search-input' }, children = 
            react.create-element 'div', { style: border-style, className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h2', { className: 'iron' }, children = 
                        react.create-element 'span', { className: 'logo' }, children = 
                            react.create-element 'img', { src: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAAAsCAQAAAAwC3WkAAACUklEQVR4Ae2YA4wdURSGv+fattu4MWrbtu24bqOacWrbjNHYrm3bOF3vSXrzOpM7d3c22e8k31P03//ME0WdCM6QsvSlNS1pQGV+8JxnPOEKlyM3CD9SVjbJFzFzV1ZKJcKMVJBrkp6PslaqEFZku3jhmXQjPEhjuZkxjQHkgXjjj2yQBOFAFolksAhA/HBM4lgQJShKK/thMPskFoYASWV/DGeTTQCLXdeQUPbLHOlWcA0Mo0nGDAs0AOyQigUVoEyuVRt2KwRQm+UFFSClrNqwbAAmS0UnAdKedFlluwagNDPdNaBPOmW0fQMw3V2AcspJZRXAugGoIy1cBSihnFLWz9s3AB3wTdx3AHcNwABJ0I3m1EB4wm0ucCbyKIgAJZXdXQPQJWNyaZYxPdgiu1geeeJlhdS7jdUKBUuMyVyTvh4DMJwmGTPcwQrZUJZTMtdbgEq5Vm2oABYrZEeUTdLXS4ByyrqNkspJZWMzjiLsl1rGF/RJU1a5mrJ9A/aUZaU52QiaZMyIfxqoqFyI14BigtQxBagNkGHdgApQyO9Cmhj9TAGqA2QYc4AAPwfs6ZU+QNhXCBqbAtQAyHD4Vwhqhb8By2+johxR/q38y2x+KrviiSnAc4AcfwzIrrhtCvAMIMvhD3Dhfw18CMhu+M2Zor1CuyKPTAEeA2Q47A18ZDmYAhziVsYcCnkDfxgdeYKBeOQ2TQFC3cAfFkTOevkcCKqBpwEvz4DIVvAS4E1A3ktQ/GY7LSJn/f91bnc/KavlidjwUa7LRZkldSimGLf8BYloKYNdaWi1AAAAAElFTkSuQmCC" }
                react.create-element 'div', { className: "#{file-tree} menu-content" }, children = 
                    react.create-element 'div', { className: 'section filter' }, children = 
                        react.create-element 'div', { className: 'tabs' }, children = 
                            react.create-element 'ul', {}, children = 
                                react.create-element 'li', { on-click: activate-home, style: border-menu, className: "#{active-home}" }, children = 
                                    react.create-element 'span', { className: 'icon' }, children = 
                                        """ Home"""
                                react.create-element 'li', { on-click: activate-stream, style: border-menu, className: "#{active-stream}" }, children = 
                                    react.create-element 'span', { className: 'icon' }, children = 
                                        """ Stream"""
                                react.create-element 'li', { on-click: activate-library, style: border-menu, className: "#{active-library}" }, children = 
                                    react.create-element 'span', { className: 'icon' }, children = 
                                        """ Library"""
                react.create-element 'div', { className: 'description search-field' }, children = 
                    react.create-element 'div', { className: 'left' }, children = 
                        react.create-element 'input', { type: 'text', style: input-style, value: "velas", placeholder: "velas" }
                        react.create-element 'div', { className: 'icon' }, children = 
                            icon \Search, 15
                react.create-element 'div', { on-click: expand-collapse, className: 'add' }, ' Upload'
        react.create-element 'div', { className: 'wrapper' }, children = 
            if active-home is \active
                home store, web3t
            if active-stream is \active
                stream store, web3t
            if active-library is \active
                library store, web3t
            stats store, web3t
module.exports = videostorage