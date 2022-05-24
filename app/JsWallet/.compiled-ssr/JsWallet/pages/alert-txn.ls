require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \prelude-ls : { filter }
}
# .title1089447129
#     &.alert
#         color: rgb(255, 255, 255)
#         background: #ffa500
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
    lang = get-lang store
    has-pending =
        store.transactions.applied
            |> filter (.token is \vlx2)
            |> filter (.pending)
            |> (.length > 0)
    return null if not has-pending
    react.create-element 'div', { className: 'title alert txn title1089447129' }, children = 
        react.create-element 'div', { className: 'header' }, ' ' + lang.pendingTransactions