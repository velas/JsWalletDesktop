require! {
    \react
    \prelude-ls : { map }
    \../pin.ls : { set, check, exists, del, setbkp }
    \../navigate.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \../send-form.ls : { notify-form-result }
    \../seed.ls : seedmem
    \../menu-funcs.ls
    \./choose-language.ls
    \../icons.ls
    \./confirmation.ls : { confirm }
    \../components/button.ls
    \../components/text-field.ls
    \../components/export-import-seed.ls
}
# .locked2093684640
#     @import scheme
#     padding-top: 70px
#     height: $height
#     height: 100vh
#     box-sizing: border-box
#     text-align: center
#     background-size: cover !important
#     .notice
#         max-width: 300px
#         text-align: center
#         color: red
#         margin: 10px auto
#         font-size: 15px
#         padding: 10px
#         border: 1px solid rgba(255, 0, 0, 0.5)
#     .icon-svg
#         position: relative
#         height: 12px
#         top: 2px
#         margin-right: 3px
#     .language
#         position: absolute
#     .password
#         -webkit-text-security: disc
#         text-security: disc
#         &::-webkit-outer-spin-button, &::-webkit-inner-spin-button
#             -webkit-appearance: none
#         -moz-appearance: textfield
#     >.logo
#         margin: 4rem 0
#         >img
#             height: 80px
#             margin-bottom: 1rem
#         >.title
#             font-size: 12px
#             font-weight: 600
#             letter-spacing: 4px
#             text-align: center
#     >.title
#         font-size: 20px
#         margin-bottom: 1rem
#     >.inputs
#         max-width: 400px
#         width: 130px
#         display: inline-block
#         div
#             position: relative
#             .division
#                 float: none
#                 margin: 15px auto 0
#                 overflow: hidden
#                 position: relative
#                 text-align: center
#                 width: 100px
#                 font-size: 10px
#                 span
#                     text-transform: uppercase
#                 .line
#                     border-top: 1px solid rgba(223, 223, 223, 0.2)
#                     position: absolute
#                     top: 6px
#                     width: 34%
#                     &.l
#                         left: 0
#                     &.r
#                         right: 0
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
#     >div>.wrong
#         color: red
#         font-size: 15px
#         padding-top: 15px
#         max-width: 400px
#         display: inline-block
#         ~div .orange
#             color: orange
#             text-transform: uppercase
#             letter-spacing: 1px
#             display: block
#     button
#         width: 130px
#         margin: 5px 0
#         &.text-primary
#             color: rgb(156, 65, 235)
#             &:hover
#                 text-decoration: underline
#         &.setup
#             font-weight: bold
#             cursor: pointer
#             margin: 5px 0
#             width: 130px
#             height: 36px
#             font-size: 10px
#             text-transform: uppercase
#             padding: 0px 6px
#             border-radius: $border
#             border: 0px
#             background: transparent
#             &.reset
#                 &:hover
#                     text-decoration: underline
#             color: white
#     .hint
#         color: #f2eeee
#         padding: 20px 0
#         max-width: 250px
#         font-size: 13px
#         margin: 0 auto
#     .iron
#         -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
#         -webkit-mask-size: 50% 100%
#         animation: shine 2s infinite
#     @keyframes shine
#         0%
#             -webkit-mask-position: right
#         100%
#             -webkit-mask-position: left
#     .version
#         letter-spacing: 1px
#         font-size: 8px
#         padding: 6px
#         color: #89829d
#         border-radius: 8px
#         height: 5px
#         line-height: 5px
#         margin: 5px auto
#     ::placeholder
#         color: var(--color3)
#         font-size: 12px
#         letter-spacing: 0
#         line-height: 18px
#     ::-ms-input-placeholder
#         color: var(--color3)
#         font-size: 12px !important
#         letter-spacing: 0
#         line-height: 22px
#     .drag
#         animation: horizontal_5859 2s ease
#         transform-origin: 50% 50%
#     @keyframes horizontal_5859
#         0%
#             transform: translate(0, 0)
#         4.41177%
#             transform: translate(5px, 0)
#         8.82353%
#             transform: translate(0, 0)
#         13.23529%
#             transform: translate(5px, 0)
#         17.64706%
#             transform: translate(0, 0)
#         22.05882%
#             transform: translate(5px, 0)
#         26.47059%
#             transform: translate(0, 0)
#         100%
#             transform: translate(0, 0)
wrong-pin = (store)->
    store.current.pin = ""
    store.current.pin-trial += 1
    left-trials = total-trials - store.current.pin-trial
    reset-wallet store if left-trials <= 0
check-pin = (store, web3t)->
    return if not exists!
    return wrong-pin store if not check(store.current.pin)
    store.current.pin-trial = 0
    store.current.pin = ""
    store.current.loading = yes
    if store.current.page-pin?
#        <- navigate store, web3t, \:init, no
        navigate store, web3t, store.current.page-pin
        store.current.page-pin = null
    else
        navigate store, web3t, \:init
        notify-form-result \unlock, null
version = (store, web3t)->
    react.create-element 'div', { className: 'version' }, ' ' + store.version
input = (store, web3t)->
    style = get-primary-info store
    button-primary1-style=
        border: "0"
        color: style.app.text
        background: style.app.primary1
        background-color: style.app.primary1-spare
        width: "130px"
        height: "36px"
        margin-top: "10px"
    button-primary0-style=
        border: "0"
        color: style.app.text-primary
        background: "transparent"
        width: "130px"
        height: "36px"
        margin-top: "0px"
    locked-style=
        color: style.app.text
        background: style.app.wallet
        border: "0"
    enter = ->
        if exists!
            check-pin store, web3t
        else
            return alert(lang.wrong-pin-should) if store.current.pin.length < 4
            set store.current.pin
            check-pin store, web3t
            store.current.pin = ""
    change = (e)->
        store.current.pin = e.target.value
    lang = get-lang store
    catch-key = ->
        enter! if it.key-code is 13
    reset-account = ->
        res <- confirm store, "#{lang.backup-info}"
        return if res is no
        reset-wallet store
    drag =
        if store.current.pin-trial is 0 then \ "" else \drag
    react.create-element 'div', {}, children = 
        text-field { store, type: 'password' value: store.current.pin, placeholder: lang.pin-placeholder, on-change: change , on-key-down: catch-key, id="locked-password" }
        if exists!
            react.create-element 'div', {}, children = 
                button { store, on-click: enter, type: \primary , text: \enter }
                react.create-element 'div', {}, children = 
                    react.create-element 'div', { className: 'division' }, children = 
                        react.create-element 'div', { className: 'line l' }
                        react.create-element 'span', {}, ' ' + lang.or
                        react.create-element 'div', { className: 'line r' }
                    react.create-element 'div', {}, children = 
                        react.create-element 'button', { style: button-primary0-style, on-click: reset-account, className: 'setup text-primary' }, ' ' + lang.new-account
reset-wallet = (store)->
    setbkp!
    del!
    seedmem.setbkp!
    seedmem.del!
    store.current.pin = ""
    store.current.pin-trial = 0
    store.current.page = 'chooseinit'
total-trials = 8
wrong-trials = (store)->
    return null if store.current.pin-trial is 0
    lang = get-lang store
    style = get-primary-info store
    left-trials = total-trials - store.current.pin-trial
    notice=
        background: style.app.wallet
    button-primary0-style=
        border: "0"
        color: style.app.text-primary
        background: "transparent"
        width: "130px"
        height: "36px"
        margin-top: "0px"
    reset-account = ->
        res <- confirm store, "#{lang.backup-info}"
        return if res is no
        reset-wallet store
    wrong-pin-text = "#{left-trials}/#{total-trials} #{lang.notice-reset}."
    react.create-element 'div', {}, children = 
        react.create-element 'div', { key: "wrong-trial", className: 'wrong' }, ' ' + wrong-pin-text
        react.create-element 'div', { style: notice, className: 'notice' }, children = 
            react.create-element 'span', { className: 'orange' }, ' ' + lang.notice + '!'
            react.create-element 'span', {}, ' ' + lang.notice-text
        react.create-element 'div', {}, children = 
            react.create-element 'button', { style: button-primary0-style, on-click: reset-account, className: 'reset setup text-primary' }, ' ' + lang.reset-account
setup-button = (store, web3t)->
    lang = get-lang store
    style = get-primary-info store
    { open-language } = menu-funcs store, web3t
    setup = ->
        return alert(lang.wrong-pin-should) if store.current.pin.length < 4
        set store.current.pin
        check-pin store, web3t
        store.current.pin = ""
    text-color=
        color: style.app.text
    button-style =
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    btn-icon =
        filter: style.app.btn-icon
    react.create-element 'div', { key: "setup-button" }, children = 
        react.create-element 'button', { on-click: setup, style: button-style, id: "locked-continue", className: 'setup' }, children = 
            react.create-element 'span', {}, children = 
                react.create-element 'img', { src: "#{icons.key}", style: btn-icon, className: 'icon-svg' }
                """ #{lang.setup}"""
        react.create-element 'div', { style: text-color, className: 'hint p' }, ' ' + lang.pin-info
create-wallet = (store, web3t)->
    lang = get-lang store
    style = get-primary-info store
    create = ->
        next!
    text-color=
        color: style.app.text
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
        background-color: style.app.primary2-spare
    react.create-element 'div', { key: "create-wallet" }, children = 
        react.create-element 'button', { on-click: create, style: button-primary2-style, className: 'setup' }, children = 
            react.create-element 'span', {}, children = 
                react.create-element 'img', { src: "#{icons.create-wallet}", className: 'icon-svg' }
                """ #{lang.create-wallet}"""
locked = ({ store, web3t })->
    return null if store.current.loading is yes
    lang = get-lang store
    style = get-primary-info store
    title =
        | not exists! => lang.enter-pin
        | _ => lang.enter-pin
    footer =
        | not exists! => setup-button
        | _ => wrong-trials
    info = get-primary-info store
    locked-style=
        color: info.app.text
        background-image: info.app.background-image
        background-size: "cover"
        background: info.app.glitch
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
        background-color: style.app.primary2-spare
    txt-style=
        color: info.app.text
    logo-style =
        filter: info.app.filterLogo
    download = ->
        navigate store, web3t, \downloadwallet
    react.create-element 'div', { key: "locked", style: locked-style, className: 'locked locked2093684640' }, children = 
        react.create-element 'div', { className: 'logo' }, children = 
            react.create-element 'img', { src: "#{info.branding.logo}" }
            react.create-element 'div', { style: txt-style, className: 'title' }, ' ' + info.branding.title
            version store, web3t
        react.create-element 'div', { key: "locked-title", className: 'title' }, ' ' + title
        react.create-element 'div', { key: "locked-inputs", className: 'inputs' }, children = 
            input store, web3t
        export-import-seed store
        footer store, web3t
        if not process?versions?electron?
            react.create-element 'div', { className: 'downloadwallet' }, children = 
                button { store, on-click=download, text: \install , icon: \download  , type : \primary }
focus = ({ store }, cb)->
    cb null
locked.focus = focus
module.exports = locked
