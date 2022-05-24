require! {
    \react
    \../components/qrcode.ls
    \../get-primary-info.ls
}
# .hovered-address-239788434
#     @import scheme
#     position: fixed
#     bottom: 10px
#     left: 10px
#     z-index: 99999
#     color: white
#     width: 300px
#     background: transparent
#     background: #31335f
#     border-radius: calc(var(--border-btn) * 2)
#     padding: 10px 10px 15px
#     box-shadow: 14px 7px 13px #0000001f, -16px 20px 13px #00000024
#     canvas
#         height: 300px
#         width: 300px
#         padding: 0 10px 10px 10px
#         margin-bottom: -5px
#     >.text
#         font-size: 11px
#         padding: 10px 0px
#     >.qr-border
#         padding-top: 10px
#         background: white
module.exports = ({ store })->
    return null if not store.current.try-copy?
    style = get-primary-info store
    copy-style=
        color: style.app.text
        background: style.app.bg-primary-light
        border: "1px solid #{style.app.border}"
    react.create-element 'div', { style: copy-style, className: 'hovered-address hovered-address-239788434' }, children = 
        react.create-element 'div', { className: 'text' }, ' ' + store.current.try-copy
        react.create-element 'div', { className: 'qr-border' }, children = 
            qrcode { store, address: store.current.try-copy } 