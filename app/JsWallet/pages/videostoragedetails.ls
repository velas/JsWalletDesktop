require! {
    \react
    \react-dom
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \./switch-account.ls
    \../icons.ls
    \./epoch.ls
    \./alert-demo.ls
    \../components/burger.ls
}
# .videodetails324410684
#     @import scheme
#     $border-radius: $border
#     $smooth: opacity .15s ease-in-out
#     position: relative
#     display: block
#     width: auto
#     overflow: hidden
#     margin-left: $left-margin
#     top: 0
#     height: 100%
#     min-height: 100vh
#     padding-top: 5%
#     box-sizing: border-box
#     padding: 0px
#     background: transparent
#     .icon-svg-arrow
#         position: relative
#         height: 12px !important
#         width: auto !important
#         top: 2px
#     .search-input
#         position: fixed
#         background: linear-gradient(100deg, #331462 4%, #15063c 100%)
#         z-index: 1
#         width: 100%
#         .close
#             line-height: 35px
#             cursor: pointer
#             width: 20px
#             margin-right: 20px
#             text-align: left
#     @media(max-width:$ipad)
#         width: 100%
#         margin: 0
#     .search-field
#         .left
#             position: relative
#         .icon
#             position: absolute
#             top: 1px
#             right: 0
#             background: #532b94
#             padding: 8px 20px 9px
#     .section
#         border-bottom: 1px solid rgba(240, 237, 237, 0.16)
#         padding: 15px 20px 15px
#         display: flex
#         width: 100%
#         img
#             width: 100%
#             height: 400px
#             opacity: .8
#             transition: .5s
#         &.filter
#             padding: 0px
#         &:last-child
#             border: 0
#         .title
#             padding: 0px
#             width: 25%
#             text-align: left
#             font-size: 14px
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
#             width: 40%
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
#                 width: 100%
#                 box-sizing: border-box
#                 height: 36px
#                 line-height: 36px
#                 border-radius: $border-radius
#                 padding: 0px 10px
#                 font-size: 14px
#                 margin: 1px
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
#         height: calc(100vh - 190px)
#         display: flex
#         flex-wrap: wrap
#         overflow-y: scroll
#         scrollbar-width: none
#         padding: 0
#         margin-top: 69px
#         >.panel-content
#             margin-left: 0
#             padding: 20px 0px 20px 20px
#             width: 60%
#             box-sizing: border-box
#             @media(max-width:800px)
#                 padding: 20px
#             .add-comments
#                 display: flex
#                 margin: 20px auto
#                 padding: 20px 0
#                 border-top: 1px solid rgba(107, 38, 142, 0.4)
#                 border-bottom: 1px solid rgba(107, 38, 142, 0.4)
#                 .account
#                     border-radius: 50px
#                     width: 20px
#                     height: 20px
#                     padding: 10px
#                     margin-top: 5px
#                     background: #4b2788
#                     margin-right: 10px
#                 .action
#                     width: 100%
#                     input
#                         outline: none
#                         width: 100%
#                         box-sizing: border-box
#                         height: 36px
#                         border-radius: 0px
#                         padding: 0px 10px 0 0
#                         font-size: 14px
#                         margin: 1px
#                         border: 0px
#                         color: #fff
#                         box-shadow: none
#                         background: transparent
#                         border-bottom: 1px solid #6b268e
#                     ul.stat
#                         list-style: none
#                         padding: 0
#                         margin-bottom: 0
#                         color: #969696
#                         font-size: 13px
#                         text-align: right
#                         margin-top: 0px
#                         li
#                             display: inline-block
#                             margin-left: 4px
#                             cursor: pointer
#                             + li
#                                 &:before
#                                     content: ' '
#                             &:first-child
#                                 margin-left: 0
#                                 button
#                                     background: transparent
#                                     border: 0
#                             &:last-child
#                                 button
#                                     margin-right: 0
#                             button
#                                 width: 100%
#             .comments
#                 display: flex
#                 margin: 20px auto
#                 padding: 10px 0
#                 .header
#                     font-size: 14px !important
#                 .account
#                     border-radius: 50px
#                     width: 20px
#                     height: 20px
#                     padding: 10px
#                     margin-top: 5px
#                     background: #4b2788
#                     margin-right: 10px
#                 .action
#                     width: 100%
#                     input
#                         outline: none
#                         width: 100%
#                         box-sizing: border-box
#                         height: 36px
#                         border-radius: 0px
#                         padding: 0px 10px 0 0
#                         font-size: 14px
#                         margin: 1px
#                         border: 0px
#                         color: #fff
#                         box-shadow: none
#                         background: transparent
#                         border-bottom: 1px solid #6b268e
#                     ul.rating
#                         list-style: none
#                         padding: 0
#                         margin-bottom: 0
#                         color: #969696
#                         font-size: 15px
#                         text-align: left
#                         margin-top: 15px
#                         li
#                             display: inline-block
#                             margin-left: 4px
#                             margin-right: 5px
#                             .action
#                                 line-height: 15px
#                                 color: white
#                                 width: auto
#                                 padding: 0 6px
#                                 text-decoration: none
#                                 text-transform: uppercase
#                                 font-size: 14px
#                                 cursor: pointer
#                                 outline: none
#                                 display: inline-block
#                                 text-overflow: ellipsis
#                                 overflow: hidden
#                                 white-space: nowrap
#                             img
#                                 &.like, &.dislike
#                                     width: 15px
#                                     height: 15px
#                                     cursor: pointer
#                                 &.dislike
#                                     transform: rotate(180deg)
#                             + li
#                                 &:before
#                                     content: ' '
#                             &:first-child
#                                 margin-left: 0
#                                 button
#                                     background: transparent
#                                     border: 0
#                             &:last-child
#                                 button
#                                     margin-right: 0
#                             button
#                                 width: 100%
#                     ul.stat
#                         list-style: none
#                         padding: 0
#                         margin-bottom: 0
#                         color: #969696
#                         font-size: 13px
#                         text-align: left
#                         margin-top: 0px
#                         li
#                             display: inline-block
#                             margin-left: 4px
#                             cursor: pointer
#                             .user
#                                 color: #fff
#                             + li
#                                 &:before
#                                     content: ' '
#                             &:first-child
#                                 margin-left: 0
#                                 button
#                                     background: transparent
#                                     border: 0
#                             &:last-child
#                                 button
#                                     margin-right: 0
#                             button
#                                 width: 100%
#             .close
#                 text-align: left
#                 margin-bottom: 20px
#                 cursor: pointer
#                 float: left
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
#                 min-height: 230px
#                 border: 0
#                 box-sizing: border-box
#                 vertical-align: text-top
#                 margin-bottom: 20px
#                 float: left
#                 .source
#                     cursor: pointer
#                     position: relative
#                     iframe
#                         width: 100%
#                         height: 420px
#                     .play
#                         width: 50px
#                         height: 50px
#                         background: rgba(226, 226, 226, 0.3)
#                         display: block
#                         line-height: 43px
#                         border-radius: 50px
#                         position: absolute
#                         z-index: 1
#                         top: 190px
#                         left: 50%
#                         margin-right: -50%
#                         transform: translate(-50%, -50%)
#                         opacity: 0
#                         transition: .5s
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
#             margin-left: 0
#             padding: 20px
#             width: 40%
#             box-sizing: border-box
#             >div
#                 display: inline-block
#             iframe
#                 width: 50%
#                 height: 120px
#             .content-right
#                 width: 50%
#                 margin-left: 20px
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
#                 .action
#                     line-height: 1.8
#                     float: right
#                     color: white
#                     width: auto
#                     padding: 0 6px
#                     text-decoration: none
#                     text-transform: uppercase
#                     font-size: 14px
#                     outline: none
#                     display: inline-block
#                     text-overflow: ellipsis
#                     overflow: hidden
#                     white-space: nowrap
#                     .checkbox-one
#                         position: relative
#                         display: block
#                         width: 48px
#                         height: 20px
#                         margin-top: 2px
#                         input
#                             display: none
#                             &:checked + .track
#                                 background-color: #895ed8
#                                 &:before
#                                     -webkit-transform: translateX(28px)
#                                     transform: translateX(28px)
#                         .track
#                             cursor: pointer
#                             position: absolute
#                             top: 0
#                             left: 0
#                             right: 0
#                             bottom: 0
#                             background-color: rgb(59, 28, 107)
#                             -webkit-transition: 0.25s
#                             transition: 0.25s
#                             &:before
#                                 content: ""
#                                 position: absolute
#                                 box-shadow: 0 2px 1px -1px rgba(0, 0, 0, 0.2), 0 1px 1px 0 rgba(0, 0, 0, 0.14), 0 1px 3px 0 rgba(0, 0, 0, 0.12)
#                                 background-color: #fafafa
#                                 -webkit-transition: 0.25s
#                                 transition: 0.25s
#                         .thumb
#                             border-radius: 35px
#                             &:before
#                                 top: 0px
#                                 width: 20px
#                                 height: 20px
#                                 border-radius: 50%
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
#                         width: 100%
#                         height: 140px
#                         display: block
#                         line-height: 43px
#                         border-radius: 0
#                         position: absolute
#                         z-index: 1
#                         top: 62px
#                         left: 25%
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
#             width: 30%
#             position: relative
#             box-sizing: border-box
#             @media(max-width: 800px)
#                 display: none
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
#                 padding: 10px 0
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
#                     &:hover
#                         background: rgb(67, 32, 124)
#                         padding-bottom: 15px
#                         transition: .5s
#     .iron
#         -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
#         -webkit-mask-size: 50% 100%
#         animation: shine 2s infinite
#         .logo
#             padding: 6px
#             width: 20px
#             height: 10px
#             display: inline-block
#             background: #ba68e6
#             line-height: 0px
#             text-align: center
#             vertical-align: text-top
#             border-radius: 5px
#             margin-top: 3px
#             svg
#                 vertical-align: top !important
#     @keyframes shine
#         0%
#             -webkit-mask-position: right
#         100%
#             -webkit-mask-position: left
video = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
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
        color: info.app.color3
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
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    react.create-element 'div', { className: 'panel-content' }, children = 
        react.create-element 'div', { className: 'section' }, children = 
            react.create-element 'div', { className: 'source' }, children = 
                react.create-element 'iframe', { width: '560', height: '315', src: 'https://www.youtube.com/embed/USGLlp-zfhI', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                react.create-element 'ul', { className: 'stat' }, children = 
                    react.create-element 'li', {}, children = 
                        react.create-element 'span', {}, ' 1.4K views'
                    react.create-element 'li', {}, children = 
                        react.create-element 'span', {}, ' 8 mounths ago'
            add-comments store, web3t
            comments store, web3t
add-comments = (store, web3t)->
    lang = get-lang store
    info = get-primary-info store
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    react.create-element 'div', { className: 'add-comments' }, children = 
        react.create-element 'span', {}, children = 
            react.create-element 'img', { src: "#{info.branding.logo}", className: 'account' }
        react.create-element 'span', { className: 'action' }, children = 
            react.create-element 'input', { type: "text", placeholder: "Leave a comment", vlue: "Leave a comment" }
            react.create-element 'ul', { className: 'stat' }, children = 
                react.create-element 'li', {}, children = 
                    react.create-element 'button', {}, ' Cancel'
                react.create-element 'li', {}, children = 
                    react.create-element 'button', { style: button-primary1-style }, ' Leave a Comment'
comments = (store, web3t)->
    lang = get-lang store
    info = get-primary-info store
    react.create-element 'div', { className: 'comments' }, children = 
        react.create-element 'span', {}, children = 
            react.create-element 'img', { src: "#{info.branding.logo}", className: 'account' }
        react.create-element 'span', { className: 'action' }, children = 
            react.create-element 'ul', { className: 'stat' }, children = 
                react.create-element 'li', {}, children = 
                    react.create-element 'span', { className: 'user' }, ' Velas Network AG'
                react.create-element 'li', {}, children = 
                    react.create-element 'span', {}, ' 1 week ago'
            react.create-element 'div', { className: 'header' }, ' There will be any comment on this video..'
            react.create-element 'ul', { className: 'rating' }, children = 
                react.create-element 'li', {}, children = 
                    react.create-element 'img', { src: "#{icons.img-like}", className: 'like' }
                react.create-element 'li', {}, children = 
                    react.create-element 'span', {}, ' 124'
                react.create-element 'li', {}, children = 
                    react.create-element 'img', { src: "#{icons.img-like}", className: 'dislike' }
                react.create-element 'li', {}, children = 
                    react.create-element 'span', {}
                react.create-element 'li', {}, children = 
                    react.create-element 'span', { className: 'action' }, ' REPLY'
next = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
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
        color: info.app.color3
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
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    header-style-light =
        border-bottom: "1px solid #{info.app.border-light}"
        color: info.app.text
        margin-bottom: "20px"
    goto-details = ->
        navigate store, web3t, \videostoragedetails
    react.create-element 'div', { style: header-style-light }, children = 
        react.create-element 'h2', { className: 'header' }, children = 
            """ Up next"""
            react.create-element 'span', { className: 'action' }, children = 
                react.create-element 'label', { className: 'checkbox-one' }, children = 
                    react.create-element 'input', { type: 'checkbox' }
                    react.create-element 'div', { className: 'track thumb' }
            react.create-element 'span', { className: 'action' }, ' AUTOPLAY'
        react.create-element 'div', { className: 'section' }, children = 
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children = 
                react.create-element 'span', { className: 'play' }, children = 
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/2jdA5EwQV9M', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'span', { className: 'content-right' }, children = 
                    react.create-element 'div', { className: 'header' }, ' How to setup New Velas Web Wallet Tutorial'
                    react.create-element 'ul', { className: 'stat' }, children = 
                        react.create-element 'li', {}, children = 
                            react.create-element 'span', {}, ' Velas'
                        react.create-element 'li', {}, children = 
                            react.create-element 'span', {}, ' 122 views • 5 days ago'
similarvideo = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
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
        color: info.app.color3
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
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    header-style-light =
        border-bottom: "1px solid #{info.app.border-light}"
        color: info.app.text
    goto-details = ->
        navigate store, web3t, \videostoragedetails
    react.create-element 'div', {}, children = 
        react.create-element 'div', { className: 'section' }, children = 
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children = 
                react.create-element 'span', { className: 'play' }, children = 
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/USGLlp-zfhI', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'span', { className: 'content-right' }, children = 
                    react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                    react.create-element 'ul', { className: 'stat' }, children = 
                        react.create-element 'li', {}, children = 
                            react.create-element 'span', {}, ' Velas'
                        react.create-element 'li', {}, children = 
                            react.create-element 'span', {}, ' 1.4K views • 8 days ago'
        react.create-element 'div', { className: 'section' }, children = 
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children = 
                react.create-element 'span', { className: 'play' }, children = 
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/2jdA5EwQV9M', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'span', { className: 'content-right' }, children = 
                    react.create-element 'div', { className: 'header' }, ' How to setup New Velas Web Wallet Tutorial'
                    react.create-element 'ul', { className: 'stat' }, children = 
                        react.create-element 'li', {}, children = 
                            react.create-element 'span', {}, ' Velas'
                        react.create-element 'li', {}, children = 
                            react.create-element 'span', {}, ' 122 views • 5 days ago'
        react.create-element 'div', { className: 'section' }, children = 
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children = 
                react.create-element 'span', { className: 'play' }, children = 
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/USGLlp-zfhI', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'span', { className: 'content-right' }, children = 
                    react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                    react.create-element 'ul', { className: 'stat' }, children = 
                        react.create-element 'li', {}, children = 
                            react.create-element 'span', {}, ' Velas'
                        react.create-element 'li', {}, children = 
                            react.create-element 'span', {}, ' 1.4K views • 8 days ago'
videodetails = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.background
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
        color: info.app.color3
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
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    header-style-light =
        border-bottom: "1px solid #{info.app.border-light}"
        color: info.app.text
    goto-videostorage = ->
        navigate store, web3t, \videostorage
    show-class =
        if store.current.open-menu then \hide else \ ""
    react.create-element 'div', { className: 'videodetails videodetails324410684' }, children = 
        alert-demo store, web3t
        react.create-element 'div', { style: border-style, className: 'title' }, children = 
            react.create-element 'div', { className: "#{show-class} header" }, ' Video storage'
            react.create-element 'div', { on-click: go-back, className: 'close' }, children = 
                react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg-arrow' }
            burger store, web3t
            epoch store, web3t
            switch-account store, web3t
        react.create-element 'div', { className: 'search-input' }, children = 
            react.create-element 'div', { style: border-style, className: 'section' }, children = 
                react.create-element 'span', { on-click: goto-videostorage, className: 'close' }, children = 
                    react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg-arrow' }
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h2', { className: 'iron' }, children = 
                        react.create-element 'span', { className: 'logo' }, children = 
                            icon \TriangleRight, 10
                        react.create-element 'span', {}, ' Vortex'
                react.create-element 'div', { className: 'description search-field' }, children = 
                    react.create-element 'div', { className: 'left' }, children = 
                        react.create-element 'input', { type: 'text', style: input-style, value: "velas", placeholder: "velas" }
                        react.create-element 'div', { className: 'icon' }, children = 
                            icon \Search, 15
        react.create-element 'div', { className: 'wrapper' }, children = 
            video store, web3t
            react.create-element 'div', { className: 'similarvideo' }, children = 
                next store, web3t
                similarvideo store, web3t
module.exports = videodetails