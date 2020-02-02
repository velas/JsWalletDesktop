require! {
    \react
    \../newseed-funcs.ls
    \../get-lang.ls
    \../get-primary-info.ls
}
# .newseed-1157174859
#     @import scheme
#     padding-top: 50px
#     width: 100%
#     height: $height
#     box-sizing: border-box
#     height: 100%
#     .title
#         color: #ebf6f8
#         font-size: 22px
#         margin-bottom: 20px
#     textarea
#         min-width: 250px
#         height: 70px
#         border-radius: 7px
#         resize: none
#         padding: 10px
#         font-size: 17px
#         border: 0
#         text-align: center
#         outline: none
#         &:focus
#             border-color: #248295
#     button
#         outline: none
#         width: auto
#         margin: 15px 5px 0
#         text-transform: uppercase
#         font-weight: 600
#         padding: 10px 6px
#         border: 0
#         cursor: pointer
#         background: #248295
#         border-radius: 7px
#         font-size: 12px
#         color: white
#         &:hover
#             background: #248295 - 20
#     .warning
#         padding: 15px;
#         border: 1px solid orange;
#         margin: 10px;
#         border-radius: 5px;
#         background: rgba(orange, 0.2)
#     .hint
#         color: #f2eeee
#         padding: 20px 38px
newseed = ({ store, web3t })->
    lang = get-lang store
    { generate-seed, change-seed, save, fix-issue, has-issue } = newseed-funcs store, web3t
    style = get-primary-info store
    text-style =
        color: style.app.text
    address-input=
        color: style.app.text
        background: style.app.wallet
    button-primary1-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text
        background: style.app.primary1
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    react.create-element 'div', { className: 'newseed newseed-1157174859' }, children = 
        react.create-element 'div', { style: text-style, className: 'title' }, ' ' + lang.new-seed-phrase ? 'New Seed Phrase'
        react.create-element 'textarea', { style: address-input, value: "#{store.current.seed-temp}", on-change: change-seed, placeholder: "#{lang.new-seed-placeholder ? 'Click Generate or Put Your Seed Phrase here'}" }
        react.create-element 'div', {}, children = 
            react.create-element 'button', { on-click: generate-seed, style: button-primary3-style, className: 'left' }, ' ' + lang.generate ? 'Generate' 
            react.create-element 'button', { on-click: save, style: button-primary1-style, className: 'right' }, ' ' + lang.save ? 'Save' 
        if has-issue!
            react.create-element 'div', { style: text-style, className: 'warning' }, children = 
                react.create-element 'div', {}, ' ' + lang.seed-warning
                react.create-element 'button', { on-click: fix-issue, className: 'center' }, ' ' + lang.fix-issue
        react.create-element 'div', { style: text-style, className: 'hint' }, ' ' + lang.new-seed-warning ? 'The phrase is stored securely on your computer. Do not transfer it to a third party and keep the duplicate in a safe place.'
focus = ({ store }, cb)->
    <- set-timeout _, 1000
    textarea = store.root.query-selector '.newseed textarea'
    textarea.focus!
    cb null
newseed.focus = focus
module.exports = newseed