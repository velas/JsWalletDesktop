require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \prelude-ls : { filter }
}
# .title-1096156716
#     &.alert
#         color: rgb(255, 255, 255)
#         border-bottom: 1px solid rgb(107, 38, 142)
#         background: #757c34
#         height: auto
#         &.txn
#             visibility: visible
#             margin-left: 0px !important
#             @media(max-width: 800px)
#                 margin-left: 0px
#         .header
#             line-height: 26px !important
#             font-size: 12px
#             .lavel
module.exports = ({ store, web3t } )->
    has-pending =
        store.transactions.applied
            |> filter (.token is \vlx2)
            |> filter (.pending)
            |> (.length > 0)
    return null if not has-pending
    react.create-element 'div', { className: 'title alert txn title-1096156716' }, children = 
        react.create-element 'div', { className: 'header' }, ' You have a Velas pending transaction. Some of the counts may be inaccurate.'