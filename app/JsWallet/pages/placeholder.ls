require! {
    \react
    \react-dom
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
}
# .form-group182007954
#     position: absolute
#     width: 100%
#     background: var(--background)
#     z-index: 1
#     height: 100%
#     .section
#         .description
#             height: 70px !important
#             position: relative
#             &:after, .left:after
#                 content: ''
#                 display: block
#                 background: #17073f
#                 height: 100%
#                 width: 100%
#                 top: 0
#                 position: absolute
#                 -webkit-animation-duration: 1s
#                 animation-duration: 1s
#                 -webkit-animation-fill-mode: forwards
#                 animation-fill-mode: forwards
#                 -webkit-animation-iteration-count: infinite
#                 animation-iteration-count: infinite
#                 -webkit-animation-name: placeload
#                 animation-name: placeload
#                 -webkit-animation-timing-function: linear
#                 animation-timing-function: linear
#                 background: #f6f7f8
#                 background: #eeeeee
#                 background: -webkit-linear-gradient(left, #eeeeee 8%, #dddddd 18%, #eeeeee 33%)
#                 background: linear-gradient(to right, #442080 8%, #422375 18%, #3b1b6f 33%)
#                 -webkit-background-size: 800px 104px
#                 background-size: 1200px 104px
#                 color: transparent !important
#         h3
#             -webkit-animation-duration: 1s
#             animation-duration: 1s
#             -webkit-animation-fill-mode: forwards
#             animation-fill-mode: forwards
#             -webkit-animation-iteration-count: infinite
#             animation-iteration-count: infinite
#             -webkit-animation-name: placeload
#             animation-name: placeload
#             -webkit-animation-timing-function: linear
#             animation-timing-function: linear
#             background: #f6f7f8
#             background: #eeeeee
#             background: -webkit-gradient(linear, left top, right top, color-stop(8%, #eeeeee), color-stop(18%, #dddddd), color-stop(33%, #eeeeee))
#             background: -webkit-linear-gradient(left, #eeeeee 8%, #dddddd 18%, #eeeeee 33%)
#             background: linear-gradient(to right, #442080 8%, #422375 18%, #3b1b6f 33%)
#             -webkit-background-size: 800px 104px
#             background-size: 1200px 104px
#             position: relative
#             width: 70%
#             color: transparent !important
#             margin-bottom: 10px !important
#             content: ""
#             display: block
#             height: 17px
#             &:last-child
#                 margin-bottom: 0 !important
#             @media screen and (max-width: 800px)
#                 margin: 0 auto 10px !important
section = (store, web3t)->
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}
            react.create-element 'h3', {}
            react.create-element 'h3', {}
        react.create-element 'div', { className: 'description' }
module.exports = (store, web3t)->
    react.create-element 'div', { className: 'form-group form-group182007954' }, children = 
        section store, web3t
        section store, web3t
        section store, web3t
        section store, web3t