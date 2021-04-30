require! {
    \react
    \react-dom
    \../../navigate.ls
    \../../get-primary-info.ls
    \../../web3.ls
    \bignumber.js
    \../../get-lang.ls
    \../../history-funcs.ls
    \../../staking-funcs.ls : { get-all-active-stake }
    \../icon.ls
    \prelude-ls : { map, split, filter, find, foldl, sort-by, unique, head, each }
    \../../math.ls : { div, times, plus, minus }
    \../../velas/velas-node-template.ls
    \../../../web3t/providers/deps.js : { hdkey, bip39 }
    \md5
    \../../menu-funcs.ls
    \btoa
    \safe-buffer : { Buffer }
    \../../copied-inform.ls
    \../../copy.ls
    \../../round5.ls
    \../../../web3t/addresses.js : { ethToVlx, vlxToEth }
    \../switch-account.ls
    \../../round-human.ls
    \../../round-number.ls
    \../../icons.ls
    \../placeholder.ls
    \../epoch.ls
    \../confirmation.ls : { alert, notify, confirm, prompt2 }
    \../../components/button.ls
    \../../components/address-holder.ls
    \../alert-txn.ls
    \../../components/amount-field.ls
    \../../seed.ls : seedmem
    \../../components/burger.ls
}
# .staking-146665425
#     @import scheme
#     position: relative
#     display: block
#     width: auto
#     margin-left: $left-margin
#     top: 0
#     height: auto
#     min-height: 100vh
#     padding-top: 5%
#     box-sizing: border-box
#     padding: 0px
#     background: transparent
#     .buttons
#         display: flex
#     .usd-amount
#         opacity: 0.65
#         font-size: 10px
#         margin-left: 10px
#     .loader
#         svg
#             width: 12px
#             cursor: pointer
#         &.spin > svg
#             @keyframes spin
#                 from
#                     transform: rotate(0deg)
#                 to
#                     transform: rotate(360deg)
#             animation-name: spin
#             animation-duration: 4000ms
#             animation-iteration-count: infinite
#             animation-timing-function: linear
#         &.disabled
#             opacity: 0.3
#     .myStakeMaxPart
#         margin-left: 20px
#         opacity: 0.3
#     .icon-right
#         height: 12px
#         top: 2px
#         position: relative
#     .pad
#         padding: 0 5px
#     .pad-bottom
#         padding-bottom: 5px
#     @media(max-width:$ipad)
#         width: 100%
#         margin: 0
#     .float-left
#         float: left
#     .float-right
#         float: right
#     span.color
#         color: #cc8b1a
#         font-weight: bold
#     .staking-content
#         overflow: hidden
#         background: transparent
#         width: 100%
#         border-radius: 0px
#         position: relative
#         box-sizing: border-box
#         .claim-table
#             max-height: 100px
#             width: 300px
#             overflow-y: auto
#             background: rgb(90, 26, 154)
#             @media(max-width:800px)
#                 margin: 15px auto
#             tbody
#                 background: rgb(45, 15, 85)
#             table
#                 width: 100%
#                 tr
#                     padding: 0
#                     margin: 0
#                     td
#                         width: 33%
#                         &:first-child
#                             text-align: center
#         .left-proxy, .right-proxy
#             width: 15px
#             height: 16px
#             line-height: 10px
#             display: inline-block
#             color: white
#             padding: 9px
#             border-radius: 0px
#             cursor: pointer
#             vertical-align: top
#             text-align: center
#         .form-group
#             text-align: center
#             padding-top: 0px
#             input, textarea
#                 margin: 5px 0
#                 outline: none
#             .section
#                 border-bottom: 1px solid rgba(240, 237, 237, 0.16)
#                 padding: 20px 20px
#                 display: flex
#                 .chosen-account
#                     .buttons
#                         text-align: left
#                         @media(max-width:800px)
#                             text-align: center
#                     span
#                         @media (max-width: 800px)
#                             font-size: 14px
#                     .check
#                         width: 15px
#                         height: 15px
#                         margin-left: 10px
#                         vertical-align: middle
#                         animation: pulse_check 1s linear
#                         transform-origin: 50% 50%
#                     @keyframes pulse_check
#                         0%
#                             transform: scale(0)
#                         25%
#                             transform: scale(0.5)
#                         50%
#                             transform: scale(1.6)
#                         100%
#                             transform: scale(1)
#                 @media (max-width: 800px)
#                     display: flow-root
#                     padding: 20px
#                 &:last-child
#                     border: 0
#                 &.reward
#                     background-image: $reward
#                     background-repeat: no-repeat
#                     background-position: 80%
#                     background-size: auto
#                     background-color: rgba(111, 50, 162, 0.15)
#                     @media(max-width: 800px)
#                         background-position: 5%
#                     @media(max-width: 540px)
#                         background-image: none
#                 .title
#                     padding: 0px
#                     padding-right: 10px
#                     width: 30%
#                     min-width: 150px
#                     text-align: left
#                     text-transform: uppercase
#                     font-size: 14px
#                     @media (max-width: 800px)
#                         width: 100%
#                         margin-bottom: 20px
#                         text-align: left
#                     .less
#                         font-size: 10px
#                         opacity: 0.9
#                 .description
#                     padding: 0px
#                     font-size: 14px
#                     width: 80%
#                     text-align: left
#                     hr
#                         margin: 15px auto
#                         border: 1px solid rgba(240, 237, 237, 0.16)
#                         border-top: 0
#                     .chosen-pool
#                         margin-bottom: 10px
#                         .color
#                             color: orange
#                             font-weight: 600
#                     &.min-height
#                         max-height: 300px
#                         overflow: scroll
#                         table
#                             td,td
#                                 padding: 0 3px
#                         .choose-pool
#                             max-width: 50px
#                     &.table-scroll
#                         overflow-x: scroll
#                         background: linear-gradient(var(--color1) 30%, rgba(50,18,96, 0)), linear-gradient(rgba(50,18,96, 0), var(--color1) 70%) 0 100%, radial-gradient(farthest-side at 50% 0, var(--color2), rgba(0,0,0,0)), radial-gradient(farthest-side at 50% 100%, var(--color2), rgba(0,0,0,0)) 0 100%
#                         background-repeat: no-repeat
#                         background-attachment: local, local, scroll, scroll
#                         background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
#                         animation: breathe 3s ease-in infinite
#                         -moz-transition: breathe 3s ease-in infinite
#                         -web-kit-transition: breathe 3s ease-in infinite
#                         height: auto
#                         max-height: 400px
#                         .stake-pointer
#                             background: rgb(37, 87, 127)
#                         &.lockup
#                             height: auto
#                         .address-holder
#                             a
#                                 padding-left: 30px !important
#                             .browse
#                                 right: 30px !important
#                         thead
#                             th
#                                 @media(min-width:800px) and (max-width: 900px)
#                                     font-size: 11px !important
#                         td
#                             &:nth-child(2)
#                                 cursor: pointer
#                             &.with-stake
#                                 filter: saturate(6.5)
#                         tr
#                             &.chosen
#                                 background: #305673
#                             &.active
#                                 color: var(--color-td)
#                             &.inactive
#                                 color: orange
#                             &.banned
#                                 color: red
#                             .circle
#                                 border-radius: 0px
#                                 width: 20px
#                                 height: 20px
#                                 display: inline-block
#                                 color: white
#                                 line-height: 1.6
#                                 border-radius: 4px
#                                 background: gray
#                                 &.active
#                                     background: rgb(38, 219, 85)
#                                 &.inactive
#                                     background: orange
#                                 &.banned
#                                     background: red
#                         button
#                             width: 100%
#                             height: 36px
#                             margin: 0
#                     table
#                         width: 100%
#                         border-collapse: collapse
#                         margin: 0px auto
#                     tr:nth-of-type(odd)
#                         background: rgba(gray, 0.2)
#                     th
#                         font-weight: 400
#                         &:first-child
#                             text-align: center
#                             width: 5%
#                     td
#                         &:nth-child(1), &:nth-child(6)
#                             text-align: center
#                         img.copy
#                             height: 16px
#                             margin-right: 5px
#                     td, th
#                         padding: 8px
#                         max-width: 200px
#                         border: 1px solid rgba(240, 237, 237, 0.16)
#                         white-space: nowrap
#                         font-size: 13px
#                         @media(max-width:800px)
#                             text-align: left
#                     .left
#                         position: relative
#                         .small-btns
#                             line-height: 36px
#                             button.small
#                                 outline: none
#                                 border-radius: $border
#                                 line-height: 10px
#                                 text-align: center
#                                 height: 16px
#                                 font-size: 10px
#                                 font-weight: 600
#                                 margin-top: 0
#                                 width: auto
#                                 margin-right: 10px
#                                 padding: 2px 5px
#                                 cursor: pointer
#                     @media (max-width: 800px)
#                         width: 100%
#                         text-align: right
#                     .important
#                         color: orange
#                     .left-node
#                         width: 40%
#                         float: left
#                         @media (max-width: 800px)
#                             width: 100%
#                             text-align: center
#                             margin-bottom: 20px
#                         @media (min-width: 801px) and (max-width: 992px)
#                             width: 50%
#                         img
#                             width: 240px
#                     .right-node
#                         width: 60%
#                         float: right
#                         @media (max-width: 800px)
#                             width: 100%
#                             text-align: center
#                         @media (min-width: 801px) and (max-width: 992px)
#                             width: 50%
#                             text-align: left
#                     &.node
#                         width: 80%
#                     .tabs
#                         display: inline-block
#                         margin: 20px 0 20px
#                         width: 100%
#                         .tab
#                             width: 25%
#                             display: inline-block
#                             opacity: 0.5;
#                             text-align: center
#                             border-bottom: 1px solid
#                             line-height: 37px
#                             text-transform: uppercase
#                             font-size: 10px
#                             font-weight: bold
#                             cursor: pointer
#                             height: 36px
#                             background: #2c0d5f
#                             border-color: #6b258e
#                             @media (max-width: 800px)
#                                 width: 50%
#                             &.active
#                                 opacity: 1
#                                 border-bottom: 1px solid #6e1d96
#                                 background: #37156d
#                     .btn
#                         margin: 10px 20px 10px 0
#                         @media (max-width: 800px)
#                             margin: 10px auto 0
#                     .step-content
#                         .btn
#                             margin: 10px auto 0
#                     .code
#                         overflow: scroll
#                         background: #1b1b1b
#                         text-align: left
#                         .copy
#                             float: right
#                             margin-top: 11px
#                             margin-right: 10px
#                             width: 15px
#                         .cursor
#                             -webkit-animation: blink 0.9s infinite
#                             animation: blink 0.9s infinite
#                             font: initial
#                             display: inline-block
#                             opacity: 1
#                             margin-left: 5px
#                         @-webkit-keyframes blink
#                             0%
#                                 opacity: 1
#                             50%
#                                 opacity: 0
#                             100%
#                                 opacity: 1
#                         @keyframes blink
#                             0%
#                                 opacity: 1
#                             50%
#                                 opacity: 0
#                             100%
#                                 opacity: 1
#                         &.comming
#                             background: transparent
#                             text-align: center
#                     .window
#                         position: sticky
#                         top: 0
#                         left: 0
#                         height: 39px
#                         background: #040404
#                         .icons
#                             padding: 0.75em
#                             position: absolute
#                             span
#                                 background: #040404
#                             &:before
#                                 content: ""
#                                 background: #040404
#                             &:after
#                                 content: ""
#                                 background: #040404
#                             span, &:before, &:after
#                                 display: inline-block
#                                 float: left
#                                 width: 1em
#                                 height: 1em
#                                 border-radius: 50%
#                                 margin-right: 0.5em
#                     .balance
#                         font-size: 14px
#                         .color
#                             color: orange
#                             font-weight: 600
#                         .label-coin
#                             left: 3px
#                             top: 2px
#                             padding-right: 2px
#                             height: 15px
#                             position: relative
#                             color: orange
#                             font-weight: 600
#                     textarea
#                         border: 0
#                         padding: 10px
#                         font-size: 13px
#                         width: 100%
#                         box-sizing: border-box
#                         min-height: 120px
#                         font-family: monospace
#                 .content
#                     width: 30%
#                     position: relative
#                     button, .switch-index
#                         margin: 0
#                         position: absolute
#                         top: 50%
#                         left: 40%
#                         -ms-transform: translateY(-50%)
#                         transform: translateY(-50%)
#             .center
#                 text-align: center
#             .left
#                 text-align: left
#             label
#                 font-size: 13px
#             h3
#                 font-size: 12px
#                 text-transform: uppercase
#                 letter-spacing: 2px
#                 opacity: .8
#                 font-weight: 400
#                 margin: 0
#             input[type="radio"]
#                 height: auto
#                 width: auto
#                 margin: 0 40%
#                 cursor: pointer
#             input[type="checkbox"]
#                 height: auto
#                 width: auto
#                 margin: 0 40%
#                 cursor: pointer
#             input
#                 outline: none
#                 width: 100%
#                 box-sizing: border-box
#                 height: 36px
#                 line-height: 36px
#                 border-radius: 0
#                 padding: 0px 10px
#                 font-size: 14px
#                 margin: 5px 0
#                 border: 0px
#                 box-shadow: none
#                 &.change-index
#                     margin: 0 !important
#                     border-radius: 0px
#                     height: 36px
#                     width: 55px
#                     line-height: 36px
#                     text-align: center
#                     font-size: 13px
#     ul
#         padding: 0
#         margin: 0
#         min-width: 100%
#         max-width: 300px
#         li
#             list-style: none
#             margin-left: 0
#             font-size: 13px
#             color: #6f6fe2
#             font-size: 16px
#             list-style-position: inside
#             white-space: nowrap
#             overflow: hidden
#             text-overflow: ellipsis
#             @media (max-width: 800px)
#                 text-align: center
#     .yesno
#         &.Yes
#             background: rgba(60, 213, 175, 0.2)
#             color: #3cd5af
#         &.No
#             background: rgba(236, 146, 146, 0.2)
#             color: #d85757
#     .noyes
#         &.Yes
#             background: rgba(236, 146, 146, 0.2)
#             color: #d85757
#         &.No
#             background: rgba(60, 213, 175, 0.2)
#             color: #3cd5af
#     button
#         background-color: $primary
#         border: 1px solid $primary
#         border-radius: $border
#         color: white
#         height: 36px
#         width: 125px
#         padding: 0 6px
#         margin-top: 10px
#         text-decoration: none
#         text-transform: uppercase
#         font-size: 10px
#         font-weight: bold
#         cursor: pointer
#         outline: none
#         display: inline-block
#         text-overflow: ellipsis
#         overflow: hidden
#         white-space: nowrap
#         &.mt-0
#             margin-top: 0
#         &:hover
#             background: transparent
#             color: $primary
#         &.link
#             min-width: 190px
#     >.title
#         position: sticky
#         position: -webkit-sticky
#         z-index: 1
#         background: var(--background)
#         box-sizing: border-box
#         top: 0
#         width: 100%
#         color: gray
#         font-size: 22px
#         padding: 10px
#         height: 60px
#         >.header
#             margin: 5px
#             text-align: center
#             @media(max-width:800px)
#                 text-align: center
#         &:checked + label:before
#             background-color: #3cd5af
#             border-color: #3cd5af
#             color: #fff
cb = console.log
as-callback = (p, cb)->
    p.catch (err) -> cb err
    p.then (data)->
        cb null, data
to-keystore = (store, with-keystore)->
    mnemonic = seedmem.mnemonic
    seed = bip39.mnemonic-to-seed(mnemonic)
    wallet = hdkey.from-master-seed(seed)
    index = store.current.account-index
    password = md5 wallet.derive-path("m1").derive-child(index).get-wallet!.get-address!.to-string(\hex)
    staking =
        | store.url-params.anotheracc? => { address: window.toEthAddress(store.url-params.anotheracc) }
        | _ => get-pair wallet, \m0 , index, password, no
    mining  = get-pair wallet, \m0/2 , index, password, with-keystore
    { staking, mining, password }
show-validator = (store, web3t)-> (validator)->
    react.create-element 'li', {}, ' ' + validator
staking-content = (store, web3t)->
    { go-back } = history-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    seed-style =
        background: style.app.primary2
        background-color: style.app.primary2-spare
        padding: 5px
    filter-icon=
        filter: style.app.filterIcon
    comming-soon =
        opacity: ".3"
    pairs = store.staking.keystore
    i-stake-choosen-pool = ->
        account = store.staking.chosenAccount
        myStake = +account.myStake
        myStake >= 10000
    wallet =
        store.current.account.wallets
            |> find -> it.coin.token is \vlx_native
    delegate = ->
        return null if not wallet?
        #err, options <- get-options
        #return alert store, err, cb if err?
        #err <- can-make-staking store, web3t
        #return alert store, err, cb if err?
        return alert store, "please choose the account", cb if not store.staking.chosenAccount?
        account = store.staking.chosenAccount
        #
        pay-account = store.staking.accounts |> find (-> it.address is account.address)
        return cb null if not pay-account
        console.log ""
        err, result <- as-callback web3t.velas.NativeStaking.delegate(pay-account.address, account.address)
        console.log "result" result
        console.error "Result sending:" err if err?
        alert store, err.toString! if err?
        <- notify store, "FUNDS DELEGATED"
        navigate store, web3t, \validators
    velas-node-applied-template =
        pairs
            |> velas-node-template
            |> split "\n"
    velas-node-applied-template-line =
        pairs
            |> velas-node-template
            |> btoa
            |> -> "echo '#{it}' | base64 --decode | sh"
    return null if not pairs.mining?
    {  account-left, account-right, change-account-index } = menu-funcs store, web3t
    update-current = (func)-> (data)->
        func data
        <- staking.init { store, web3t }
        store.staking.keystore = to-keystore store, no
    account-left-proxy   = update-current account-left
    account-right-proxy  = update-current account-right
    change-account-index-proxy = update-current change-account-index
    line-style =
        padding: "10px"
        width: \100%
    activate = (tab)-> ->
        store.staking.tab = tab
    activate-line = activate \line
    activate-string = activate \string
    activate-ssh = activate \ssh
    activate-do = activate \do
    active-class = (tab)->
        if store.staking.tab is tab then 'active' else ''
    active-line = active-class \line
    active-string = active-class \string
    active-ssh = active-class \ssh
    active-do = active-class \do
    get-balance = ->
        wallet =
            store.current.account.wallets
                |> find -> it.coin.token is \vlx2
        wallet.balance
    get-options = (cb)->
        i-am-staker = i-stake-choosen-pool!
        return cb null if i-am-staker
        err, data <- web3t.velas.Staking.candidateMinStake
        return cb err if err?
        min =
            | +store.staking.stake-amount-total >= 10000 => 1
            | _ => data `div` (10^18)
        balance = get-balance! `minus` 0.1
        stake = store.staking.add.add-validator-stake
        return cb lang.amountLessStaking if 10000 > +stake
        return cb lang.balanceLessStaking if +balance < +stake
        max = +balance
        cb null, { min, max }
    use-min = ->
        #err, options <- get-options
        #return alert store, err, cb if err?
        store.staking.add.add-validator-stake = 10000
    use-max = ->
        #err, options <- get-options
        #return alert store, err, cb if err?
        store.staking.add.add-validator-stake = Math.max (get-balance! `minus` 0.1), 0
    your-balance = " #{store.staking.chosenAccount.balance} "
    your-staking-amount = store.staking.stakeAmountTotal `div` (10^18)
    your-staking = " #{round-human your-staking-amount}"
    vlx-token = "VLX"
    isSpinned = if ((store.staking.all-pools-loaded is no or !store.staking.all-pools-loaded?) and store.staking.pools-are-loading is yes) then "spin disabled" else ""
    cancel-pool = ->
        store.staking.chosenAccount = null
    refresh = ->
        store.staking.all-pools-loaded = no
        store.staking.getAccountsFromCashe = no
        if ((store.staking.all-pools-loaded is no or !store.staking.all-pools-loaded?) and store.staking.pools-are-loading is yes)
            return no
        store.staking.pools-are-loading = yes
        cb = console.log
        #store.staking.accountIndex = "non-exists"
        err <- staking.init { store, web3t }
        return cb err if err?
        cb null, \done
    withdraw = ->
        agree <- confirm store, lang.areYouSureToWithdraw
        return if agree is no
        { balanceRaw, rent, address, account } = store.staking.chosenAccount
        amount = account.lamports `plus` rent
        err, result <- as-callback web3t.velas.NativeStaking.withdraw(address, amount)
        console.error "Undelegate error: " err if err?
        return alert store, err.toString! if err?
        <- set-timeout _, 1000
        <- notify store, lang.fundsWithdrawn
        store.staking.getAccountsFromCashe = no
        navigate store, web3t, \validators
    delegate = ->
        navigate store, web3t, \poolchoosing
    undelegate = ->
        agree <- confirm store, lang.areYouSureToUndelegate
        return if agree is no
        #
        err, result <- as-callback web3t.velas.NativeStaking.undelegate(store.staking.chosenAccount.address)
        console.error "Undelegate error: " err if err?
        return alert store, err.toString! if err?
        <- set-timeout _, 1000
        <- notify store, lang.fundsUndelegated
        store.staking.getAccountsFromCashe = no
        navigate store, web3t, \validators
    split-account = ->
        cb = console.log 
        err <- as-callback web3t.velas.NativeStaking.getStakingAccounts(store.staking.parsedProgramAccounts)
        console.error err if err?
        /* Get next account seed */
        err, seed <- as-callback web3t.velas.NativeStaking.getNextSeed()
        return alert store, err.toString! if err?
        /**/
        amount <- prompt2 store, lang.howMuchToSplit
        return if amount+"".trim!.length is 0
        min_stake = web3t.velas.NativeStaking.min_stake
        balance = store.staking.chosenAccount.balanceRaw
        return alert store, lang.balanceIsNotEnoughToSpend + " #{amount} VLX" if +amount > +balance
        return alert store, lang.balanceIsNotEnoughToCreateStakingAccount + " (#{(min_stake `plus` 0.00228288)} VLX)" if +(min_stake) > +balance
        return alert store, lang.minimalStakeMustBe + " #{min_stake} VLX" if +(min_stake) > +amount
        #return alert store, "Balance is not enough to spend #{amount} VLX" if +main_balance < +amount
        amount = amount * 10^9
        /* Create new account */
        fromPubkey$ = store.staking.chosenAccount.address
        err, splitStakePubkey <- as-callback web3t.velas.NativeStaking.createNewStakeAccountWithSeed()
        console.error "Result sending:" err if err?
        return alert store, err.toString! if err?
        /**/
        /* Split account */
        stakeAccount = store.staking.chosenAccount.address
        err, result <- as-callback web3t.velas.NativeStaking.splitStakeAccount(stakeAccount, splitStakePubkey, amount)
        console.error "Result sending:" err if err?
        return alert store, err.toString! if err?
        <- set-timeout _, 500
        <- notify store, lang.accountCreatedAndFundsSplitted
        store.staking.getAccountsFromCashe = no
        navigate store, web3t, "validators"
    icon-style =
        color: style.app.loader
        margin-top: "10px"
        width: "inherit"
    staker-pool-style =
        max-width: 200px
        background: style.app.stats
    stats=
        background: style.app.stats
    has-validator = store.staking.chosenAccount.validator.toString!.trim! isnt ""
    credits_observed = store.staking.chosenAccount?credits_observed ? 0
    active_stake = store.staking.chosenAccount.active_stake `div` (10^9)
    inactive_stake = store.staking.chosenAccount.inactive_stake `div` (10^9)
    delegated_stake = active_stake `plus` inactive_stake 
    usd-rate = wallet?usdRate ? 0
    usd-balance = round-number(store.staking.chosenAccount.balanceRaw `times` usd-rate, {decimals:2})
    usd-rent = round-number(store.staking.chosenAccount.rent `times` usd-rate,{decimals:2})
    usd-active_stake = round-number(active_stake `times` usd-rate, {decimals:2})
    usd-inactive_stake = round-number(inactive_stake `times` usd-rate, {decimals:2})
    usd-delegated_stake = round-number(delegated_stake `times` usd-rate, {decimals:2})
    $validator = if store.staking.chosenAccount.validator is "" then "---" else store.staking.chosenAccount.validator
    activationEpoch = account?data?parsed?info?stake?delegation?activationEpoch
    deactivationEpoch = account?data?parsed?info?stake?delegation?deactivationEpoch
    activeBalanceIsZero =  +store.staking.chosenAccount.active_stake is 0
    max-epoch = web3t.velas.NativeStaking.max_epoch
    myStakeMaxPart = 
        | store.staking.myStakeMaxPart? =>
            myStakeMaxPartVLX = parse-float(store.staking.myStakeMaxPart) `div` (10^9)
            myStakeMaxPartVLX + 
            " VLX"
        | _ => ""
    $status =
        | store.staking.chosenAccount.status is "inactive" and (not has-validator) => "Not Delegated"
        | store.staking.chosenAccount.status is "inactive" and has-validator => "Delegated (Inactive)"
        | store.staking.chosenAccount.status is "activating" => ""
        | _ => store.staking.chosenAccount.status
    react.create-element 'div', { className: 'staking-content delegate' }, children = 
        react.create-element 'div', { id: "choosen-pull", className: 'single-section form-group' }, children = 
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h2', {}, ' ' + lang.stakeAccount
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h3', {}, ' ' + lang.address
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'div', { title: "#{store.staking.chosenAccount.address}", className: 'chosen-account' }, children = 
                        react.create-element 'span', {}, children = 
                            """ #{store.staking.chosenAccount.address}"""
                            react.create-element 'img', { src: "#{icons.img-check}", className: 'check' }
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h3', {}, ' ' + lang.seed
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'span', { style: seed-style }, children = 
                        """ #{store.staking.chosenAccount.seed}"""
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h3', {}, ' ' + lang.rentExemptReserve
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'span', {}, children = 
                        """ #{store.staking.chosenAccount.rent} VLX"""
                    react.create-element 'span', { className: 'usd-amount' }, children = 
                        """ $#{usd-rent}"""
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h3', {}, ' ' + lang.balance
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'span', {}, children = 
                        """ #{store.staking.chosenAccount.balance} VLX"""
                    react.create-element 'span', { className: 'usd-amount' }, children = 
                        """ $#{usd-balance}"""
            react.create-element 'div', {}
            react.create-element 'div', {}
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h2', {}, ' ' + lang.stakeDelegation
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h3', {}, ' ' + lang.status
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'div', { title: "#{store.staking.chosenAccount.status}", className: 'chosen-account' }, children = 
                        react.create-element 'span', {}, children = 
                            """ #{$status}"""
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h3', {}, ' ' + lang.validator
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'span', { className: 'chosen-account' }, children = 
                        """ #{$validator}"""
                        if store.staking.chosenAccount.validator isnt ""
                            react.create-element 'img', { src: "#{icons.img-check}", className: 'check' }
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h3', {}, ' ' + lang.creditsObserved
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'span', {}, children = 
                        """ #{credits_observed}"""
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h3', {}, ' ' + lang.activeStake
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'span', {}, children = 
                        """ #{round-human(active_stake)} VLX"""
                    react.create-element 'span', { className: 'usd-amount' }, children = 
                        """ $#{usd-active_stake}"""
                    if store.staking.myStakeMaxPart? and no
                        react.create-element 'span', { className: 'myStakeMaxPart' }, children = 
                            react.create-element 'div', { className: 'animation' }, children = 
                                react.create-element 'div', { className: 'anim-item' }, ' -'
                                react.create-element 'div', { className: 'anim-item' }, ' -'
                                react.create-element 'div', { className: 'anim-item' }, ' >'
                            """ #{myStakeMaxPart}"""
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h3', {}, ' ' + lang.inactiveStake
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'span', {}, children = 
                        """ #{round-human(inactive_stake)} VLX"""
                    react.create-element 'span', { className: 'usd-amount' }, children = 
                        """ $#{usd-inactive_stake}"""
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h3', {}, ' ' + lang.delegatedStake
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'span', {}, children = 
                        """ #{round-human(delegated_stake)} VLX"""
                    react.create-element 'span', { className: 'usd-amount' }, children = 
                        """ $#{usd-delegated_stake}"""
            react.create-element 'div', { className: 'section' }, children = 
                react.create-element 'div', { className: 'title' }, children = 
                    react.create-element 'h2', {}, ' Actions'
                react.create-element 'div', { className: 'description' }, children = 
                    react.create-element 'div', { className: 'buttons' }, children = 
                        if (store.staking.chosenAccount.status is "inactive") 
                            react.create-element 'div', {}, children = 
                                button { store, on-click: delegate , type: \secondary , text: lang.to_delegate, icon : \arrowRight }
                                button { store, on-click: withdraw , type: \secondary , text: lang.withdraw, icon : \arrowLeft }
                        else if store.staking.chosenAccount.status isnt \deactivating then
                            button { store, on-click: undelegate , type: \secondary , text: lang.to_undelegate, icon : \arrowLeft, classes: "action-undelegate" }
                        button { store, on-click: split-account , type: \secondary , text: lang.to_split, classes: "action-split", no-icon: yes }
account-details = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    goto-search = ->
        navigate store, web3t, \search
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.background
        background-color: info.app.bgspare
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
    lightText=
        color: info.app.color3
    icon-color=
        filter: info.app.icon-filter
    show-class =
        if store.current.open-menu then \hide else \ ""
    react.create-element 'div', { className: 'staking staking-146665425' }, children = 
        react.create-element 'div', { style: border-style, className: 'title' }, children = 
            react.create-element 'div', { className: "#{show-class} header" }, ' ' + lang.delegateStake
            react.create-element 'div', { on-click: go-back, className: 'close' }, children = 
                react.create-element 'img', { src: "#{icons.arrow-left}", style: icon-color, className: 'icon-svg' }
            burger store, web3t
            epoch store, web3t
            switch-account store, web3t
        staking-content store, web3t
account-details.init = ({ store, web3t }, cb)!->
    console.log "account-details.init"
    stake-accounts = store.staking.parsedProgramAccounts
    #if true
        #err, all-stakes <- get-all-active-stake(stake-accounts)
        #console.log "all-active-stake" all-stakes
        #store.staking.all-active-stake = (all-stakes ? 0)
        #my-stake = store.staking.chosenAccount.balanceRaw `times` (10^9)
        #my-weight = my-stake `div` all-stakes.inactive-stake
        #activateMaxInSystem = all-stakes.active-stake `times` 0.25
        #yourMaxPart = my-weight `times` activateMaxInSystem
        #store.staking.myStakeMaxPart = yourMaxPart
    cb null
stringify = (value) ->
    if value? then
        round-human(parse-float value `div` (10^18))
    else
        '..'
module.exports = account-details