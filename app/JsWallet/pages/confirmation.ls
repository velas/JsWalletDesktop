require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../icons.ls 
    \../components/text-field.ls
    \../components/button.ls
    \../copy.ls
    \../round5edit.ls
    \../round-human.ls
    \../components/amount-field.ls
    \prelude-ls : { find, map }
    \../math.ls : { minus, div, plus, times }
    #\copy-to-clipboard
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-pk-inform.ls
}
# .confirmation-145687721
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
#     @keyframes appearSixtyHeight
#         from
#             height: 0
#         to
#             height: 60px
#     @-o-keyframes appearSixtyHeight
#         from
#             height: 0
#         to
#             height: 60px
#     @-moz-keyframes appearSixtyHeight
#         from
#             height: 0
#         to
#             height: 60px
#     @-webkit-keyframes appearSixtyHeight
#         from
#             height: 0
#         to
#             height: 60px
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
#         max-width: 500px
#         margin: auto
#         input
#             width: 100% !important
#         .tokens-drop
#             ul
#                 li
#                     transition: all .5s
#                     margin: 3px
#                     opacity: .9
#                     padding: 2px 5px 5px !important
#                     flex: 1 0 15
#                     &.active
#                         opacity: 1
#                         background: rgb(5, 6, 31) none repeat scroll 0% 0%
#                     &:hover
#                         opacity: 1
#                         background: rgb(5, 6, 31) none repeat scroll 0% 0%
#                     img
#                         margin-bottom: 10px
#                     .token-name
#                         font-size: 15px
#                         opacity: 0.8
#                         line-height: normal
#                         display: block
#                         white-space: nowrap
#                         margin-bottom: 2px
#                     .network
#                         font-size: 12px
#                         opacity: 0.35
#                         line-height: normal
#                         display: block
#                         white-space: nowrap
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
    react.create-element 'div', { className: 'confirmation confirmation-145687721' }, children = 
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
    react.create-element 'div', { className: 'confirmation confirmation-145687721' }, children = 
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
    notification-style=
        font-size: "12px"
        opacity: "0.6"
    text-style=
        padding: "10px 10%"
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    react.create-element 'div', { className: 'confirmation confirmation-145687721' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: confirmation-style, className: 'header' }, ' ' + lang.confirmation
            react.create-element 'div', { style: confirmation-style2, className: 'text' }, ' ' + store.current.confirmation
            if store.current.send.swap is yes
                refer-to = store.current.send?chosen-network?refer-to
                minutes =
                    | refer-to in <[ eth vlx_erc20 ]> => 30
                    | refer-to in <[ bsc_vlx busd ]> => 10
                    | refer-to is \vlx_huobi => 10     
                    | _ => 0
                if minutes > 0 
                    text = "Depending on the network congestions it may take a long time to finish swap. Average confirmation time is ~#{minutes} min."  
                    react.create-element 'div', { style: notification-style, className: 'notification' }, children = 
                        react.create-element 'p', { style: text-style }, '  ' + text
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: confirm, style: button-style, id: "confirmation-confirm", className: 'button' }, children = 
                    react.create-element 'span', { className: 'apply' }, children = 
                        react.create-element 'img', { src: "#{icons.apply}", className: 'icon-svg-apply' }
                        """ #{lang.confirm}"""
                react.create-element 'button', { on-click: cancel, style: button-style, id: "confirmation-close", className: 'button' }, children = 
                    react.create-element 'span', { className: 'cancel' }, children = 
                        react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg-cancel' }
                        """ #{lang.cancel}"""
                        
swap-confirmation-modal = (store)->
    return null if typeof! store.current.swap-confirmation isnt \String
    confirm = ->
        store.current.swap-confirmation = yes
        callback = state.callback
        state.callback = null
        callback yes if typeof! callback is \Function
    cancel = ->
        store.current.swap-confirmation = no
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
    { amount-send, tokenFrom, amount-receive, tokenTo, bridgeFee, homeBridge, foreignBridge, fromNetwork, toNetwork} = store.current.swap-confirmation
    # "Please confirm that you would like to send #{amount-send} #{token-display} from #{walletGroup} to receive #{amount-receive} #{token-display} on #{receiverGroup}." 
    lang = get-lang store
    react.create-element 'div', { className: 'confirmation confirmation-145687721' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: confirmation-style, className: 'header' }, ' ' + lang.confirmation
            react.create-element 'div', { style: confirmation-style2, className: 'text' }, ' '
                react.create-element 'span', {}, ' Please confirm that you would like to send'
                react.create-element 'span', { className: 'amount' }, ' ' + amount-send + ' '
                react.create-element 'span', { className: 'token' }, ' ' + tokenFrom
                react.create-element 'span', {}, ' from'
                react.create-element 'span', { className: 'network' }, ' ' + fromNetwork
                react.create-element 'span', {}, ' to receive'
                react.create-element 'span', { className: 'amount' }, ' ' + amount-receive + ' '
                react.create-element 'span', { className: 'token' }, ' ' + tokenTo
                react.create-element 'span', {}, ' on'
                react.create-element 'span', { className: 'network' }, ' ' + toNetwork
                 
                
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
    react.create-element 'div', { className: 'confirmation confirmation-145687721' }, children = 
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
    react.create-element 'div', { className: 'confirmation confirmation-145687721' }, children = 
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
    react.create-element 'div', { className: 'confirmation confirmation-145687721' }, children = 
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
    wallets = store.current.account.wallets
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
    cancel = (e)->
        return if e.target.className isnt "confirmation-body" and e.target.className.index-of("confirmation") is -1 and e.target.id isnt \prompt-close
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
        width: "46%"
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        max-height: "80%"
        overflow: "hidden"
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
        flex: 1
        text-align: "center"
    ul-style=
        padding: 0
        text-align: "left"
        max-width: "500px"
        margin: "20px auto"
        display: "flex"
        flex-wrap: "wrap"
    text-style =
        padding: "5px"
    icon2-style =
        padding: "5px"
        position: "relative"
        top: "8px"
    build-item = (item)->
        {image, name, token} = item.coin
        wallet = wallets |> find (-> it.coin.token is token)
        return null if not wallet?
        #on-click = ->
            #store.current.prompt-answer = token
            #data.token = name
            #copy-to-clipboard wallet.private-key 
            #notify store, "Your Private KEY is copied into your clipboard", cb
        token-network = item?network?group
        active-class = if store.current.prompt-answer is token then "active" else ""
        token = (wallet?coin?name ? "").to-upper-case!
        react.create-element 'li', { style: optionStyle, className: "#{active-class} lang-item" }, children = 
            react.create-element 'div', {}, '        '
                react.create-element CopyToClipboard, { text: "#{wallet.private-key}", on-copy: copied-pk-inform(store), style: icon2-style }, children = 
                    react.create-element 'div', {}, children = 
                        react.create-element 'img', { src: "#{image}", style: imgStyle }
                        react.create-element 'span', { className: 'token-name' }, ' ' + name + ' '
                        react.create-element 'span', { className: 'network' }, ' ' + token-network + ' Network'
    input-style = 
        position: "relative"
        text-align: "center"
        display: "block"
        color: "rgb(70 70 70)"
        width: "100% !important"
    disabled-layout-style =
        z-index: 1 
        background: "transparent"
        position: "absolute"
        top: 0
        bottom: 0
        left: 0
        right: 0
        width: "100%"
    tokens-drop-style = 
        max-height: "300px"
        overflow: "scroll"
    button-section-style = 
        max-width: "500px"
        margin: "auto"
    prompt-answer = store.current.prompt-answer ? null
    display-token = data.token ? ""
    btn-disabled = (typeof store.current.prompt-answer isnt "string") or (typeof store.current.prompt-answer is "string" and store.current.prompt-answer.length is 0)
    on-focus = ->
        (document.query-selector \.tokeninput).focus!
    react.create-element 'div', { on-click: cancel, className: 'confirmation confirmation-145687721' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { style: style=confirmation-style, className: 'header' }, text
            react.create-element 'div', { className: 'token-select' }, children = 
                react.create-element 'div', { style: tokens-drop-style, className: 'tokens-drop' }, children = 
                    react.create-element 'ul', { style: ul-style }, children = 
                        store.current.account.wallets
                            |> map build-item
            react.create-element 'div', { style: button-section-style, className: 'buttons' }, children = 
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
    react.create-element 'div', { className: 'confirmation confirmation-145687721' }, children = 
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
                        
$network-details-modal = (store)->
    return null if store.current.current-network-details.show isnt yes 
    cancel = ->
        store.current.current-network-details.show = no
    
    style = get-primary-info store
    table-item-style-title=
        flex: 1
    confirmation-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        padding: "20px" 
        text-align: "left"
    close-button-style = 
        float: "right"
        padding: "5px"
        background: "transparent"
        border: "none"
        cursor: "pointer"
    table-item-style=
        display: "flex"
        flex-wrap: "wrap"
    button-style=
        color: style.app.text
    bridge-fee-style =
        color: "rgb(207, 149, 44)"
    confirmation=
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    { dailyLimit, homeFeePercent, minPerTx, maxPerTx, wallet } = store.current.current-network-details
    { name, nickname } = wallet?coin
    bridgeFeePercent = homeFeePercent `times` 100
    dailyLimit = round-human(dailyLimit, {decimals: 2})
    minPerTx   = round-human(minPerTx,   {decimals: 8})
    maxPerTx   = round-human(maxPerTx,   {decimals: 2})
    currency = (nickname ? "").to-upper-case!
      
    title = (name ? "").to-upper-case!
    react.create-element 'div', { className: 'confirmation confirmation-145687721' }, children = 
        react.create-element 'div', { style: confirmation, className: 'confirmation-body' }, children = 
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: cancel, style: close-button-style, id: "prompt-close" }, children = 
                    react.create-element 'span', { className: 'cancel' }, children = 
                        react.create-element 'img', { src: "#{icons.close}", className: 'icon-svg-cancel' }
            react.create-element 'div', { style: style=confirmation-style, className: 'header' }, ' ' + title
            react.create-element 'div', { style: style=confirmation-style, className: 'table' }, children = 
                react.create-element 'div', { style: table-item-style, className: 'table-item' }, children = 
                    react.create-element 'div', { style: table-item-style-title, className: 'title h5' }, ' Remaining Daily Quota '
                    react.create-element 'div', { className: 'value' }, children = 
                        """ #{dailyLimit}"""
                        """ #{currency}"""
                react.create-element 'div', { style: table-item-style, className: 'table-item' }, children = 
                    react.create-element 'div', { style: table-item-style-title, className: 'title h5' }, ' Maximum Amount Per Transaction'
                    react.create-element 'div', { className: 'value' }, children = 
                        """ #{maxPerTx}"""
                        """ #{currency}"""
                react.create-element 'div', { style: table-item-style, className: 'table-item' }, children = 
                    react.create-element 'div', { style: table-item-style-title, className: 'title h5' }, ' Minimum Amount Per Transaction'
                    react.create-element 'div', { className: 'value' }, children = 
                        """ #{minPerTx} """
                        """ #{currency}"""
                if +homeFeePercent > 0
                    react.create-element 'div', { style: table-item-style, className: 'table-item' }, children = 
                        react.create-element 'div', { style: table-item-style-title, className: 'title h5' }, ' Bridge fee'
                        react.create-element 'div', { style: bridge-fee-style, className: 'value' }, ' ' + bridgeFeePercent + ' %   '
            
                        
                        
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
        $network-details-modal store
state=
    callback: null
export swap-confirm = (store, text, cb)->
    store.current.swap-confirmation = text
    state.callback = cb
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
export network-details-modal = ->
    store.current.current-network-details.show = yes
   
window.confirm-state = state