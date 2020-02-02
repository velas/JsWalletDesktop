require! {
    \mobx-react : { observer }
    \mobx : { observable }
    \react
    \./pages.ls
    \./pages/header.ls
    \./description.ls
    \./browser/window.ls
    \./copy-message.ls
    \./modal.ls : { modal-control }
    \./get-primary-info.ls
    \./pages/confirmation.ls : { confirmation-control }
}
# .app1470044321
#     *
#         user-select: none
#     user-select: none
#     overflow: hidden
#     @import scheme
#     background: $primary
#     height: 100vh
#     position: relative
#     color: white
#     text-align: center
#     width: 100vw
#     .content
#         max-width: 450px
#         display: inline-block
#         width: 100%
#     &.syncing
#         background-size: 400% 400% !important
#         animation: gradient 3s ease infinite
#     @keyframes gradient
#         0%
#             background-position: 0% 50%
#         50%
#             background-position: 100% 50%
#         100%
#             background-position: 0% 50%
module.exports = ({ store, web3t })->
    return null if not store?
    current-page =
        pages[store.current.page]
    theme = get-primary-info(store)
    style =
        background: theme.app.background
    syncing = 
        | store.current.refreshing => "syncing"
        | _ => ""
    react.create-element 'div', {}, children = 
        description store
        react.create-element 'div', { key: "content", style: style, className: "#{syncing} app app1470044321" }, children = 
            modal-control store, web3t
            confirmation-control store, web3t
            copy-message store, web3t
            header store, web3t
            current-page { store, web3t }