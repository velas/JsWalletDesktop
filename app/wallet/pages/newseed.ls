require! {
    \react
    \../newseed-funcs.ls
    \../get-lang.ls
    \../get-primary-info.ls
    \prelude-ls : { map, sort-by }
    \../navigate.ls
    \../icons.ls
}
# .newseed-2137724749
#     @import scheme
#     padding-top: 50px
#     width: 100%
#     height: $height
#     box-sizing: border-box
#     height: 100%
#     .button-container
#         width: 100%
#         position: relative
#         margin: 0 auto
#     .title
#         color: #ebf6f8
#         font-size: 22px
#         margin-bottom: 20px
#         span
#             width: 10px
#             height: 10px
#             background: rgb(118, 81, 174)
#             color: white
#             padding: 3px
#             line-height: 11px
#             border-radius: 50px
#             position: absolute
#             font-size: 10px
#             display: inline-block
#             cursor: help
#             margin-left: 5px
#             filter: brightness(1.5)
#             z-index: 2
#     .no-copy
#         z-index: 1
#         height: 100%
#         top: 0
#         width: 100%
#         position: absolute
#     textarea
#         min-width: 250px
#         height: 70px
#         border-radius: $border
#         resize: none
#         padding: 10px
#         font-size: 17px
#         border: 0
#         text-align: center
#         outline: none
#         &:focus
#             border-color: #248295
#     button, a
#         outline: none
#         width: auto
#         margin: 5px 5px 0
#         text-transform: uppercase
#         font-weight: bold
#         min-width: 80px
#         width: auto
#         height: 36px
#         line-height: 36px
#         display: inline-block
#         padding: 0px 6px
#         text-decoration: none
#         border: 0 !important
#         cursor: pointer
#         background: #248295
#         border-radius: $border
#         font-size: 10px
#         white-space: nowrap
#         text-overflow: ellipsis
#         overflow: hidden
#         color: white
#         position: relative
#         z-index: 2
#         &.save
#             display: none
#             &.none
#                 display: inline-block
#         &.doc
#             &.none
#                 display: none
#         &:hover
#             background: #248295 - 20
#     .warning
#         padding: 10px 10px
#         border: 1px solid orange
#         margin: 20px auto 0
#         max-width: 250px
#         border-radius: $border
#         font-size: 13px
#         background: rgba(orange, 0.2)
#     .hint
#         color: #f2eeee
#         padding: 20px 0
#         max-width: 270px
#         font-size: 13px
#         margin: 0 auto
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
#             input:focus ~ span.effect
#                 background: rgb(60, 213, 175) !important
#                 color: #190841 !important
#                 transition: all .5s
#                 animation: pulse_effect 1.5s linear
#                 transform-origin: 50% 50%
#             @keyframes pulse_effect
#                 0%
#                     transform: scale(1)
#                 50%
#                     transform: scale(1.3)
#                 100%
#                     transform: scale(1)
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
#                 &.effect    
#                     &:last-child
#                         background: #7651ae
#                         color: #fff
#                         display: inline-block
#                         padding: 4px
#                         float: left
#                         border-radius: 50px
#                         width: 11px
#                         height: 10px
#                         font-size: 10px
#                         line-height: 11px
#                         @media(max-width: 500px)
#                             margin-right: 5px
#     .about
#         border-radius: $border
#         padding: 10px
#         margin-bottom: 20px
#         max-width: 250px
#         font-style: italic
restore-words = (store, web3t, item)-->
    style = get-primary-info store
    seed-style=
        border: "1px solid #{style.app.primaryOpct}"
        color: style.app.text
    index = store.current.seed-words.index-of(item) + 1
    change-part = (it)->
        item.part = it.target.value    #.to-lower-case!.trim!.replace(/[^a-z]/, '')
    react.create-element 'div', { style: seed-style, className: 'word' }, children = 
        react.create-element 'input', { type: 'text', value: "#{item.part}", placeholder: "Enter #{index} word", on-change: change-part }
        react.create-element 'span', { className: 'effect' }, ' ' + index
create-word = (store, words, word)-->
    index = words.index-of(word) + 1
    style = get-primary-info store
    seed-style=
        border: "1px solid #{style.app.primaryOpct}"
        color: style.app.text
    react.create-element 'div', { style: seed-style, className: 'word' }, children = 
        react.create-element 'span', {}, ' ' + index
        react.create-element 'span', {}, ' ' + word.part
random = ->
    Math.random!
newseed = ({ store, web3t })->
    lang = get-lang store
    { save, fix-issue, has-issue, next } = newseed-funcs store, web3t
    style = get-primary-info store
    text-style =
        color: style.app.text
    disable-copy-style =
        | store.current.seed-generated => \none
        | _ => ""
    address-input=
        color: style.app.text
        background: style.app.wallet
        user-select: disable-copy-style
    about-field=
        color: style.app.text
        background: style.app.wallet
    button-primary1-style=
        border: "1px solid #{style.app.primary1}"
        color: style.app.text
        background: style.app.primary1
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    seed-style=
        border: "1px solid #{style.app.primaryOpct}"
        color: style.app.text
    btn-icon =
        filter: style.app.btn-icon
    about-bg=
        background: style.app.wallet
    newseed-style=
        # filter: style.app.nothingIcon
        margin-bottom: "10px"
        width: "120px"
    disabled = store.current.seed-generated
    disable-copy = 
        | store.current.seed-generated => "return false"
        | _ => ""
    about = ->
        store.seed.about = not store.seed.about
    print = ->
        store.current.hide-btn = not store.current.hide-btn
        window.open('https://drive.google.com/file/d/1mE53JDe2722D0BY2Mi7qIcXUFtwqSZFx/view')
    hide-class =
        if store.current.hide-btn then \none else \ ""
    back = ->
        #navigate store, web3t, \:init
        store.current.page = 'newseedrestore'
    back2 = ->
        store.current.page = 'chooseinit'
    react.create-element 'div', { className: 'newseed newseed-2137724749' }, children = 
        react.create-element 'img', { style: newseed-style, src: "#{icons.newseed}" }
        if store.current.seed-generated
            react.create-element 'div', { style: text-style, className: 'title' }, children = 
                """ #{lang.new-seed-phrase}"""
                react.create-element 'span', { style: about-bg, on-click: about, className: 'about-btn' }, ' ?'
        else
            react.create-element 'div', { style: text-style, className: 'title' }, children = 
                """ #{lang.your-seed-phrase}"""
                react.create-element 'span', { style: about-bg, on-click: about, className: 'about-btn' }, ' ?'
        if store.seed.about
            react.create-element 'div', { style: about-field, className: 'about hint' }, ' ' + lang.about-seed ? 'Seed phrase is a list of 12 words that store all the information needed to restore a crypto wallet. A wallet usually generates a mnemonic backup phrase itself so that the user writes it on paper.' + ' '
        if store.current.seed-generated
            react.create-element 'div', { className: 'words' }, children = 
                store.current.seed-words |> map create-word store, store.current.seed-words
        else
            react.create-element 'div', { className: 'words' }, children = 
                store.current.seed-words |> sort-by (.index) |> map restore-words store, web3t
        if store.current.seed-generated    
            react.create-element 'div', { className: 'button-container' }, children = 
                react.create-element 'button', { on-click: back2, style: button-primary3-style, className: 'right' }, children = 
                    react.create-element 'img', { src: "#{icons.arrow-left}", style: btn-icon, className: 'icon-svg' }
                    """ #{lang.back ? 'Back' }"""
                react.create-element 'button', { on-click: next, style: button-primary1-style, className: "#{hide-class} right save" }, children = 
                    react.create-element 'img', { src: "#{icons.save}", className: 'icon-svg' }
                    """ #{lang.next ? 'Next' }"""
                react.create-element 'button', { on-click: print, style: button-primary2-style, className: "#{hide-class} right doc" }, children = 
                    react.create-element 'img', { src: "#{icons.print}", className: 'icon-svg' }
                    """ #{lang.print ? 'Print' }"""
        else    
            react.create-element 'div', {}, children = 
                react.create-element 'button', { on-click: back, style: button-primary3-style, className: 'right' }, children = 
                    react.create-element 'img', { src: "#{icons.arrow-left}", style: btn-icon, className: 'icon-svg' }
                    """ #{lang.back ? 'Back' }"""
                react.create-element 'button', { on-click: save, style: button-primary1-style, className: 'right' }, children = 
                    react.create-element 'img', { src: "#{icons.save}", className: 'icon-svg' }
                    """ #{lang.next ? 'Next' }"""
        if has-issue!
            react.create-element 'div', { style: text-style, className: 'warning' }, children = 
                react.create-element 'div', {}, ' ' + lang.seed-warning
                react.create-element 'button', { on-click: fix-issue, style: button-primary3-style, className: 'center' }, children = 
                    react.create-element 'span', {}, children = 
                        react.create-element 'img', { src: "#{icons.warning}", style: btn-icon, className: 'icon-svg' }
                        """ #{lang.fix-issue}"""
        react.create-element 'div', { style: text-style, className: 'hint' }, ' ' + lang.new-seed-warning ? 'It will be reliable to write down the phrase on paper. Do not transfer it to a third party and store it in a safe place.'
focus = ({ store }, cb)->
    console.log \focus
    <- set-timeout _, 1000
    #textarea = store.root.query-selector '.newseed textarea'
    #textarea.focus!
    cb null
newseed.focus = focus
module.exports = newseed