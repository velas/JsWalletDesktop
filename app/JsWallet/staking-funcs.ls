require! {
    \prelude-ls : { map, split, filter, find, foldl, drop, take, sum, unique, pairs-to-obj }
    \./math.ls : { div, times, plus, minus }
    \./round-human.ls
}
SIMULATION_COUNT = 14600
EPOCHS_PER_YEAR = 1460
VALIDATOR_COUNT = 19
as-callback = (p, cb)->
    p.catch (err) -> cb err
    p.then (data)->
        cb null, data
get-stakes-from-stakes-accounts = (store, item)->
    found = store.staking.accounts
        |> filter (it)->
            stake-data = it?account?data?parsed?info?stake?delegation
            return no if not stake-data?
            +stake-data.activationEpoch < +stake-data.deactivationEpoch and stake-data?voter is item.key
    stakes =
        | found.length > 0 =>
            found |> map (-> {seed: it.seed, item: it, stake: it.account?data?parsed?info?stake?delegation?stake})
        | _ => []
    return stakes
fill-pools = ({ store, web3t, on-progress}, on-finish, [item, ...rest]) ->
    if not item? then
        store.staking.all-pools-loaded = yes
        store.staking.pools-are-loading = no
        return on-finish null, []
    if (([\validators, \info, \account_details, \pool_details].index-of(store.current.page)) is -1) then
        store.staking.all-pools-loaded = no
        store.staking.pools-are-loading = no
        return on-finish null, []
#    store.staking.loadingValidatorIndex += 1
    item.activatedStake = item.activatedStake
    item.balanceRaw = item.activatedStake
    item.address = item.key
    item.stake = item.stake
    item.stake-initial = item.activatedStake
    item.status = status
    item.commission = item.commission
    item.credits_observed =
        item.epochCredits
            |> map (it)->
                it[1]
            |> foldl plus, 0
    item.delegators = store.staking.delegators[item.votePubkey] ? 0
    stakes = get-stakes-from-stakes-accounts(store, item)
    item.stakes = stakes
    on-progress [item, ...rest] if on-progress?
    on-finish-local = (err, pools) ->
        on-finish err, [item, ...pools]
    on-progress-local = (pools) ->
        on-progress [item, ...pools]
    fill-pools { store, web3t, on-progress: on-progress-local}, on-finish-local, rest
load-validators-from-cache = ({store}, cb)->
    DEADLINE = 60000 # 1 minute
    last-time = store.staking.last-time ? new Date().getTime()
    now = new Date().getTime()
    if now `minus` last-time <= DEADLINE and store.staking.cachedValidators? and store.staking.cachedValidators.length
        console.log "get validators from cache"
        cache-result = store.staking.cachedValidators  
        return cb null, cache-result  
    err, validators <- as-callback web3t.velas.NativeStaking.getStakingValidators()
    console.error "GetStakingValidators err: " err if err?  
    return cb null, [] if err?
    store.staking.cachedValidators = validators  
    store.staking.last-time = new Date().getTime()
    cb null, validators    
query-pools-web3t = ({store, web3t, on-progress}, on-finish) -> 
    err, validators <- load-validators-from-cache { store }     
    #err, validators <- as-callback web3t.velas.NativeStaking.getStakingValidators()
    return on-finish err if err?
    validators = [] if err?
    store.staking.totalValidators = validators.length
    console.log "Got validators" validators.length
    store.staking.pools-are-loading = yes
    fill-pools { store, web3t, on-progress}, on-finish, validators
query-pools = ({store, web3t, on-progress}, on-finish) ->
    fill-delegators(store, web3t)      
    err, pools <- query-pools-web3t {store, web3t, on-progress}
    return on-finish err if err?
    on-finish null, pools
fill-delegators = (store, web3t)->
    accounts = store.staking.parsedProgramAccounts
    fill-delegator(store, web3t, accounts)
fill-delegator = (store, web3t, [acc, ...accounts])!->
    return if not acc?
    voter             =        acc.account?data?parsed?info?stake?delegation?voter
    activationEpoch   = Number(acc.account?data?parsed?info?stake?delegation?activationEpoch  ? 0)
    deactivationEpoch = Number(acc.account?data?parsed?info?stake?delegation?deactivationEpoch ? 0)
    if (voter and (deactivationEpoch > activationEpoch or activationEpoch is web3t.velas.NativeStaking.max_epoch))  
        store.staking.delegators[voter] = if store.staking.delegators[voter]? then (store.staking.delegators[voter] + 1) else 1
    fill-delegator(store, web3t, accounts)
# Accounts
query-accounts = (store, web3t, on-progress, on-finish) ->
    accountIndex = store.current.accountIndex
    if (store.staking.getAccountsFromCashe is yes) and store.staking.accountsCached[accountIndex]? and store.staking.accountsCached[accountIndex].length > 0
        console.log "get accounts from cache"
        store.staking.all-accounts-loaded = yes
        store.staking.accounts-are-loading = no
        return on-finish null, store.staking.accountsCached[accountIndex]
    err, accounts <- query-accounts-web3t store, web3t, on-progress
    return on-finish err if err?
    store.staking.accountsCached[accountIndex] = accounts
    on-finish err, accounts
query-accounts-web3t = (store, web3t, on-progress, on-finish) ->
    err, parsedProgramAccounts <- as-callback web3t.velas.NativeStaking.getParsedProgramAccounts()
    parsedProgramAccounts = [] if err?
    store.staking.parsedProgramAccounts = parsedProgramAccounts
    err, accs <- as-callback web3t.velas.NativeStaking.getOwnStakingAccounts(parsedProgramAccounts) 
    accs = [] if err?
    store.staking.totalOwnStakingAccounts = accs.length
    console.log "accs" accs 
    return on-finish err if err?
    store.staking.accounts-are-loading = yes
    fill-accounts { store, web3t, on-progress, on-finish }, accs
fill-accounts = ({ store, web3t, on-progress, on-finish }, [item, ...rest]) ->
    if not item? then
        store.staking.all-accounts-loaded = yes
        store.staking.accounts-are-loading = no
        return on-finish null, []
    if (([\validators, \info, \account_details, \pool_details].index-of(store.current.page)) is -1) then
        store.staking.all-accounts-loaded = no
        store.staking.accounts-are-loading = no
        return on-finish null, []
    store.staking.loadingAccountIndex += 1
    rent = item.account?data?parsed?info?meta?rentExemptReserve
    err, seed <- as-callback web3t.velas.NativeStaking.checkSeed(item.pubkey.toBase58())
    item.seed    = seed ? ".."
    item.seed-index  = +((item.seed + "").split(":").1 )
    item.address = item.pubkey.toBase58()
    item.key     = item.address
    item.rentRaw = rent
    item.balanceRaw = if rent? then (item.account.lamports `minus` rent) else '-'
    item.balance = if rent? then (Math.round((item.account.lamports `minus` rent) `div` (10^9)) `times` 100) `div` 100  else "-"
    item.rent    = if rent? then (rent `div` (10^9)) else "-"
    item.credits_observed = item.account?data?parsed?info?stake?creditsObserved ? 0
    item.status  = "inactive"
    item.validator = null
    item.account = item.account
    if (item.account?data?parsed?info?stake) then
        activationEpoch   = Number(item.account?data?parsed?info?stake.delegation.activationEpoch)
        deactivationEpoch = Number(item.account?data?parsed?info?stake.delegation.deactivationEpoch)
        if (deactivationEpoch > activationEpoch or activationEpoch is web3t.velas.NativeStaking.max_epoch) then
            item.status    = "loading"
            item.validator = item.account?data?parsed?info?stake?delegation?voter
    #err, stakeActivation <- as-callback web3t.velas.NativeStaking.getStakeActivation(item.address)
    #if not err? and stakeActivation?
        #item.status = stakeActivation.state
        #item.active_stake = stakeActivation.active
        #item.inactive_stake = stakeActivation.inactive
    #return alert store, err, cb if err?
    on-progress [item, ...rest] if on-progress?
    on-finish-local = (err, pools) ->
        on-finish err, [item, ...pools]
    on-progress-local = (pools) ->
        on-progress [item, ...pools]
    fill-accounts { store, web3t, on-progress: on-progress-local, on-finish: on-finish-local }, rest
###################    
convert-accounts-to-view-model = (accounts) ->
    accounts
        |> map -> {
            account: it.account
            address: it.key ? '..'
            key: it.key
            balanceRaw: it.balanceRaw ? 0
            balance: if it.balance? then round-human(it.balance) else '..'
            rent: if it.rent? then it.rent else "-"
            lastVote: it.lastVote ? '..'
            seed: it.seed ? '..'
            validator:  it?validator ? ""
            status: it.status ? "inactive"
            active_stake = it?active_stake ? 0
            inactive_stake = it?inactive_stake ? 0
            seed-index =  it.seed-index
            credits_observed : it.credits_observed
        }
##################
convert-pools-to-view-model = (pools) ->
    pools
        |> map -> {
            address: it.key ? '..',
            balanceRaw: it.activatedStake,
            checked: no,
            stake: if it.stake? then it.stake else '..',
            stake-initial: if it.activatedStake? then parse-float it.activatedStake `div` (10^9) else 0,
            commission: it.commission
            lastVote: if it.lastVote then round-human(it.lastVote) else '..'
            stakers: if it.delegators? then it.delegators else '..',
            is-validator:  (it?stakes? and it.stakes.length isnt 0) ? false,
            status: it.status,
            my-stake: if it?stakes then it.stakes else []
            credits_observed : it.credits_observed
            nodePubkey: it.nodePubkey
        }       
/*
    * Calculate skipped solts percent for each validator.
    * @param   { Object } store - The mobx store object
    * @param   { Object } web3t - The web3t lib
    * @returns { Object } Object <pubKey, Number> where key is public node addess and value is percent of skipped slosts per current epoch.
    * */
get-validators-skipped-slots-percents = ({store, web3t}, cb)->
    # Get info for skipped slot % calculation
    err, epochInfo <- as-callback web3t.velas.NativeStaking.getCurrentEpochInfo()
    console.error err if err?
    { epoch, blockHeight, slotIndex, slotsInEpoch, transactionCount, absoluteSlot } = epochInfo
    store.staking.epochInfo = epochInfo
    err, result <- as-callback web3t.velas.NativeStaking.getLeaderSchedule()
    console.log "getLeaderSchedule" result 
    store.staking.leaderSchedule = result
    # First slot in epoch
    err, first_slot_in_epoch <- getFirstSlotInEpoch(epoch, slotsInEpoch)
    console.log "first_slot_in_epoch = " first_slot_in_epoch
    start_slot = first_slot_in_epoch # // no limit
    #start_slot_index = (start_slot - first_slot_in_epoch)  # //  start_slot_index = 0
    start_slot_index = 0
    # Last slot in epoch
    last_slot_in_epoch = first_slot_in_epoch + slotsInEpoch - 1
    end_slot = Math.min(absoluteSlot, last_slot_in_epoch)
    console.log "end_slot = " end_slot
    end_slot_index = (end_slot - first_slot_in_epoch)
    # Prepare Leader per slot object
    leader_per_slot_index = {}
    store.staking.leaderSchedule 
        |> keys
        |> each (it)->
            leader_slots = store.staking.leaderSchedule[it]
            for slot_index in leader_slots
                if slot_index >= start_slot_index and slot_index <= end_slot_index
                    leader_per_slot_index[slot_index] = it 
    #console.log "leader_per_slot_index" leader_per_slot_index 
    # Prepare leader skipped slot object
    leader_slot_count = {}
    leader_skipped_slots = {}
    confirmed_blocks_index = 0
    # Get confirmed blocks
    err, result <- as-callback(web3t.velas.NativeStaking.getConfirmedBlocks(start_slot, end_slot))
    confirmedBlocks = (result?result ? [])
    console.log "confirmedBlocks.length" confirmedBlocks.length
    #
    total_slots = end_slot_index - start_slot_index + 1
    total_blocks_produced = confirmedBlocks.length
    #
    #console.log "leader_per_slot_index" Object.keys(leader_per_slot_index)
    leader_per_slot_index |> keys |> each (it)->
        slot_index = it
        leader = leader_per_slot_index[slot_index]
        slot = +start_slot + slot_index
        if not leader_slot_count["#{leader}"]?
            leader_slot_count["#{leader}"] = 0
        leader_slot_count["#{leader}"] = +(leader_slot_count["#{leader}"]) + 1
        if not leader_skipped_slots["#{leader}"]?
            leader_skipped_slots["#{leader}"] = 0
        while yes
            if confirmed_blocks_index < confirmedBlocks.length
                slot_of_next_confirmed_block = confirmedBlocks[confirmed_blocks_index]
                if slot_of_next_confirmed_block < slot 
                    +confirmed_blocks_index += 1
                    continue
                if slot_of_next_confirmed_block is slot
                    break
            leader_skipped_slots["#{leader}"] = +(leader_skipped_slots["#{leader}"]) + 1
            break
    console.log "leader_slot_count" Object.keys(leader_slot_count).length
    console.log "leader_skipped_slots" Object.keys(leader_skipped_slots).length
    scippedSlotsPercent = 
        leader_slot_count 
            |> keys 
            |> map (it)->
                leader = it
                leaderSlots = leader_slot_count[leader]
                percent = store.staking.leaderSchedule[leader].length `div` end_slot `times` 100
                [leader, percent]
            |> pairs-to-obj
    cb null, scippedSlotsPercent
/*
    * Get first slot in epoch.
    * @param   { Number } epoch - The epoch number for which the first slot is calculated
    * @param   { Number } slotsInEpoch - The total number of slots in epoch
    * @returns { Number } First slot in searched epoch. 
    * */            
getFirstSlotInEpoch = (epoch, slotsInEpoch, cb)->
    err, epochSchedule <- getEpochSchedule!
    {firstNormalEpoch, firstNormalSlot, leaderScheduleSlotOffset, slotsPerEpoch, warmup} = epochSchedule
    if epoch <= firstNormalEpoch
        console.log "Epoch is less or equals to firstNormalEpoch"
        return cb null, (Math.pow(2, epoch) - 1) * slotsInEpoch #MINIMUM_SLOTS_PER_EPOCH
    return cb null, (epoch - firstNormalEpoch) * slotsPerEpoch + firstNormalSlot
/*
    * Get epoch schedule of current epoch.
    * @param   { Function } cb - The callback which will be executed after this function
    * @returns { Object } Epoch schedule {firstNormalEpoch, firstNormalSlot, leaderScheduleSlotOffset, slotsPerEpoch, warmup}
    * */  
getEpochSchedule = (cb)->    
    err, epochSchedule <- as-callback(web3t.velas.NativeStaking.getEpochSchedule!)
    console.error err if err?
    cb null, epochSchedule 
# # # # # # # # # # # # # #
module.exports = { 
    query-pools, 
    query-accounts, 
    convert-accounts-to-view-model, 
    convert-pools-to-view-model,
    get-validators-skipped-slots-percents 
}