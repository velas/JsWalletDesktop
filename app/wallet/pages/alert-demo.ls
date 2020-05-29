require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
}
# .title-953152933
#     &.alert
#         color: rgb(255, 255, 255)
#         border-bottom: 1px solid rgb(107, 38, 142)
#         background: rgb(75, 40, 136)
module.exports = (store, web3t)->
    lang = get-lang store
    style = get-primary-info store
    border-style2 =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.demo
    react.create-element 'div', { style: border-style2, className: 'title alert title-953152933' }, children = 
        react.create-element 'div', { className: 'header' }, ' This page is under development. You see this only as demo'