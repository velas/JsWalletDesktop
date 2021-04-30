require! {
    \react
    \../../get-primary-info.ls
    \../../round5.ls
    \../../round.ls
    \prelude-ls : { find, filter, obj-to-pairs, pairs-to-obj, map }
    \../../math.ls : { times }
    \../../icon.ls
    \../../icons.ls
    \../../swaping/networks.ls : "token-networks"       
}
# .network-slider506029290
#     .navigation-button
#         transition: opacity 0.2
#         &:hover
#             opacity: 0.9
#         .button-inner
#             position: relative
#             img
#                 height: 15px !important
#                 top: 0 !important
module.exports = ({ web3t, wallet, store, id })->
    return null if not wallet.network.networks?
    return null if not (store.current.send.isSwap? and store.current.send.isSwap is yes)
    return null if not wallet.network.networks? or Object.keys(wallet.network.networks).length is 0
    wallets = store.current.account.wallets |> map (-> [it.coin.token, it]) |> pairs-to-obj 
    available-networks = 
        wallet.network.networks 
            |> obj-to-pairs
            |> filter (it)-> 
                wallets[it[1].referTo]? and ((not it[1].disabled?) or it[1].disabled is no)
            |> pairs-to-obj
    network-labels = Object.keys(available-networks)
    getNetworkById = (id)->
        available-networks["#{id}"]
    style = get-primary-info store
    style2 = color: "#{style.app.icon}"
    input-style2 =
        background: style.app.input
        color: style.app.text
        border: "0"
    button-primary2-style=
        border: "1px solid #{style.app.wallet}"
        color: style.app.text
        background: style.app.primary2
        background-color: style.app.primary2-spare
    ###
    display-value = store.current.send.chosen-network.name.to-upper-case!
    ###   
    go = (inc)-> ->
        current = network-labels.index-of(store.current.send.chosen-network.id)
        lenght = network-labels.length
        index = current + inc 
        if (current + inc) >= lenght then 
            index = 0 
        else if (current + inc) < 0 then
            index = lenght - 1
        chosen-network-id = network-labels[index]
        store.current.send.chosenNetwork = getNetworkById(chosen-network-id)
        store.current.send.to = token-networks.get-default-recipient-address(store)
        store.current.send.error = ''
        store.current.send.data = null
    goback = go(-1)
    goForw = go(1)       
    react.create-element 'div', { className: 'network-slider network-slider506029290' }, children = 
        react.create-element 'label', { style: style2, className: 'control-label' }, ' Choose Network'
        react.create-element 'div', {}, children = 
            react.create-element 'span', { on-click: goback, style: button-primary2-style, className: 'button navigation-button left' }, children = 
                react.create-element 'div', { className: 'button-inner' }, children = 
                    react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg' }
            react.create-element 'span', { className: 'bold' }, children = 
                react.create-element 'input', { value: "#{display-value}", style: input-style2, disabled: true, className: 'change-network' }
            react.create-element 'span', { on-click: goForw, style: button-primary2-style, className: 'button navigation-button right' }, children = 
                react.create-element 'div', { className: 'button-inner' }, children = 
                    react.create-element 'img', { src: "#{icons.arrow-right}", className: 'icon-svg' }