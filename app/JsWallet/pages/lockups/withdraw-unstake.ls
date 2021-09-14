require! {
    \react
    \react-dom
    \../../get-primary-info.ls
    \../../web3.ls
    \../../get-lang.ls
    \../../icons.ls
    \prelude-ls : { map, split, filter, find, foldl, sort-by, unique, head, each }
    \../../math.ls : { div, times, plus, minus }
    \../../../web3t/addresses.js : { ethToVlx }
    \../../staking/can-make-staking.ls
    \../../components/amount-field.ls
    \../../components/button.ls
    \../confirmation.ls : { alert }
}
# .steps2030851689
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
#             button
#                 width: 125px
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
order-withdraw-process = (store, web3t)->
    lang = get-lang store
    activate = (step)-> ->
        store.lockups.exit-tab = step
    activate-first = activate \unstake_order
    activate-second = activate \unstake_wait
    activate-third = activate \unstake_ordered
    active-class = (step)->
        if store.lockups.exit-tab is step then \active else ''
    active-first = active-class \unstake_order
    active-second = active-class \unstake_wait
    active-third = active-class \unstake_ordered
    order = ->
        #err, data <- web3t.velas.Staking.areStakeAndWithdrawAllowed!
        #return cb err if err?
        #return alert store, lang.exitNotAllowed, cb if data isnt yes
        pool-address = store.lockups.chosen-lockup.address
        contract-address = store.lockups.chosen-lockup.address
        Timelock = web3t.velas.Timelock.at(contract-address)
        err, max <- Timelock.maxWithdrawAllowed!
        amount = store.lockups.withdrawAmount `times` (10^18)
        return alert store, "#{lang.max} #{max.to-fixed! `div` (10^18)}" if +amount > +max.to-fixed!
        return alert store, lang.actionProhibited, cb if +amount is 0
        data = Timelock.requestUnstake.get-data(pool-address, amount)
        to = Timelock.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
    exit = ->
        return alert store, lang.actionProhibited, cb if +store.lockups.orderedWithdrawAmount is 0
        pool-address = store.lockups.chosen-lockup.locked-pool
        data = web3t.velas.Staking.claimOrderedWithdraw.get-data(pool-address)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
    change-max = (it)->
        store.lockups.withdrawAmount = it.target.value
    epoch-next = store.dashboard.epoch-next ? 'loading...'
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}, ' ' + lang.unstake
        react.create-element 'div', { className: 'description' }, children = 
            react.create-element 'div', { className: 'left' }, children = 
                react.create-element 'div', { className: 'steps steps2030851689' }, children = 
                    react.create-element 'div', { on-click-commented: activate-first, className: "#{active-first} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 1'
                        react.create-element 'div', { className: 'step-content' }, children = 
                            react.create-element 'div', {}, ' ' + lang.requestExit
                            if active-first is \active
                                react.create-element 'div', {}, children = 
                                    react.create-element 'div', {}, children = 
                                        amount-field { store, value: store.lockups.withdrawAmount, on-change: change-max }
                                    button { store, text: lang.requestExit, icon: 'exit', on-click: order, type: "secondary" }
                    react.create-element 'div', { on-click-commented: activate-second, className: "#{active-second} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 2'
                        react.create-element 'div', { className: 'step-content' }, ' ' + lang.comeBack
                    react.create-element 'div', { on-click-commented: activate-third, className: "#{active-third} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 3'
                        react.create-element 'div', { className: 'step-content' }, children = 
                            react.create-element 'div', {}, ' ' + lang.withdraw
                            if active-third is \active
                                button { store, text: lang.withdraw, icon: 'exit', on-click: exit, type: "secondary" }
fast-withdraw-process = (store, web3t)->
    lang = get-lang store
    withdraw = ->
        err <- can-make-staking store, web3t
        return alert store, err, cb if err?
        {address, lockedPool, maxWithdrawAllowed} = store.lockups.chosen-lockup
        lockup-address = store.lockups.chosen-lockup.address
        Timelock = web3t.velas.Timelock.at(lockup-address)
        contract-address = Timelock.address
        amount = store.lockups.withdrawAmount `div` (10^18)
        return alert store, lang.actionProhibited, cb if +amount is 0 
        vlx2 =
            store.current.account.wallets |> find (.coin.token is \vlx2)
        vlx-address = vlx2.address2    
        data = Timelock.withdraw.get-data(vlx-address, amount)     
        to = contract-address
        err <- web3t.vlx2.send-transaction { to, data, amount: 0 }
#    exit = ->
#        err <- can-make-staking store, web3t
#        return alert store, err, cb if err?
#        staking-address = store.lockups.currentTimelock.address
#        pool-address = store.lockups.chosen-lockup.locked-pool
#        err, max <- store.lockups.currentTimelock.maxWithdrawAllowed(pool-address, staking-address)
#        amount = store.lockups.withdrawAmount `times` (10^18)
#        return alert store, "#{lang.max} #{max `div` (10^18)}" if +amount > +max.to-fixed!
#        return alert store, lang.actionProhibited, cb if +amount is 0
#        data = store.lockups.currentTimelock.withdraw.get-data(pool-address, amount)
#        to = store.lockups.currentTimelock.address
#        amount = 0
#        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
    change-max = (it)->
        store.lockups.withdrawAmount = it.target.value
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}, ' ' + lang.exit
        react.create-element 'div', { className: 'description' }, children = 
            react.create-element 'div', {}, ' ' + lang.withdraw
            react.create-element 'div', {}, children = 
                amount-field { store, value: store.lockups.withdrawAmount, on-change: change-max }
            button { store, text: lang.withdraw, icon: 'exit', on-click: withdraw, type: "secondary" }
not-available-right-now = (store)->
    lang = get-lang store
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}, ' ' + lang.exit
        react.create-element 'div', { className: 'description' }, children = 
            react.create-element 'div', {}, ' ' + lang.actionProhibited
registry =
    \unstake_ordered : order-withdraw-process
    \unstake_order   : order-withdraw-process
    \unstake_wait    : order-withdraw-process
    \exit         : fast-withdraw-process
    \unstake_closed  : not-available-right-now
module.exports = (store, web3t)->
    func = registry[store.lockups.exit-tab]
    return null if not func?
    func store, web3t
module.exports.init = ({ store, web3t}, cb)->
    store.lockups.exit-tab = ''
    store.lockups.maxWithdrawAllowed = 0
    store.lockups.maxWithdrawOrderAllowed = 0
    store.lockups.orderedWithdrawAmount = 0
    contract-address = store.lockups.chosen-lockup.address
    Timelock = web3t.velas.Timelock.at(contract-address)
    console.log "Timelock" Timelock
    staking-address = Timelock.address
    return cb null if not store.lockups.chosen-lockup.locked-pool?
    pool-address = store.lockups.chosen-lockup.locked-pool
    #console.log \ext-stake, staking-address, pool-address
    console.log "0"
    err, max <- Timelock.maxWithdrawAllowed!
    console.log "Timelock.maxWithdrawAllowed" max
    return cb err if err?
    store.lockups.maxWithdrawAllowed = max.to-fixed! `div` (10^18)
    store.lockups.withdrawAmount = store.lockups.maxWithdrawAllowed if +store.lockups.maxWithdrawAllowed > 0
    StakingLockup = web3t.velas.StakingLockup.at(Timelock.address)
    console.log "StakingLockup" StakingLockup
    #err, max <- StakingLockup.maxWithdrawOrderAllowed(pool-address, staking-address)
    #console.log "err, max" err, max
    #return cb err if err?
    console.log "1"
    store.lockups.maxWithdrawOrderAllowed = max.to-fixed! `div` (10^18)
    store.lockups.withdrawAmount = store.lockups.maxWithdrawOrderAllowed if +store.lockups.maxWithdrawOrderAllowed > 0
    amount = max
    console.log "2"
    #store.lockups.orderedWithdrawAmount = amount.to-fixed!
    store.lockups.orderedWithdrawAmount = 0
    #err, last-epoch <- web3t.velas.StakingLockup.at(Timelock.address).orderWithdrawEpoch(pool-address, staking-address)
    #return cb "#{err}" if err?
    console.log "3"
    #err, staking-epoch <- web3t.velas.StakingLockup.at(Timelock.address).stakingEpoch
    #return cb "#{err}" if err?
    console.log "4"
    #res = staking-epoch `minus` last-epoch
    res = no
    store.lockups.wait-for-epoch-change = if +res is 0 then yes else no
    store.lockups.exit-tab =
        | +store.lockups.orderedWithdrawAmount > 0 and store.lockups.wait-for-epoch-change => \unstake_wait
        | +store.lockups.orderedWithdrawAmount > 0 => \unstake_ordered
        | +store.lockups.maxWithdrawAllowed > 0 => \exit
        | +store.lockups.maxWithdrawOrderAllowed > 0 => \unstake_order
        | +store.lockups.stake-amount-total > 0 => \unstake_closed
        | _ => ''
    cb null