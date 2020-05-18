require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
}
# .title1423047955
#     &.alert
#         color: rgb(255, 255, 255)
#         border-bottom: 1px solid rgb(107, 38, 142)
#         background: rgb(75, 40, 136)
#         height: auto
#         &.txn
#             visibility: visible
#         .header
#             line-height: 26px !important
#             font-size: 12px
#             .lavel
module.exports = ({ store, web3t } )->
    react.create-element 'div', { className: 'title alert txn title1423047955' }, children = 
        react.create-element 'div', { className: 'header' }, children = 
            """ You have a Velas pending transaction"""
            react.create-element 'span', { className: 'label' }, ' (2)'