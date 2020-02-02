require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
}
# .confirmation-200887596
#     position: absolute
#     z-index: 999999
#     height: 100vh
#     top: 0
#     left: 0
#     width: 100%
#     box-sizing: border-box
#     background: rgba(black, 0.8)
#     >.confirmation-body
#         background: white
#         text-align: center
#         >.header
#             padding: 15px 0 0
#             font-size: 17px
#             font-weight: bold
#             margin-bottom: 10px
#         >.text
#             padding: 10px
#             input
#                 border-radius: 5px
#         >.buttons
#             text-align: center
#             >.button
#                 display: inline-block
#                 cursor: pointer
#                 width: auto
#                 font-weight: 300
#                 font-size: 14px
#                 border-radius: 5px
#                 border: 1px solid #CCC
#                 margin: 15px 5px
#                 padding: 5px 10px
#                 line-height: 14px
confirmation-modal = (store)->
    return null if typeof! store.current.confirmation isnt \String
    confirm = ->
        store.current.confirmation = yes
        state.callback yes if typeof! state.callback is \Function
        state.callback = null
    cancel = ->
        store.current.confirmation = no
        state.callback no if typeof! state.callback is \Function
        state.callback = null
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        color: style.app.text
    confirmation-style2 =
        color: style.app.text
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        color: style.app.text
    lang = get-lang store
    react.create-element 'div', { className: 'confirmation confirmation-200887596' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: confirmation-style, className: 'header' }, ' ' + lang.confirmation
            react.create-element 'div', { style: confirmation-style2, className: 'text' }, ' ' + store.current.confirmation
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'div', { on-click: confirm, style: button-style, className: 'button' }, ' ' + lang.confirm
                react.create-element 'div', { on-click: cancel, style: button-style, className: 'button' }, ' ' + lang.cancel
prompt-modal = (store)->
    return null if typeof! store.current.prompt isnt \String
    confirm = ->
        store.current.prompt = yes
        state.callback store.current.prompt-answer if typeof! state.callback is \Function
        state.callback = null
        store.current.prompt-answer = ""
    cancel = ->
        store.current.prompt = no
        state.callback null if typeof! state.callback is \Function
        state.callback = null
        store.current.prompt-answer = ""
    change-input = (e)->
        store.current.prompt-answer = e.target.value
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        color: style.app.text
    input-style =
        background: style.app.wallet
        color: style.app.text
        border: "0"
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        color: style.app.text
    lang = get-lang store
    react.create-element 'div', { className: 'confirmation confirmation-200887596' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: style=confirmation-style, className: 'header' }, ' ' + lang.confirmation
            react.create-element 'div', { style: style=confirmation-style, className: 'text' }, ' ' + store.current.prompt
            react.create-element 'div', {}, children = 
                react.create-element 'input', { on-change: change-input, value: "#{store.current.prompt-answer}", style: input-style }
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'div', { on-click: confirm, style: button-style, className: 'button' }, ' ' + lang.confirm
                react.create-element 'div', { on-click: cancel, style: button-style, className: 'button' }, ' ' + lang.cancel
export confirmation-control = (store)->
    react.create-element 'div', {}, children = 
        confirmation-modal store
        prompt-modal store
state=
    callback: null
export confirm = (store, text, cb)->
    store.current.confirmation = text
    state.callback = cb
export prompt = (store, text, cb)->
    store.current.prompt = text
    state.callback = cb