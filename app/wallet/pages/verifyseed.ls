require! {
    \react
    \../newseed-funcs.ls
    \../get-lang.ls
    \../get-primary-info.ls
    \../icons.ls
    \prelude-ls : { map, find, foldl, unique, take }
}
# verification seed
# .newseed1263756171
#     @import scheme
#     padding-top: 50px
#     width: 100%
#     height: $height
#     box-sizing: border-box
#     height: 100%
#     .words
#         max-width: 500px
#         display: inline-block
#         margin-bottom: 20px
#         .word
#             display: inline-block
#             color: #fff
#             padding: 10px
#             margin: 5px
#             font-size: 14px
#             min-width: 25%
#             border-radius: 40px
#             -ms-user-select: none
#             cursor: default
#             @media(max-width: 500px)
#                 min-width: 35%
#             >input
#                 background: transparent
#                 border: 0
#                 display: inline-block
#                 color: #fff
#                 padding: 0
#                 width: 100px
#                 margin: 0
#                 font-size: 14px
#                 text-align: center
#                 cursor: auto
#             span
#                 &:first-child
#                     background: #7651ae
#                     color: #fff
#                     display: inline-block
#                     padding: 4px
#                     float: left
#                     border-radius: 50px
#                     width: 11px
#                     height: 10px
#                     font-size: 10px
#                     line-height: 11px
#                     @media(max-width: 500px)
#                         margin-right: 5px
#     .title
#         color: #ebf6f8
#         font-size: 22px
#         margin-bottom: 20px
#     input
#         border-radius: $border
#         resize: none
#         font-size: 13px
#         border: 0
#         text-align: center
#         outline: none
#         &:focus
#             border-color: #248295
#     button
#         outline: none
#         width: auto
#         min-width: 180px
#         height: 36px
#         margin: 15px 5px 0
#         text-transform: uppercase
#         font-weight: 600
#         padding: 0px 6px
#         border: 0
#         cursor: pointer
#         background: #248295
#         border-radius: $border
#         font-size: 10px
#         color: white
#         text-overflow: ellipsis
#         overflow: hidden
#         white-space: nowrap
#         &:hover
#             background: #248295 - 20
#     .warning
#         padding: 10px 0
#         border: 1px solid orange
#         margin: 20px auto 0
#         max-width: 180px
#         border-radius: $border
#         font-size: 13px
#         background: rgba(orange, 0.2)
#     .hint
#         color: #f2eeee
#         padding: 20px 0
#         max-width: 270px
#         font-size: 13px
#         margin: 0 auto
newseed = ({ store, web3t })->
    lang = get-lang store
    { next, save } = newseed-funcs store, web3t
    style = get-primary-info store
    text-style =
        color: style.app.text
    address-input=
        color: style.app.text
        background: "transparent"
    button-primary1-style=
        border: "1px solid #{style.app.primary1}"
        color: style.app.text
        background: style.app.primary1
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    btn-icon =
        filter: style.app.btn-icon
    seed-style=
        border: "1px solid #{style.app.primaryOpct}"
        color: style.app.text
    newseed-style=
        # filter: style.app.nothingIcon
        margin-bottom: "10px"
        width: "100px"
    wrong-word = (item)->
        store.current.seed-words[item.index].part isnt item.part
    verify-seed = ->
        wrong =
            store.current.verify-seed-indexes |> find wrong-word
        return store.current.verify-seed-error = yes if wrong?
        save!
    back = ->
        store.current.page = \newseed
    build-verify-seed = (store, item)-->
        enter-confirm = ->
            item.part = it.target.value
        react.create-element 'div', { style: seed-style, className: 'word' }, children = 
            react.create-element 'input', { style: address-input, key: "enter_#{item.index}_word", value: "#{item.part}", on-change: enter-confirm, placeholder: "Enter #{item.index + 1} word" }
    react.create-element 'div', { className: 'newseed newseed1263756171' }, children = 
        react.create-element 'img', { style: newseed-style, src: "#{icons.verifyseed}" }
        react.create-element 'div', { style: text-style, className: 'title' }, ' ' + lang.verify-seed-phrase ? 'Verify Seed Phrase'
        react.create-element 'div', { style: text-style, className: 'hint' }, ' ' + lang.phrase-word ? 'Please enter the 4th word to confirm that you wrote down the seed phrase'
        react.create-element 'div', { className: 'words' }, children = 
            store.current.verify-seed-indexes |> map build-verify-seed store
        react.create-element 'div', {}, children = 
            react.create-element 'button', { style: button-primary1-style, on-click: verify-seed, className: 'right' }, children = 
                react.create-element 'span', {}, children = 
                    react.create-element 'img', { src: "#{icons.confirm}", className: 'icon-svg' }
                    """ #{lang.confirm-seed ? 'Confirm' }"""
        react.create-element 'div', {}, children = 
            react.create-element 'button', { style: button-primary3-style, on-click: back, className: 'right' }, children = 
                react.create-element 'span', {}, children = 
                    react.create-element 'img', { src: "#{icons.arrow-left}", style: btn-icon, className: 'icon-svg' }
                    """ #{lang.back ? 'Back' }"""
        if store.current.verify-seed-error is yes
            react.create-element 'div', { style: text-style, className: 'warning' }, children = 
                react.create-element 'div', {}, ' ' + lang.words-are-not-match ? 'Words are not match' 
random = ->
    Math.floor((Math.random! * 10) + 1)
init = ({ store }, cb)->
    store.current.verify-seed-indexes =
        [0 to 20]
            |> map random
            |> unique
            |> take 3
            |> map -> index: it, part: ''
    cb null
focus = ({ store }, cb)->
    cb null
newseed.focus = focus
newseed.init = init
module.exports = newseed