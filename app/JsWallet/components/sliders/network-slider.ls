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
    \../../send-funcs.ls   
    \../../pages/confirmation.ls : { network-details-modal }  
}
# .network-slider243580078
#     @keyframes animate-arrow-1  
#         0%
#             transform: translateX(-40px)
#             opacity: 0
#         70%
#             transform: translateX(0px)
#             opacity: 1
     
#     @keyframes animate-arrow-2  
#         0%
#             transform: translateX(-20px)
#             opacity: 0
#         70%,100%
#             transform: translateX(0px)
#             opacity: 0.5
     
#     @keyframes animate-arrow-3  
#         0%
#             transform: translateX(-10px)
#             opacity: 0
#         70%,100%
#             transform: translateX(0px)
#             opacity: 0.3
     
#     @-webkit-keyframes blink
#         0%     
#             opacity: 0
#         25% 
#             opacity: 1    
#         50%   
#             opacity: 0
#         100%
#             transform: translate(15px, 0px) 
#             opacity: 1
#     @keyframes blink
#         0%     
#             opacity: 0
#         25% 
#             opacity: 1    
#         50%   
#             opacity: 0
#         100%
#             transform: translate(15px, 0px) 
#             opacity: 1
#     .chosen-network
#         font-size: 13px
#         font-weight: 500
#         letter-spacing: -0.4px
#         position: absolute
#         text-transform: uppercase
#         top: 30px
#         z-index: 2
#         cursor: help !important
#         text-decoration: underline
#         @media(max-width: 600px)
#             font-size: 10px    
#         &.network-from
#             left: 40px
            
#             &:after
#                 content: "→"
#                 color: #61d6b0
#                 font-size: 15px
#                 font-weight: bold
#                 position: absolute
#                 top: -1px
#                 right: 0%
#                 margin-right: -20px
#                 animation: blink 2000ms linear infinite 
                
#         &.network-to
#             right: 40px  
#             color: #ce942c 
#             &:before
#                 content: "→"
#                 color: #61d6b0
#                 font-size: 15px
#                 font-weight: bold
#                 position: absolute
#                 top: -1px
#                 left: 0%
#                 margin-left: -30px
#                 animation: blink 2000ms linear infinite 
#     .arrow-right
#         font-size: 15px
#         font-weight: bold
#         position: absolute
#         top: 28px
#         z-index: 2
#         width: 30px
#         left: -40px
#         right: 0
#         margin: auto 
#         color: #61d6b0
#         animation: blink 2000ms linear infinite 
#         text-shadow: -2px 2px #5a6dda 
#         @media(max-width: 600px)
#             display: none
#         &:nth-child(1)
#             animation-delay: 1s 
#         &:nth-child(2)
#             animation-delay: 1.1s   
#         &:nth-child(3)
#             animation-delay: 1.2s
#         &:nth-child(4)
#             animation-delay: 1.3s
#         &:nth-child(5)
#             animation-delay: 1.4s
        
            
#     .navigation-button
#         transition: opacity 0.2
#         &:hover
#             opacity: 0.9
#         .button-inner
#             position: relative
#             img
#                 height: 15px !important
#                 top: 0 !important
module.exports = ({ web3t, wallet, store, id, on-change })->
    return null if not wallet.network.networks?
    #return null if not store.current.send.chosenNetwork?
    return null if not (store.current.send.isSwap? and store.current.send.isSwap is yes)
    return null if not wallet.network.networks? or Object.keys(wallet.network.networks).length is 0
    wallets = store.current.account.wallets |> map (-> [it.coin.token, it]) |> pairs-to-obj 
    available-networks = 
        wallet.network.networks 
            |> obj-to-pairs
            |> filter (-> it.disabled isnt yes)
            |> filter (it)-> 
                wallets[it[1].referTo]? and ((not it[1].disabled?) or it[1].disabled is no)
            |> pairs-to-obj
    network-labels = Object.keys(available-networks)
    return null if network-labels.length is 0
    getNetworkById = (id)->
        available-networks["#{id}"]
    style = get-primary-info store
    style2 = 
        color: "#{style.app.icon}"
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
        return if lenght <= 1
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
        err <- on-change!
    
    goback = go(-1)
    goForw = go(1)
    
    
    { name, referTo } = store.current.send.chosen-network
    wallet2 = store.current.account.wallets |> find (-> (it?coin?token ? "").to-lower-case! is (referTo ? "").to-lower-case!)
    network-from = (wallet?coin?name ? "") 
    network-to   = (name ? "") 
    
    network-to-details = ->
        store.current.current-network-details = store.current.foreign-network-details <<<< { wallet: wallet2 }
        network-details-modal!
          
    network-from-details = ->
        store.current.current-network-details = store.current.network-details <<<< { wallet }
        network-details-modal!
    
    /* Render */
    react.create-element 'div', { className: 'network-slider network-slider243580078' }, children = 
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