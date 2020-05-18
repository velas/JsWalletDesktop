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
module.exports = ({ store, web3t } )->
    react.create-element 'div', { className: 'title alert title-953152933' }, children = 
        react.create-element 'div', { className: 'header' }, ' This page is under development. You see this only as demo'