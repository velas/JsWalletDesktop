require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../icons.ls 
    \../components/text-field.ls
    \../components/button.ls
    \../round5edit.ls
    \../components/amount-field.ls
    \prelude-ls : { find, map }
    \../math.ls : { minus, div, plus, times }
}
# .confirmation-450558461
#     backdrop-filter: blur(5px)
#     @-webkit-keyframes appear
#         from
#             opacity: 0
#         to
#             opacity: 1
#     @-moz-keyframes appear
#         from
#             opacity: 0
#         to
#             opacity: 1
#     @-o-keyframes appear
#         from
#             opacity: 0
#         to
#             opacity: 1
#     @keyframes appear
#         from
#             opacity: 0
#         to
#             opacity: 1
#     @import scheme
#     position: fixed
#     z-index: 99999999
#     height: 100vh
#     top: 0
#     left: 0
#     width: 100%
#     box-sizing: border-box
#     background: rgba(black, 0.7)
#     display: flex
#     justify-content: center
#     align-items: center
#     animation: appear .1s ease-in
#     .token-select
#         max-width: 300px
#         margin: auto
#         input
#             width: 80% !important
#         .tokens-drop
#             ul
#                 li
#                     transition: all .5s
#                     margin: 3px
#                     opacity: 0.5
#                     padding: 2px 10px 10px !important
#                     &.active
#                         opacity: 1
#                         background: rgb(5, 6, 31) none repeat scroll 0% 0%
#                     &:hover
#                         opacity: 1
#                         background: rgb(5, 6, 31) none repeat scroll 0% 0%
#     .icon-svg-apply
#         position: relative
#         height: 12px
#         top: 2px
#         margin-right: 3px
#         filter: invert(23%) sepia(99%) saturate(1747%) hue-rotate(430deg) brightness(58%) contrast(175%)
#     .icon-svg-cancel
#         position: relative
#         height: 12px
#         top: 2px
#         margin-right: 3px
#         filter: invert(22%) sepia(65%) saturate(7127%) hue-rotate(694deg) brightness(94%) contrast(115%)
#     >.confirmation-body
#         background: white
#         text-align: center
#         position: fixed
#         width: 100%
#         margin: 10px
#         border-radius: var(--border-btn)
#         width: calc(100% - 20px)
#         max-width: 550px
#         box-shadow: 7px 10px 13px #0000001f, -16px 20px 13px #00000024
#         input
#             border-radius: var(--border-btn)
#             height: 36px
#             width: 90px
#             line-height: 36px
#             font-size: 13px
#             outline: none
#         >.header
#             padding: 15px 10px
#             font-size: 17px
#             font-weight: bold
#             margin-bottom: 10px
#             border-radius: 10px 10px 0 0
#         >.text
#             padding: 10px
#             input
#                 border-radius: var(--border-btn)
#         >.buttons
#             text-align: center
#             >.button
#                 display: inline-block
#                 cursor: pointer
#                 height: 36px
#                 width: 120px
#                 font-weight: bold
#                 font-size: 10px
#                 text-transform: uppercase
#                 border-radius: var(--border-btn)
#                 border: 1px solid #CCC
#                 margin: 15px 5px
#                 padding: 0px 6px
#                 background: transparent
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 white-space: nowrap
#                 .apply
#                     vertical-align: middle
#                     margin-right: 2px
#                 .cancel
#                     vertical-align: middle
#                     margin-right: 2px
#     .pin-input
#         .input-area
#             max-width: 200px;
#             margin: auto;
#         input
#             text-align: left
#             font-size: 12px
#             display: inline-block
#             height: 36px
#             background: transparent
#             border: 0
#             border-radius: var(--border-btn)
#             outline: none
#             width: 130px
#             margin-bottom: 5px
#             letter-spacing: 5px
#             padding: 7px 25px 7px 7px
#             box-sizing: border-box
#             &:focus
#                 border-color: #248295
#             &:placeholder
#                 color: $primary + 40
#             @media screen and (max-width: 800px)
#                 padding: 7px 0
#                 text-align: center
alert-modal = (store)->
    return null if typeof! store.current.alert isnt \String
    cancel = ->
        store.current.alert = no
        callback = state.callback
        state.callback = null
        callback no if typeof! callback is \Function
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
    confirmation-style2 =
        color: style.app.text
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    text = store.current.alert
    text-rows = text.split("\n")
    build-text = (txt)->
        react.create-element 'div', { className: 'text-block' }, ' ' + txt
    react.create-element 'div', { className: 'confirmation confirmation-1193976920' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: confirmation-style, className: 'header' }, ' Alert'
            react.create-element 'div', { style: confirmation-style2, className: 'text' }, ' '
                text-rows |> map build-text
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: cancel, style: button-style, id: "alert-close", className: 'button' }, children = 
                    react.create-element 'span', { className: 'cancel' }, children = 
                        react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg-cancel' }
                        """ #{lang.cancel}"""
notification-modal = (store)->
    return null if typeof! store.current.notification isnt \String
    cancel = ->
        store.current.notification = no
        callback = state.callback
        state.callback = null
        callback no if typeof! callback is \Function
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
    confirmation-style2 =
        color: style.app.text
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    react.create-element 'div', { className: 'confirmation confirmation-1193976920' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: confirmation-style, className: 'header' }, ' Alert'
            react.create-element 'div', { style: confirmation-style2, className: 'text' }, ' ' + store.current.notification
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: cancel, style: button-style, id: "notification-close", className: 'button' }, children = 
                    react.create-element 'span', { className: 'cancel' }, children = 
                        react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-apply' }
                        """ Ok"""
confirmation-modal = (store)->
    return null if typeof! store.current.confirmation isnt \String
    confirm = ->
        store.current.confirmation = yes
        callback = state.callback
        state.callback = null
        callback yes if typeof! callback is \Function
    cancel = ->
        store.current.confirmation = no
        callback = state.callback
        state.callback = null
        callback no if typeof! callback is \Function
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
    confirmation-style2 =
        color: style.app.text
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    react.create-element 'div', { className: 'confirmation confirmation-1193976920' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: confirmation-style, className: 'header' }, ' ' + lang.confirmation
            react.create-element 'div', { style: confirmation-style2, className: 'text' }, ' ' + store.current.confirmation
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: confirm, style: button-style, id: "confirmation-confirm", className: 'button' }, children = 
                    react.create-element 'span', { className: 'apply' }, children = 
                        react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-apply' }
                        """ #{lang.confirm}"""
                react.create-element 'button', { on-click: cancel, style: button-style, id: "confirmation-close", className: 'button' }, children = 
                    react.create-element 'span', { className: 'cancel' }, children = 
                        react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg-cancel' }
                        """ #{lang.cancel}"""
prompt-modal = (store)->
    return null if typeof! store.current.prompt isnt \String
    confirm = ->
        store.current.prompt = yes
        callback = state.callback
        state.callback = null
        prompt-answer = store.current.prompt-answer
        store.current.prompt-answer = ""
        callback prompt-answer if typeof! callback is \Function
    cancel = ->
        store.current.prompt = no
        callback = state.callback
        state.callback = null
        callback null if typeof! callback is \Function
        store.current.prompt-answer = ""
    change-input = (e)->
        store.current.prompt-answer = e.target.value
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
    input-style =
        background: style.app.input
        color: style.app.text
        border: "0"
        text-align: "center"
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    react.create-element 'div', { className: 'confirmation confirmation-1193976920' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: style=confirmation-style, className: 'header' }, ' ' + lang.confirmation
            react.create-element 'div', { style: style=confirmation-style, className: 'text' }, ' ' + store.current.prompt
            react.create-element 'div', {}, children = 
                react.create-element 'input', { on-change: change-input, value: "#{store.current.prompt-answer}", style: input-style, id: "prompt-input" }
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: confirm, style: button-style, id: "prompt-confirm", className: 'button' }, children = 
                    react.create-element 'span', { className: 'apply' }, children = 
                        react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-apply' }
                        """ #{lang.confirm}"""
                react.create-element 'button', { on-click: cancel, style: button-style, id: "prompt-close", className: 'button' }, children = 
                    react.create-element 'span', { className: 'cancel' }, children = 
                        react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg-cancel' }
                        """ #{lang.cancel}"""
prompt-modal2 = (store)->
    return null if typeof! store.current.prompt2 isnt \String
    wallet = store.current.account.wallets |> find (-> it.coin.token is \vlx_native)
    confirm = ->
        return if not store.current.prompt-answer? or store.current.prompt-answer is 0 or store.current.prompt-answer is ""
        store.current.prompt2 = yes
        callback = state.callback
        state.callback = null
        prompt-answer = store.current.prompt-answer
        store.current.prompt-answer = ""
        callback prompt-answer if typeof! callback is \Function
    cancel = ->
        store.current.prompt2 = no
        callback = state.callback
        state.callback = null
        callback null if typeof! callback is \Function
        store.current.prompt-answer = ""
    amount-change = (e)->
        balance = (wallet?balance ? 1)
        max-amount = Math.floor(balance `minus` 1)
        amount =
            | e.target.value > max-amount => max-amount
            | isNaN(e.target.value) => 0
            | _ => e.target.value
        store.current.prompt-answer = amount
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
    input-style =
        background: style.app.input
        color: style.app.text
        border: "0"
    input-holder-style = 
        max-width: '250px'
        margin: 'auto'
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
        cursor: "pointer"
    max-amount-container =
        text-align: "left"
    use-max-amount = !->
        store.current.prompt-answer = 
            | not wallet? => 0
            | _ => Math.floor(wallet.balance `minus` 1)
    react.create-element 'div', { className: 'confirmation confirmation-1193976920' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: style=confirmation-style, className: 'header' }, store.current.prompt2
            react.create-element 'div', { style: style=confirmation-style, className: 'text' }
            react.create-element 'div', { style: input-holder-style }, children = 
                amount-field { store, value: "#{round5edit store.current.prompt-answer}", on-change: amount-change, placeholder="0", id="prompt-input", token: "vlx_native" }
                react.create-element 'div', { style: max-amount-container, className: 'max-amount' }, children = 
                    react.create-element 'button', { on-click: use-max-amount, style: button-primary3-style, type: "button", id: "send-max", className: 'send-all' }, ' ' + lang.use-max
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: confirm, style: button-style, id: "prompt-confirm", className: 'button' }, children = 
                    react.create-element 'span', { className: 'apply' }, children = 
                        react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-apply' }
                        """ #{lang.confirm}"""
                react.create-element 'button', { on-click: cancel, style: button-style, id: "prompt-close", className: 'button' }, children = 
                    react.create-element 'span', { className: 'cancel' }, children = 
                        react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg-cancel' }
                        """ #{lang.cancel}"""
prompt-modal3 = (store)->
    return null if typeof! store.current.prompt3 isnt \String
    console.log "prompt modal split" 
    chosenAccount = store.staking.chosenAccount
    rent = chosenAccount.rent
    active_stake = chosenAccount.active_stake `div` (10^9)
    inactive_stake = chosenAccount.inactive_stake `div` (10^9)
    balanceRaw = chosenAccount.balanceRaw `div` (10^9)
    min_stake = "1"
    confirm = ->
        return if not store.current.prompt-answer? or +store.current.prompt-answer is 0 or store.current.prompt-answer is ""
        store.current.prompt3 = yes
        callback = state.callback
        state.callback = null
        prompt-answer = store.current.prompt-answer
        store.current.prompt-answer = ""
        callback prompt-answer if typeof! callback is \Function
    cancel = ->
        store.current.prompt3 = no
        callback = state.callback
        state.callback = null
        callback null if typeof! callback is \Function
        store.current.prompt-answer = ""
    amount-change = (e)->
        balance = chosenAccount.balanceRaw `div` (10^9)      
        max-amount = Math.floor(balance `minus` min_stake)
        amount =
            | e.target.value > max-amount => max-amount
            | _ => e.target.value
        store.current.prompt-answer = amount
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
    input-style =
        background: style.app.input
        color: style.app.text
        border: "0"
    input-holder-style = 
        max-width: '250px'
        margin: 'auto'
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
        cursor: "pointer"
    max-amount-container =
        text-align: "left"
    use-max-amount = !->
        store.current.prompt-answer = 
            | not chosenAccount? => 0
            | _ => balanceRaw `minus` active_stake `minus` min_stake
    react.create-element 'div', { className: 'confirmation confirmation-1193976920' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: style=confirmation-style, className: 'header' }, store.current.prompt3
            react.create-element 'div', { style: style=confirmation-style, className: 'text' }
            react.create-element 'div', { style: input-holder-style }, children = 
                amount-field { store, token: "vlx_native", value: "#{round5edit store.current.prompt-answer}", on-change: amount-change, placeholder="0", id="prompt-input" }
                react.create-element 'div', { style: max-amount-container, className: 'max-amount' }, children = 
                    react.create-element 'button', { on-click: use-max-amount, style: button-primary3-style, type: "button", id: "send-max", className: 'send-all' }, ' ' + lang.use-max
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: confirm, style: button-style, id: "prompt-confirm", className: 'button' }, children = 
                    react.create-element 'span', { className: 'apply' }, children = 
                        react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-apply' }
                        """ #{lang.confirm}"""
                react.create-element 'button', { on-click: cancel, style: button-style, id: "prompt-close", className: 'button' }, children = 
                    react.create-element 'span', { className: 'cancel' }, children = 
                        react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg-cancel' }
                        """ #{lang.cancel}"""
data = {token: null}
prompt-choose-token-modal = (store)->
    return null if typeof! store.current.choose-token isnt \String
    text = store.current.choose-token
    confirm = ->
        on-focus!
        return if not store.current.prompt-answer? or store.current.prompt-answer is ""
        store.current.choose-token = yes
        callback = state.callback
        state.callback = null
        prompt-answer = store.current.prompt-answer
        store.current.prompt-answer = ""
        data.token = null
        callback prompt-answer if typeof! callback is \Function
    cancel = ->
        store.current.choose-token = no
        callback = state.callback
        state.callback = null
        data.token = null
        callback null if typeof! callback is \Function
        store.current.prompt-answer = ""
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
    input-style =
        background: style.app.input
        color: style.app.text
        border: "0"
    input-holder-style =
        max-width: '250px'
        margin: 'auto'
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
        cursor: "pointer"
    input-style =
        color: "black"
        border: "0"
        margin-right: "10px"
        height: "32px"
        text-align: "center"
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    imgStyle =
        width: "30px"
        position: "relative"
        top: "8px"
    optionStyle =
        list-style: "none"
        color: style.app.text
        padding: "5px 10px"
        cursor: "pointer"
        display: "inline-block"
    ul-style=
        padding: 0
        text-align: "left"
        max-width: "300px"
        margin: "20px auto"
    text-style =
        padding: "5px"
    build-item = (item)->
        {image, name, token} = item.coin
        on-click = ->
            store.current.prompt-answer = token
            data.token = name
        active-class = if store.current.prompt-answer is token then "active" else ""
        react.create-element 'li', { on-click: on-click, style: optionStyle, className: "#{active-class} lang-item" }, children = 
            react.create-element 'img', { src: "#{image}", style: imgStyle }
            react.create-element 'span', { style: text-style }, ' ' + name
    input-style = 
        position: "relative"
        text-align: "center"
        display: "flex"
        width: "100%"
    disabled-layout-style =
        z-index: 1 
        background: "transparent"
        position: "absolute"
        top: 0
        bottom: 0
        left: 0
        right: 0
        width: "62%"
    token-select-style = 
        max-width: "300px"
        margin: "auto"
    prompt-answer = store.current.prompt-answer ? null
    display-token = data.token ? ""
    btn-disabled = (typeof store.current.prompt-answer isnt "string") or (typeof store.current.prompt-answer is "string" and store.current.prompt-answer.length is 0)
    on-focus = ->
        (document.query-selector \.tokeninput).focus!
    react.create-element 'div', { className: 'confirmation confirmation-1193976920' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: style=confirmation-style, className: 'header' }, text
            react.create-element 'div', { style: style=confirmation-style, className: 'text' }
            react.create-element 'div', { className: 'token-select', style: token-select-style }, children = 
                react.create-element 'div', { style: input-style, className: 'input-holder' }, children = 
                    react.create-element 'div', { style: disabled-layout-style, className: 'dlayout' }
                    react.create-element 'input', { type: "text", value: "#{display-token}", style: inputStyle, className: 'tokeninput' }
                react.create-element 'div', { className: 'tokens-drop' }, children = 
                    react.create-element 'ul', { style: ul-style }, children = 
                        store.current.account.wallets
                            |> map build-item
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: confirm, style: button-style, id: "prompt-confirm", disabled: btn-disabled, className: 'button' }, children = 
                    react.create-element 'span', { className: 'apply' }, children = 
                        react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-apply' }
                        """ #{lang.confirm}"""
                react.create-element 'button', { on-click: cancel, style: button-style, id: "prompt-close", className: 'button' }, children = 
                    react.create-element 'span', { className: 'cancel' }, children = 
                        react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg-cancel' }
                        """ #{lang.cancel}"""
prompt-password-modal = (store)->
    return null if typeof! store.current.prompt-password isnt \String
    confirm = ->
        store.current.prompt-password = yes
        callback = state.callback
        state.callback = null
        prompt-answer = store.current.prompt-password-answer
        store.current.prompt-password-answer = ""
        callback prompt-answer if typeof! callback is \Function
    cancel = ->
        store.current.prompt-password = no
        callback = state.callback
        state.callback = null
        callback null if typeof! callback is \Function
        store.current.prompt-password-answer = ""
    change-input = (e)->
        store.current.prompt-password-answer = e.target.value
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
    input-style =
        background: style.app.input
        color: style.app.text
        border: "0"
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    catch-key = ->
        confirm! if it.key-code is 13
    focus-input = (ref)!->
        ref.focus! if ref?
    lang = get-lang store
    react.create-element 'div', { className: 'confirmation confirmation-1193976920' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: style=confirmation-style, className: 'header' }, ' ' + lang.confirmation
            react.create-element 'div', { style: style=confirmation-style, className: 'text' }, ' ' + store.current.prompt-password
            react.create-element 'div', { className: 'pin-input' }, children = 
                text-field { ref:(c)->{ a = focus-input(c)}, store, type: 'password' value: store.current.prompt-password-answer, placeholder: "", on-change: change-input , on-key-down: catch-key, id="prompt-input" }  
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: confirm, style: button-style, id: "prompt-confirm", className: 'button' }, children = 
                    react.create-element 'span', { className: 'apply' }, children = 
                        react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-apply' }
                        """ #{lang.confirm}"""
                react.create-element 'button', { on-click: cancel, style: button-style, id: "prompt-close", className: 'button' }, children = 
                    react.create-element 'span', { className: 'cancel' }, children = 
                        react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg-cancel' }
                        """ #{lang.cancel}"""
export confirmation-control = (store)->
    #for situation when we ask peen before action. this window should be hidden
    return null if store.current.page-pin?
    react.create-element 'div', {}, children = 
        prompt-modal3 store
        confirmation-modal store
        prompt-modal2 store
        prompt-modal store
        prompt-password-modal store
        alert-modal store
        notification-modal store
        prompt-choose-token-modal store
state=
    callback: null
export confirm = (store, text, cb)->
    store.current.confirmation = text
    state.callback = cb
export notify = (store, text, cb)->
    store.current.notification = text
    state.callback = cb
export prompt = (store, text, cb)->
    store.current.prompt = text
    state.callback = cb
export prompt2 = (store, text, cb)->
    store.current.prompt2 = text
    state.callback = cb
export prompt3 = (store, text, cb)->
    store.current.prompt3 = text
    state.callback = cb
export prompt-password = (store, text, cb)->
    store.current.prompt-password = text
    state.callback = cb
export prompt-choose-token = (store, text, cb)->
    store.current.choose-token = text
    store.current.prompt-answer = ''
    state.callback = cb
export alert = (store, text, cb)->
    store.current.alert = text
    state.callback = cb
window.confirm-state = state