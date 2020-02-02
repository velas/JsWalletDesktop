require! {
    \react
    \qrcode.react : QRCode
    \../get-primary-info.ls
    \../get-lang.ls
}
# .receive185631215
#     text-align: center
#     .receive-body
#         padding: 20px 20px 10px
#         canvas
#             width: 50%
#             height: auto
#             padding: 10px
#             background: #fff
#             border-radius: 7px
qrcode = (store, wallet)->
    info = get-primary-info store
    return null if not wallet?address?
    #console.log \QRCode , { wallet?address }
    bgColor = info.background
    fgColor = info.color
    react.create-element QRCode, { value: "#{wallet.address}", size: "256", bgColor: bgColor, fgColor: fgColor }
module.exports = (store, wallet)->
    react.create-element 'div', { className: 'receive receive185631215' }, children = 
        react.create-element 'div', { className: 'receive-body' }, children = 
            qrcode store, wallet