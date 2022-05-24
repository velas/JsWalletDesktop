require! {
    \react
    \../icons.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \../navigate.ls
}
# .burger943922841
#     @import scheme
#     display: block !important
#     border: 0
#     line-height: 25px
#     padding: 10px !important
#     width: 45px !important
#     height: 40px !important
#     margin: 10px 0 0 !important
#     position: absolute
#     top: 0
#     @media(min-width: 992px)
#         display: none !important
#     .icon-svg-plus
#         position: relative
#         height: 15px
#         width: 15px
#         top: 2px
#         padding: 0
#         cursor: pointer
#         vertical-align: top
module.exports = (store, web3t)->
    lang = get-lang store
    style = get-primary-info store
    show-class =
        if store.menu.show then \show else \ ""
    show = ->
        store.menu.show = not store.menu.show
    button-add=
        color: style.app.text
        background: style.app.bg-btn
        filter: style.app.icon1
    react.create-element 'button', { style: button-add, on-click: show, className: "#{show-class} button burger burger943922841" }, children = 
        react.create-element 'img', { src: "#{icons.menu}", className: 'icon-svg-plus' }