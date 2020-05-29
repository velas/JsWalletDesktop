require! {
    \react
    \react-dom
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../icons.ls
    \../math.ls : { div, times, plus, minus }
    \../staking/can-make-staking.ls
    \../components/amount-field.ls
}
# .steps47089543
#     @media(max-width:800px)
#         text-align: center
#     .step
#         display: inline-block
#         vertical-align: text-top
#         text-align: center
#         padding: 0 20px 0 0
#         margin-right: 20px
#         margin-bottom: 20px
#         width: 140px
#         opacity: .6
#         position: relative
#         cursor: pointer
#         transition: all .5s
#         @media(max-width:800px)
#             padding: 0 10px
#             width: auto
#             margin: 0 auto 30px
#             display: block
#         &:last-child
#             &:after
#                 content: none !important
#         &:after    
#             display: block
#             left: 150px
#             top: 18px
#             position: absolute
#             border-top: 2px solid grey
#             width: 20%
#             content: ""
#             @media(max-width:800px)
#                 content: none
#         .step-content
#             font-size: 13px
#         button
#             width: auto
#             display: block
#             margin: 15px auto 0
#         .step-count
#             display: inline-block
#             background: grey
#             padding: 10px 15px
#             border-radius: 50px
#             margin-bottom: 20px
#         &.active
#             opacity: 1
#             .step-count
#                 background: #39dcb4
#                 animation: pulse_step 1s linear
#                 transform-origin: 50% 50%
#             &:after    
#                 display: block
#                 left: 150px
#                 top: 18px
#                 position: absolute
#                 border-top: 2px solid #3cd5af
#                 width: 20%
#                 content: ""
#                 @media(max-width:800px)
#                     content: none
#     @keyframes pulse_step
#         0%
#             transform: scale(0.8)
#         25%
#             transform: scale(0.9)
#         50%
#             transform: scale(1.1)
#         100%
#             transform: scale(1)
cb = console~log
max-withdraw-ordered = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    button-primary4-style=
        border: "1px solid #{style.app.primary4}"
        color: style.app.text
        background: style.app.primary4
    activate = (step)-> ->
        store.current.step = step 
    activate-first = activate \first
    activate-second = activate \second
    activate-third = activate \third
    active-class = (step)->
        active-tab =
            | +store.staking.orderedWithdrawAmount is 0 => \first
            | store.staking.wait-for-epoch-change is yes => \second
            | +store.staking.orderedWithdrawAmount > 0 => \third
        if active-tab is step then 'active' else ''
    active-first = active-class \first
    active-second = active-class \second
    active-third = active-class \third
    order = ->
        err, data <- web3t.velas.Staking.areStakeAndWithdrawAllowed!
        return cb err if err?
        return alert store, "Stake and Withdraw is not allowed right now", cb if data isnt yes
        staking-address = store.staking.keystore.staking.address
        pool-address = store.staking.chosen-pool.address
        err, max <- web3t.velas.Staking.maxWithdrawOrderAllowed(pool-address, staking-address)
        amount = store.staking.maxWithdrawOrderAllowed
        return alert store, "max is #{max.to-fixed!}" if +amount > +max.to-fixed!
        return alert store, "Max Withdraw Orer Allowed is 0 now", cb if +amount is 0
        data = web3t.velas.Staking.order-withdraw.get-data(pool-address, amount)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }        
    exit = ->
        #maxWithdrawOrderAllowed
        return alert store, "No Ordered Amount", cb if +store.staking.orderedWithdrawAmount is 0
        pool-address = store.staking.chosen-pool.address
        #staking-address = store.staking.keystore.staking.address
        data = web3t.velas.Staking.claimOrderedWithdraw.get-data(pool-address)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
    change-max = (it)->
        store.staking.maxWithdrawOrderAllowed = it.target.value
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}, ' Exit'
        react.create-element 'div', { className: 'description' }, children = 
            react.create-element 'div', { className: 'left' }, children = 
                react.create-element 'div', { className: 'steps steps47089543' }, children = 
                    react.create-element 'div', { on-click: activate-first, className: "#{active-first} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 1'
                        react.create-element 'div', { className: 'step-content' }, children = 
                            react.create-element 'div', {}, ' Please click the "Request exit" button'
                            if active-first is \active
                                react.create-element 'div', {}, children = 
                                    react.create-element 'div', {}, children = 
                                        amount-field { store, value: store.staking.maxWithdrawOrderAllowed, on-change: change-max }
                                    react.create-element 'button', { style: button-primary4-style, on-click: order }, children = 
                                        react.create-element 'span', {}, children = 
                                            react.create-element 'img', { src: "#{icons.exit}", className: 'icon-svg' }
                                            """ Request exit"""
                    react.create-element 'div', { on-click: activate-second, className: "#{active-second} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 2'
                        react.create-element 'div', { className: 'step-content' }, ' Come back in later for a your staking amount'
                    react.create-element 'div', { on-click: activate-third, className: "#{active-third} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 3'
                        react.create-element 'div', { className: 'step-content' }, children = 
                            react.create-element 'div', {}, ' Withdraw the staking amount'
                            if active-third is \active
                                react.create-element 'button', { style: button-primary4-style, on-click: exit }, children = 
                                    react.create-element 'span', {}, children = 
                                        react.create-element 'img', { src: "#{icons.exit}", className: 'icon-svg' }
                                        """ Withdraw"""
max-withdraw = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    button-primary4-style=
        border: "1px solid #{style.app.primary4}"
        color: style.app.text
        background: style.app.primary4
    exit = ->
        err <- can-make-staking store, web3t
        return alert store, err, cb if err?
        #err, data <- web3t.velas.Staking.areStakeAndWithdrawAllowed!
        #return cb err if err?
        #return alert "Exit is not allowed. Please wait for epoch change" if data isnt yes
        staking-address = store.staking.keystore.staking.address
        pool-address = store.staking.chosen-pool.address
        err, max <- web3t.velas.Staking.maxWithdrawAllowed(pool-address, staking-address)
        amount = store.staking.maxWithdrawAllowed
        return alert store, "max is #{max.to-fixed!}" if +amount > +max.to-fixed!
        #console.log "web3t.velas.Staking.maxWithdrawAllowed('#{pool-address}', '#{staking-address}')"
        return alert store, "Max Withdraw Allowed is 0", cb if +amount is 0
        data = web3t.velas.Staking.withdraw.get-data(pool-address, amount)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 } 
    change-max = (it)->
        store.staking.maxWithdrawAllowed = it.target.value
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}, ' Exit'
        react.create-element 'div', { className: 'description' }, children = 
            react.create-element 'div', {}, ' Withdraw the staking amount'
            react.create-element 'div', {}, children = 
                amount-field { store, value: store.staking.maxWithdrawOrderAllowed, on-change: change-max }
            react.create-element 'button', { style: button-primary4-style, on-click: exit }, children = 
                react.create-element 'span', {}, children = 
                    react.create-element 'img', { src: "#{icons.exit}", className: 'icon-svg' }
                    """ Withdraw"""
module.exports = (store, web3t)->
    return max-withdraw-ordered store, web3t if +store.staking.orderedWithdrawAmount > 0
    return max-withdraw-ordered store, web3t if +store.staking.maxWithdrawOrderAllowed > 0
    return max-withdraw store, web3t if +store.staking.maxWithdrawAllowed > 0
    null
module.exports.init = ({ store, web3t}, cb)->
    store.staking.maxWithdrawAllowed = 0
    store.staking.maxWithdrawOrderAllowed = 0
    store.staking.orderedWithdrawAmount = 0
    staking-address = store.staking.keystore.staking.address
    pool-address = store.staking.chosen-pool.address
    err, max <- web3t.velas.Staking.maxWithdrawAllowed(pool-address, staking-address)
    return cb err if err?
    store.staking.maxWithdrawAllowed = max.to-fixed! `div` (10^18)
    err, max <- web3t.velas.Staking.maxWithdrawOrderAllowed(pool-address, staking-address)
    return cb err if err?
    store.staking.maxWithdrawOrderAllowed = max.to-fixed! `div` (10^18)
    err, amount <- web3t.velas.Staking.orderedWithdrawAmount store.staking.chosen-pool.address, staking-address
    return cb err if err?
    store.staking.orderedWithdrawAmount = amount.to-fixed!
    cb null