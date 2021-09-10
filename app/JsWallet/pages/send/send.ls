require! {
    \react
    \../../send-funcs.ls
    \prelude-ls : { map, find, keys, filter }
    \../../get-primary-info.ls
    \../icon.ls
    \../../get-lang.ls
    \../switch-account.ls
    \../../icons.ls
    \../../round-human.ls
    \../../round-number.ls
    \../../wallets-funcs.ls
    \../epoch.ls
    \../../components/button.ls
    \../../components/address-holder.ls
    \../../components/identicon.ls
    \../../components/trx-fee.ls
    \../send-contract.ls
    \../../history-funcs.ls
    \../../components/burger.ls
    \../../components/amount-field.ls
    \../../components/sliders/network-slider.ls
    \../../math.ls : { times }
    \ethereumjs-util : {BN}
    \../../velas/addresses.ls
    \../../contracts.ls
    \../../swaping/networks.ls : \token-networks
    \./send-style.ls
}
form-group = (classes, title, style, content)->
    react.create-element 'div', { className: "#{classes} form-group" }, children = 
        react.create-element 'label', { style: style, className: 'control-label' }, ' ' + title
        content!
send = ({ store, web3t })->
    { token, name, fee-token, bridge-fee-token, network, send, wallet, pending, recipient-change, amount-change, amount-usd-change, amount-eur-change, use-max-amount, show-data, show-label, history, cancel, send-anyway, before-send-anyway, swap-back, choose-auto, round5edit, round5, is-data, encode-decode, change-amount, invoice } = send-funcs store, web3t
    return send-contract { store, web3t } if send.details is no
    send.sending = false
    { go-back } = history-funcs store, web3t
    return go-back! if not wallet?
    round-money = (val)->
        +val |> (-> it * 100) |> Math.round |> (-> it / 100)
    style = get-primary-info store
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
    more-text=
        color: style.app.text
    border-header =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.background
        background-color: style.app.bgspare
    lang = get-lang store
    wallet-title = "#{name + network} #{lang.wallet ? 'wallet'}"
    open-invoice = ->
        invoice store, wallet
    activate = (convert)-> ->
        store.current.convert = convert
    activate-usd = activate \usd
    activate-eur = activate \eur
    active-class = (convert)->
        if store.current.convert is convert then 'active' else ''
    active-usd = active-class \usd
    active-eur = active-class \eur
    show-class =
        if store.current.open-menu then \hide else \ ""
    token-display = if token == \VLX2 then \VLX else token
    fee-token-display = if fee-token == \VLX2 then \VLX else fee-token
    fee-token-display = 
        | bridge-fee-token? => bridge-fee-token
        | _ =>  fee-token-display
    fee-token-display = fee-token-display.to-upper-case!
    fee-coin-image = 
        | send.fee-coin-image? => send.fee-coin-image
        |_ => send.coin.image
    go-back-from-send = ->
        send.error = ''
        go-back!  
    makeDisabled = send.amount-send <= 0
    token = store.current.send.coin.token
    is-swap = store.current.send.swap is yes
    send-func =
        | token is \vlx_erc20 and is-swap => swap-back
        | _ => before-send-anyway
    disabled = not send.to? or send.to.trim!.length is 0 or (send.error.index-of "address") > -1     
    receiver-is-swap-contract = contracts.is-swap-contract(store, store.current.send.contract-address)
    visible-error = if send.error? and send.error.length > 0 then "visible" else ""
    get-recipient = (address)->
        address
    recipient = get-recipient(send.to)
    react.create-element 'div', { className: 'content' }, children = 
        react.create-element 'div', { style: border-header, className: 'title' }, children = 
            react.create-element 'div', { className: "#{show-class} header" }, ' ' + lang.send
            react.create-element 'div', { on-click: go-back-from-send, className: 'close' }, children = 
                react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg' }
            burger store, web3t
            epoch store, web3t
            switch-account store, web3t
        react.create-element 'div', { style: more-text, className: 'content-body' }, children = 
            if store.current.device isnt \mobile
                react.create-element 'div', { className: 'header' }, children = 
                    react.create-element 'span', { className: 'head left' }, children = 
                        react.create-element 'img', { src: "#{send.coin.image}" }
                    react.create-element 'span', { style: more-text, className: 'head center' }, ' ' + wallet-title
                    if store.current.device is \mobile
                        react.create-element 'span', { on-click: history, style: icon-style, className: 'head right' }, children = 
                            react.create-element 'img', { src: "#{icons.history}", className: 'icon-svg-history' }
            if store.current.send-menu-open
                react.create-element 'div', { style: menu-style, className: 'more-buttons' }, children = 
                    if store.preference.invoice-visible is yes
                        if store.current.device is \desktop
                            react.create-element 'a', { on-click: open-invoice, className: 'more receive' }, children = 
                                react.create-element 'div', {}, children = 
                                    react.create-element 'span', { style: icon-style, className: 'more-icon' }, children = 
                                        icon \Mail, 20
                                    react.create-element 'span', { style: more-text, className: 'more-text' }, ' ' + lang.invoice
                    if store.current.device is \mobile
                        react.create-element 'a', { on-click: history, className: 'more history' }, children = 
                            react.create-element 'div', {}, children = 
                                react.create-element 'span', { style: icon-style, className: 'more-icon' }, children = 
                                    icon \Inbox, 20
                                react.create-element 'span', { style: more-text, className: 'more-text' }, ' ' + lang.history
            react.create-element 'form', {}, children = 
                form-group \sender, lang.from, icon-style, ->
                    react.create-element 'div', { style: border-style, className: 'address' }, children = 
                        address-holder { store, wallet }
                react.create-element 'div', { className: 'slider network form-group' }, children = 
                    network-slider { web3t, wallet, store}
                form-group \receiver, lang.to, icon-style, ->
                    react.create-element 'div', {}, children = 
                        identicon { store, address: send.to }
                        react.create-element 'input', { type: 'text', style: input-style, on-change: recipient-change, value: "#{recipient}", placeholder: "#{store.current.send-to-mask}", id: "send-recipient" }
                form-group \send-amount, lang.amount, icon-style, ->
                    react.create-element 'div', {}, children = 
                        react.create-element 'div', { className: 'amount-field' }, children = 
                            react.create-element 'div', { style: input-style, className: 'input-wrapper' }, children = 
                                react.create-element 'div', { className: 'label crypto' }, children = 
                                    react.create-element 'img', { src: "#{send.coin.image}", className: 'label-coin' }
                                    """ #{token-display}"""
                                amount-field { store, value: "#{round5edit send.amount-send}", on-change: amount-change, placeholder="0", id="send-amount", token, disabled }
                            if active-usd is \active
                                react.create-element 'div', { style: amount-style, className: 'input-wrapper small' }, children = 
                                    react.create-element 'div', { className: 'label lusd' }, ' $'
                                    react.create-element 'input', { type: 'text', style: just-crypto-background, on-change: amount-usd-change, placeholder: "0", title: "#{send.amount-send-usd}", value: "#{round-number send.amount-send-usd, {decimals: 8}}", id: "send-amount-usd", disabled: disabled, className: 'amount-usd' }
                            if active-eur is \active
                                react.create-element 'div', { style: amount-style, className: 'input-wrapper small' }, children = 
                                    react.create-element 'div', { className: 'label lusd' }, ' €'
                                    react.create-element 'input', { type: 'text', style: crypto-background, on-change: amount-eur-change, placeholder: "0", title: "#{send.amount-send-eur}", value: "#{round-money send.amount-send-eur}", id: "send-amount-eur", className: 'amount-eur' }
                        react.create-element 'div', { className: 'usd' }, children = 
                            react.create-element 'button', { on-click: use-max-amount, style: button-primary3-style, type: "button", id: "send-max", className: 'send-all' }, ' ' + lang.use-max
                            react.create-element 'span', {}, ' ' + lang.balance
                            react.create-element 'span', { className: 'balance' }, children = 
                                react.create-element 'span', { title: "#{wallet.balance}" }, ' ' + round-human wallet.balance
                                    react.create-element 'img', { src: "#{send.coin.image}", className: 'label-coin' }
                                    react.create-element 'span', {}, ' ' + token-display
                                if +wallet.pending-sent >0 and no
                                    react.create-element 'span', { className: 'pending' }, ' ' + '(' + pending + ' ' + lang.pending + ')'
                        react.create-element 'div', { title: "#{send.error}", className: "#{visible-error} control-label not-enough text-left" }, ' ' + send.error
                if is-data
                    form-group \contract-data, 'Data', icon-style, ->
                        react.create-element 'div', { style: input-style, className: 'smart-contract' }, ' ' + show-data!
                trx-fee { store, web3t, wallet }
                react.create-element 'table', { style: border-style }, children = 
                    react.create-element 'tbody', {}, children = 
                        react.create-element 'tr', {}, children = 
                            react.create-element 'td', {}, ' ' + lang.you-spend
                            react.create-element 'td', {}, children = 
                                react.create-element 'span', { title: "#{send.amount-charged}" }, ' ' + round5(send.amount-charged)
                                    react.create-element 'img', { src: "#{send.coin.image}", className: 'label-coin' }
                                    react.create-element 'span', { title: "#{send.amount-charged}" }, ' ' + token-display
                                react.create-element 'div', { className: 'usd' }, ' $ ' + round5 send.amount-charged-usd
                        react.create-element 'tr', { className: 'orange' }, children = 
                            react.create-element 'td', {}, ' ' + lang.fee
                            react.create-element 'td', {}, children = 
                                react.create-element 'span', { title: "#{send.amount-send-fee}" }, ' ' + round5 send.amount-send-fee
                                    react.create-element 'img', { src: "#{fee-coin-image}", className: 'label-coin' }
                                    react.create-element 'span', { title: "#{send.amount-send-fee}" }, ' ' + fee-token-display
                                react.create-element 'div', { className: 'usd' }, ' $ ' + round5 send.amount-send-fee-usd
            react.create-element 'div', { className: 'button-container' }, children = 
                react.create-element 'div', { className: 'buttons' }, children = 
                    button { store, text: \send , on-click: send-func , loading: send.sending, type: \primary, error: send.error, makeDisabled: makeDisabled, id: "send-confirm" }
                    button { store, text: \cancel , on-click: cancel, icon: \close2, id: "send-cancel" }
module.exports = send
module.exports.init = ({ store, web3t }, cb)->
    { wallet } = send-funcs store, web3t
    return cb null if not wallet?
    return cb null if send.sending is yes
    store.current.send.foreign-network-fee = 0
    if store.current.send.swap isnt yes
        store.current.send.contract-address = null
    is-swap-contract = contracts.is-swap-contract(store, send.to)
    if is-swap-contract then
        contract-address = if wallet.coin.token is \vlx2 then web3t.velas.HomeBridgeNativeToErc.address else web3t.velas.ForeignBridgeNativeToErc.address 
        store.current.send.to = contract-address
        network-type = store.current.network
        networks = wallet.coin["#{network-type}s"]
        store.current.send.networks = networks
        network-keys = networks |> keys
        default-network = networks[network-keys.0].name
    /* If it is Swap! */
    if wallet.network.networks? and (store.current.send.swap is yes) then
        store.current.send.chosenNetwork = wallet.network.networks.evm
        store.current.send.to = token-networks.get-default-recipient-address(store) 
    { wallets } = wallets-funcs store, web3t
    current-wallet =
        wallets |> find (-> it.coin.token is wallet.coin.token)
    err, fee <- contracts.get-home-network-fee({store, web3t}, store.current.send.to)
    store.current.send.foreign-network-fee = fee
    { wallet } = send-funcs store, web3t
    store.current.send.fee-coin-image = wallet.coin.image   
    if wallet.network.txBridgeFeeIn? and (wallet.coin.token isnt wallet.network.txBridgeFeeIn) then
        bridge-fee-token = wallet.network.txBridgeFeeIn
        second-wallet = wallets |> find (-> it.coin.token is bridge-fee-token)
        store.current.send.fee-coin-image = second-wallet.coin.image
    return cb null if current-wallet.address is wallet.address
    return cb null if not wallet?
    return cb null if not web3t[wallet.coin.token]?   
    { send-transaction } = web3t[wallet.coin.token]
    err <- send-transaction { to: "", value: 0 }
    send.sending = false
    cb null