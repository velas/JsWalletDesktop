require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \../pages/icon.ls
    \../icons.ls
    \../send-funcs.ls
}
# .trx-fee1751710292
#     @import scheme
#     $border-radius: $border
#     table
#         margin-bottom: -1px
#         border-radius: $border-radius $border-radius 0 0
#     td
#         cursor: pointer
#         padding: 2px 5px 10px
#         transition: all .5s
#         position: relative
#         &:first-child
#             border-radius: $border-radius 0 0 0
#         &:last-child
#             text-align: left
#             border-radius: 0 $border-radius 0 0
#         &:hover
#             background: var(--td-hover)
#             transition: all .5s
#         &.active
#             background: var(--td-hover)
#             .field
#                 &.type
#                     color: orange
#                     &:after
#                         opacity: 1
#                         filter: none
#         .type
#             &:after
#                 content: $check-xs
#                 position: absolute
#                 right: 5px
#                 opacity: .2
#                 filter: grayscale(1)
#                 margin-bottom: 20px
#         .coin
#             text-transform: uppercase
#     label
#         padding-top: 5px
#         padding-left: 3px
#         font-size: 13px
#     table
#         width: 100%
#     input
#         outline: none
#         width: 100%
#         box-sizing: border-box
#         height: 36px
#         line-height: 36px
#         border-radius: 0px
#         padding: 0px 10px
#         font-size: 14px
#         border: 0px
#         box-shadow: none
#         margin-bottom: -1px
trx-fee = ({ store, web3t, wallet })->
    style = get-primary-info store
    lang = get-lang store
    {send} = store.current
    active-cheap = send.fee-type is \cheap
    active-custom = send.fee-type is \custom
    active-auto = send.fee-type is \auto
    active-class= (fee-type) ->
        return null if fee-type isnt send.fee-type
        return \active
    { choose-cheap, choose-custom, choose-auto} = send-funcs store, web3t
    select-custom = ->
        # send.fee-custom-amount = send.amount-send-fee
        # send.fee-type = \custom
        choose-custom send.amount-send-fee
    on-fee-change = (ev) ->
        {value} = ev.target
        if (value.split \.).length > 2
            value = "0"
        if /[^\.0-9]/.test value
            value = "0"
        if value == ""
            value = "0"
        if value.starts-with "0" and value.index-of \. is -1 and value.length > 1
            value = value.substr 1
        if value.starts-with \.
            value = "0" + value
        choose-custom value
    fee-currency = wallet.network.tx-fee-in ? send.coin.token
    border-style = border: "1px solid #{style.app.border}"
    text = color: "#{style.app.icon}"
    input-style=
        background: style.app.input
        border: "1px solid #{style.app.border}"
        color: style.app.text
    custom-fee-value = ->
        if active-custom
        then send.fee-custom-amount
        else send.amount-send-fee
    cheap-option = ->
        return null if !send.amount-send-fee-options.cheap
        return null if send.amount-send-fee-options.cheap > send.amount-send-fee-options.auto
        react.create-element 'td', { on-click: choose-cheap, className: "#{active-class \cheap}" }, children = 
            react.create-element 'div', { className: 'field type' }, ' ' + lang.cheap
            react.create-element 'div', { className: 'field coin' }, ' ' + if send.amount-send-fee-options.cheap then send.amount-send-fee-options.cheap + " " + fee-currency else ""
    custom-option = ->
        react.create-element 'td', { on-click: select-custom, className: "#{active-class \custom}" }, children = 
            react.create-element 'div', { className: 'field type' }, ' ' + lang.custom
            react.create-element 'div', { className: 'field coin' }, ' ' + custom-fee-value! + " " + fee-currency
    auto-option = ->
        react.create-element 'td', { on-click: choose-auto, className: "#{active-class \auto}" }, children = 
            react.create-element 'div', { className: 'field type' }, ' ' + lang.auto
            react.create-element 'div', { className: 'field coin' }, ' ' + if send.amount-send-fee-options.auto then send.amount-send-fee-options.auto + " " + fee-currency else ""
    react.create-element 'div', { className: 'trx-fee trx-fee1751710292' }, children = 
        react.create-element 'label', { style: text }, ' Transaction Fee'
        react.create-element 'table', { style: border-style, className: 'fee' }, children = 
            react.create-element 'tbody', {}, children = 
                react.create-element 'tr', {}, children = 
                    cheap-option!
                    custom-option!
                    auto-option!
        if store.current.send.fee-type is \custom
            react.create-element 'input', { type: 'text', style: input-style, on-change: on-fee-change, placeholder: "0", title: "Fee", value: "#{send.fee-custom-amount}", className: 'amount' }
module.exports = trx-fee
#???store.current.send.send.fee-custom-amountcheaon-change-xcon-change-custom-fee.send""store.current.send.send.fstore.current.send.fee-custom-amount