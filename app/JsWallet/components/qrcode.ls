require! {
    \react
    \qrcode.react : QRCode
    \../get-primary-info.ls
}
# .qrcode-37996170
#     z-index: 9999999
module.exports = ({ store, address })->
    info = get-primary-info store
    return null if not address?
    fgColor = \#FFF
    bgColor = \#000
    react.create-element 'div', { className: 'qrcode qrcode-37996170' }, children = 
        react.create-element QRCode, { value: "#{address}", size: 256, bgColor: bgColor, fgColor: fgColor }