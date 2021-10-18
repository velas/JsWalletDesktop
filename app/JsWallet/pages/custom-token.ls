require! {
    \react
    \../send-funcs.ls
    \prelude-ls : { map, find, keys, filter, pairs-to-obj, obj-to-pairs }
    \../get-primary-info.ls
    \./icon.ls
    \../get-lang.ls
    \./switch-account.ls
    \../icons.ls
    \../round-human.ls
    \../round-number.ls
    \../wallets-funcs.ls
    \./epoch.ls
    \../components/button.ls
    \../components/address-holder.ls
    \../components/identicon.ls
    \../history-funcs.ls
    \../components/burger.ls
    \../components/amount-field.ls
    \../components/amount-fiat-field.ls
    \../math.ls : { times, div }
}
# .custom-token-content1828724755
#     position: relative
#     @import scheme
#     $border-radius: var(--border-btn)
#     $label-padding: 3px
#     $label-font: 13px
#     width: calc(100% - 0px) !important
#     margin-left: 0px !important
#     max-width: none !important
#     height: 100vh
#     display: flex !important
#     flex-direction: column  
#     align-items: center
#     @media(min-height:900px)
#         justify-content: center    
#     @media(max-width:800px)
#         margin-left: 0 !important
#     .icon-svg
#         position: relative
#         height: 12px
#         top: 2px
#     .icon-svg-history
#         width: auto !important
#         height: 20px
#     .content-body
#         max-width: 450px !important
#     >.title
#         position: fixed
#         position: -webkit-fixed
#         background: var(--background)
#         box-sizing: border-box
#         top: 0
#         width: 100%
#         color: gray
#         font-size: 22px
#         padding: 10px
#         height: 60px
#         z-index: 3
#         @media(max-width:800px)
#             left: 0
#         >.header
#             margin: 5px
#             text-align: center
#             @media(max-width:800px)
#                 text-align: center
#     .h1
#         font-size: 17px
#         text-transform: uppercase
#         letter-spacing: 2px
#         opacity: .8
#     .pending
#         color: orange
#     >*
#         display: inline-block
#         text-align: center
#         width: 100%
#         box-sizing: border-box
#         border-radius: $border-radius
#     .swap-notification
#         p
#             font-size: 12px
#             opacity: 0.3
#     .more-buttons
#         top: 30px
#         right: 0
#         width: 150px
#         box-shadow: 0px 0px 2px black
#         border-radius: var(--border-btn)
#         text-align: left
#         padding-bottom: 3px
#         >.more
#             display: block
#             cursor: pointer
#             padding: 5px 0
#             &:last-child
#                 border-bottom: 0px
#             .more-icon
#                 width: 50px
#                 text-align: center
#                 display: inline-block
#                 vertical-align: middle
#             .more-text
#                 width: 80px
#                 display: inline-block
#                 vertical-align: middle
#     >.content-body
#         border: 0
#         background: "transparent"
#         @import scheme
#         color: gray
#         @media(max-width:800px)
#             margin-top: -5px  
#         a
#             color: #6f6fe2
#         >form
#             >table
#                 background: transparent
#                 border-radius: 0 0 var(--border-btn) var(--border-btn)
#                 width: 100%
#                 border-spacing: 0
#                 tr
#                     &.gray
#                         color: #CCC
#                     &.orange
#                         color: #cf952c
#                     &.green
#                         color: #23b723
#                     td
#                         padding: 3px 10px
#                         font-size: 14px
#                         .label-coin
#                             left: 3px
#                             top: 3px
#                             padding: 0 2px 0 2px
#                             height: 16px
#                             position: relative
#                         &:last-child
#                             text-align: right
#             text-align: left
#             margin: auto 10px
#             >.form-group
#                 margin-bottom: 10px
#                 min-height: 80px
#                 input 
#                     padding: 0 10px 0 45px 
#                     text-align: left
#                 &.sender
#                     .address-holder .inner-address-holder
#                         text-align: left
#                         padding-left: 45px
#                 &.receiver input
#                     text-align: left !important
#                 .identicon
#                     ~ span
#                         background: var(--input)
                
#                 .control-label
#                     padding-top: 0px
#                     font-size: $label-font
#                     &.not-enought
#                         margin-bottom: -7px;
#                         margin-top: -4px;
#                 &.network
#                     div
#                         position: relative
#                     .button
#                         width: 12px
#                         height: 16px
#                         display: inline-block
#                         padding: 9px
#                         border-radius: var(--border-btn)
#                         cursor: pointer
#                         vertical-align: top
#                         position: absolute
#                         &.left
#                             left: 0
#                         &.right
#                             right: 0
#                             top: 3px
#                         svg
#                             vertical-align: inherit !important
#                 .address
#                     padding: 0px
#                     line-height: 36px
#                     overflow: hidden
#                     text-overflow: ellipsis
#                     background: transparent
#                     border-radius: $border-radius
#                     font-size: 14px
#                     overflow: hidden
#                     text-overflow: ellipsis
#                     color: #677897
#                 input
#                     outline: none
#                     width: 100%
#                     box-sizing: border-box
#                     height: 36px
#                     line-height: 36px
#                     border-radius: $border-radius
#                     padding: 0px 10px
#                     font-size: 14px
#                     border: 0px
#                     box-shadow: none
#                 .amount-field
#                     position: relative
#                     >.input-wrapper
#                         position: relative
#                         width: 65%
#                         border-radius: var(--border-btn) 0 0 var(--border-btn)
#                         &.choose-currency
#                             display: inline-flex
#                             width: 45% !important
#                         .input-area
#                             margin: 0
#                         select
#                             -webkit-appearance: none
#                             -moz-appearance: none
#                             padding-right: 30px
#                             padding-left: 10px
#                             background-position: right 5px top 50%
#                             background-repeat: no-repeat
#                             display: block
#                             width: 30%
#                             height: 36px
#                             font-size: 14px
#                             line-height: 1.5
#                             color: #fff
#                             background-color: #421f7c
#                             background-clip: padding-box
#                             border-radius: 0
#                             border-color: #6b258e
#                             border-left: 0 solid
#                             margin-left: -1px
#                         &.small
#                             width: 35%
#                             border-radius: 0 var(--border-btn) var(--border-btn) 0
#                         display: inline-block
#                         box-sizing: border-box
#                         margin: 0
#                         >.label
#                             position: absolute
#                             top: 8px
#                             display: inline
#                             &.lusd
#                                 left: 5px
#                             &.crypto
#                                 right: 5px
#                                 top: 7px
#                                 height: 22px
#                         .label-coin
#                             height: 18px
#                             top: 3px
#                             position: relative
#                             padding: 0 0px 0 8px;
#                         input
#                             width: 100%
#                             color: white
#                             box-shadow: none
#                             outline: none
#                             ::placeholder
#                                 color: #eee
#                             &:disabled
#                                 opacity:.2
#                             &.amount
#                                 border-radius: $border-radius 0 0 $border-radius
#                                 border-right: 0
#                             &.amount-eur
#                                 background: #f1eeee
#                                 padding-left: 20px
#                                 border-radius: 0 $border-radius $border-radius 0
#                                 border-left: 0
#                             &.amount-usd
#                                 background: #f1eeee
#                                 border-radius: 0 $border-radius $border-radius 0
#                                 padding-left: 20px
#         .smart-contract
#             overflow: hidden
#             padding: 2px
#             box-sizing: border-box
#         >.header
#             padding: 10px
#             min-height: 40px
#             text-align: left
#             padding: 0
#             margin: 0 10px
#             >.head
#                 box-sizing: border-box
#                 width: 70%
#                 line-height: 70px
#                 font-size: 27px
#                 font-weight: 600
#                 vertical-align: middle
#                 line-height: 29px
#                 display: inline-block
#                 color: #677897
#                 width: 80%
#                 &.center
#                     padding-left: 10px
#                     text-align: center
#                 &.left
#                     width: 10%
#                     text-align: center
#                 &.right
#                     width: 10%
#                     text-align: right
#                     cursor: pointer
#                     >*
#                         vertical-align: middle
#             img
#                 width: 34px
#                 border-radius: 0px
#         .field
#             font-size: 12px
#             padding-left: 3px
#             color: gray
#             margin-top: 5px
#             &.type
#                 font-size: 14px
#                 color: #fff
#                 text-transform: capitalize
#             &.coin
#                 font-size: 14px
#                 color: #fff
#         .usd
#             font-size: 11px
#             padding-left: 3px
#             color: gray
#             margin-top: 5px
#             .switch-currency
#                 float: right
#                 &.active
#                     background: var(--primary3)
#                 &:last-child
#                     margin-right: 2px
#             .label-coin
#                 left: 3px
#                 top: 3px
#                 padding: 0 2px 0 2px
#                 height: 13px
#                 position: relative
#         .balance
#             color: #5E72E4
#         .send-all
#             background: transparent
#             outline: none
#             border: 0
#             border-radius: $border
#             font-size: 12px
#             line-height: 16px
#             text-align: center
#             padding: 2px 5px
#             cursor: pointer
#         .not-enough
#             color: red
#             min-height: 33px
#             padding: 0
#             font-size: 12px
#             max-height: 20px
#             font-weight: 400f
#             overflow: hidden
#         .bold
#             font-weight: bold
#         .button-container
#             text-align: center
#             .buttons
#                 text-align: center
#                 border-radius: $border
#                 width: 100%
#                 display: inline-block
#                 overflow: hidden
#                 .btn
#                     width: auto
#                     min-width: 80px
#                     padding: 0 6px
#                     line-height: 36px
#                     height: 36px
#                     text-transform: uppercase
#                     text-align: center
#                     font-weight: bold
#                     border: 0
#                     margin: 5px
#                     font-size: 10px
#                     border-radius: $border
#                     display: inline-block
#                     cursor: pointer
#                     box-sizing: border-box
#                     transaction: all .5s
#                     &.btn-primary
#                         background: #6CA7ED
#                         color: white
#                     &:hover
#                         background: rgba(#6CA7ED, 0.2)
#                         opacity: .9
form-group = (classes, title, style, content)->
    react.create-element 'div', { className: "#{classes} form-group" }, children = 
        react.create-element 'label', { style: style, className: 'control-label' }, ' ' + title
        content!
custom-token = ({ store, web3t })->
    return null if store.custom-token.add is no
    
    { symbol, icon, contract-address, decimals, edit-symbol, network, switch-network } = store.custom-token
    
    if not network? then
        evm-wallet = store.current.account.wallets |> find(-> it.coin.token is \vlx_evm)
        network = evm-wallet?network
    
    close = ->
        store.current.add-coin = no
    
    theme = get-primary-info(store)
    round-money = (val)->
        +val |> (-> it * 100) |> Math.round |> (-> it / 100)
    style = get-primary-info store
    styles = $styles(style)
    menu-style=
        background: style.app.background
        background-color: style.app.bgspare
        border: "1px solid #{style.app.border}"
    input-style=
        background: style.app.input
        border: "1px solid #{style.app.border}"
        color: style.app.text
    border-style=
        border: "1px solid #{style.app.border}"
    amount-style=
        background: style.app.input
        border: "1px solid #{style.app.border}"
        color: style.app.text
    icon-style =
        color: style.app.icon
    use-max-style =
        color: style.app.text2
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    button-primary2-style=
        border: "1px solid #{style.app.wallet}"
        color: style.app.text
        background: style.app.primary2
        background-color: style.app.primary2-spare
    crypto-background =
        background: style.app.wallet
        width: "50%"
    just-crypto-background =
        background: style.app.wallet
    content-body-style=
        color: style.app.text
    more-text=
        color: style.app.text
    border-header =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.background
        background-color: style.app.bgspare
    lang = get-lang store
    open-invoice = ->
 
    
    show-class =
        if store.current.open-menu then \hide else \ ""
    token-display = (symbol ? "").to-upper-case!
    token-icon = icon
    
    get-number = (val)->
        number = (val ? "").toString!
        return \0 if number is ""
        val
    
    go-back-from-send = ->
        store.custom-token.add = no
    
    up = (str)->
        (str ? "").to-upper-case!
    
    network-type = (store.current.network ? "").to-upper-case!    
    display-network = network?group + " " + network-type + " "
        
    /* COntract address */    
    contract-address-exists = (address)->
        active-wallets = store.current.account.wallets
        found = 
            active-wallets
                |> find (it)-> 
                    up(it?network?address) is up(address)
        found?    
    
    save-custom-token = ->
    
    decimals-change = (event)->
        value = event.target.value
        value = (+get-number(value)).toString()
        # Restrictions check #
        valid = //^[0-9]+?$//.test(value)
        return if not valid
        if (value > 36)
            store.custom-token.errors.decimals = "Decimals must be at least 0, and not over 36" 
        else
            store.custom-token.errors.decimals = ""      
        #return if not valid
        #return if +value > 36
        store.custom-token.decimals = value
        
    token-symbol-change = (event)->
        $symbol = (event.target.value || "").trim!
        if ($symbol.length > 12)
            store.custom-token.errors.symbol = "Symbol must be 12 characters or fewer" 
        else
            store.custom-token.errors.symbol = ""
        store.custom-token.symbol = $symbol
        
    contract-address-change = (event)->
        address = (event.target.value || "").trim!
        if (address.length > 0 and !/^(0x)?[0-9a-f]{40}$/i.test(address))
            store.custom-token.errors.contract-address = "Invalid address" 
        else
            store.custom-token.errors.contract-address = ""   
        store.custom-token.contract-address = address
        if address.length > 0
            exists = contract-address-exists(address)
            if (exists)
                store.custom-token.errors.contract-address = "Token has already been added"
        err, data <- retrieve-info-by-token-address(address)
        return store.custom-token.errors.contract-address = err if err? 
        autofill-form(data)
        
    retrieve-info-by-token-address = (address, cb)->
#        web3 = new Web3(new Web3.providers.HttpProvider(wallet.network.api.web3Provider))
#        web3.eth.provider-url = wallet.network.api.web3Provider
#        contract = web3.eth.contract(abis.ForeignBridgeNativeToErc).at(address)
        cb null 
        
    autofill-form = (data)->   
    
    cancel = ->
        store.custom-token.add = no
        
    has-contract-error = store.custom-token.errors.contract-address.trim!.length > 0
    has-symbol-error   = store.custom-token.errors.symbol.trim!.length > 0
    has-decimals-error = store.custom-token.errors.decimals.trim!.length > 0

    disabled = 
        | decimals is 0 or symbol.trim!.length is 0 or contract-address.trim!.length is 0 => yes
        | has-contract-error || has-symbol-error || has-decimals-error => yes
        | _ => no  

    
    /* Render */
    react.create-element 'div', { className: 'custom-token-content custom-token-content1828724755' }, children = 
        react.create-element 'div', { style: content-body-style, className: 'content-body' }, children = 
                    
            react.create-element 'form', {}
            
                form-group \network-chooser, "Network", icon-style, ->
                    react.create-element 'div', {}, children = 
                        react.create-element 'span', { className: 'bold default-network-input' }, children = 
                            react.create-element 'input', { value: "#{0}", disabled: true, className: 'change-network' }, '                                     '
                form-group \sender, "Token Contract Address", icon-style, ->
                    react.create-element 'div', { className: 'address' }, children = 
                        react.create-element 'input', { type: 'text', style: input-style, on-change: contract-address-change, value: "#{contract-address}", id: "contract-address" }
                        if has-contract-error
                            react.create-element 'div', { className: 'control-label not-enough text-left' }, ' ' + store.custom-token.errors.contract-address
                form-group \receiver, "Token symbol", icon-style, ->
                    react.create-element 'div', {}, children = 
                        react.create-element 'input', { type: 'text', style: input-style, on-change: token-symbol-change, value: "#{symbol}", id: "symbol" }
                        if has-symbol-error
                            react.create-element 'div', { className: 'control-label not-enough text-left' }, ' ' + store.custom-token.errors.symbol
                form-group \send-amount, "Token Decimals", icon-style, ->
                    react.create-element 'div', {}, children = 
                        react.create-element 'div', { className: 'amount-field' }, children = 
                            react.create-element 'div', { style: input-style, className: 'input-wrapper' }, children = 
                                react.create-element 'input', { type: 'number', style: input-style, placeholder: "0", on-change: decimals-change, value: "#{decimals}", id: "decimals" }
                                if has-decimals-error
                                    react.create-element 'div', { className: 'control-label not-enough text-left' }, ' ' + store.custom-token.errors.decimals
            react.create-element 'div', { className: 'button-container' }, children = 
                react.create-element 'div', { className: 'buttons' }, children = 
                    button { store, text: "Add token" , on-click: save-custom-token , type: \primary,  makeDisabled: disabled, id: "send-confirm" }
                    button { store, text: \cancel , on-click: cancel, icon: \close2, id: "send-cancel" }

$styles = (style)->
    {
        input-network:
            cursor: "pointer" 
            min-height: "36px"
        img-icon-style = 
            width: "13px"
            height: "8px"
            margin-left: "-6px"
            margin-top: "4px"
            filter: "grayscale(100%) brightness(40%) sepia(100%) hue-rotate(14deg) saturate(790%) contrast(1.5)"
        filter-body:
            border: "1px solid #{style.app.border}"
            background: style.app.account-bg
            position: "absolute !important"
            right: "-1px"
            top: "45px"
            width: "100%"
            display: "inline-grid"
            z-index: 3
            box-shadow: "0px 13px 20px 0px rgba(0, 0, 0, 0.15)"
            border-radius: "0 0 var(--border-btn) var(--border-btn)"
        folder-menu:
            width: "100%"
        folder-menu-div:
            text-overflow: "ellipsis"
            white-space: "nowrap"
            overflow: "hidden"
            font-size: "12px"
            text-transform: "uppercase"
            letter-spacing: "2px"
    }
        
        
module.exports = custom-token

