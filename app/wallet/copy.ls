require! {
    \react
    \./icons.ls
}
# .copy-1464154875
#     height: 16px
#     cursor: pointer
module.exports = (store)->
    react.create-element 'img', { src: "#{icons.copy-icon}", className: 'copy copy-1464154875' }