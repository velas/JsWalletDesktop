require! {
    \react
    \../components/button.ls
    \../themes.ls
    \prelude-ls : { obj-to-pairs, map }
}
#monochrome dark_mojave
# .choose-theme-1045472592
#     @import scheme
#     >.theme
#         margin-bottom: 40px
#         display: inline-block
#         width: 200px
#         >.pallete
#             .box
#                 display: inline-block
#                 width: 40px
#                 height: 40px
#                 text-align: top
#                 box-sizing: border-box
#                 &:first-child
#                     border-top-left-radius: var(--border-btn)
#                     border-bottom-left-radius: var(--border-btn)
#                 &:last-child
#                     border-top-right-radius: var(--border-btn)
#                     border-bottom-right-radius: var(--border-btn)
create-button = (store, web3t)-> (text)->
    use = ->
        web3t.set-theme text
    background-style=
        background: themes[text].background
        background-color: themes[text].bgspare
    button-style=
        background: themes[text].primary1
        background-color: themes[text].primary1-spare
    control-style=
        background: themes[text].bg-primary-light
    react.create-element 'div', { className: 'theme' }, children = 
        react.create-element 'div', { className: 'pallete' }, children = 
            react.create-element 'div', { style: background-style, className: 'box' }
            react.create-element 'div', { style: button-style, className: 'box' }
            react.create-element 'div', { style: control-style, className: 'box' }
        button { store, text , on-click: use, icon: \show, type: \secondary }
module.exports = (store, web3t)->
    react.create-element 'div', { className: 'choose-theme choose-theme-1045472592' }, children = 
        themes |> obj-to-pairs |> map (-> it.0) |> map create-button store, web3t