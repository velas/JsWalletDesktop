require! {
    \prelude-ls : { filter, sort-by, reverse }
    \./install-plugin.ls : { get-install-list }
    \./browser/window.ls
}
gobyte = require \../web3t/plugins/gobyte-coin.ls
common = (store)->
    vlx2 = require \../web3t/plugins/vlx2-coin.ls
    btc  = require \../web3t/plugins/btc-coin.ls
    native  = require \../web3t/plugins/sol-coin.ls
    eth  = require \../web3t/plugins/eth-coin.ls
    vlx_evm = require \../web3t/plugins/vlx-coin.ls
    coins = [ native, vlx_evm, vlx2, btc, eth]
    if store.url-params.gbx?
        coins.push gobyte
    coins
export get-coins = (store, cb)->
    network = store.current.network
    base =
        common store
            |> filter (?)
            |> filter (-> it[network]? and (it.type is \coin) and (it.enabled is yes) and (not (it[network]?disabled is yes)))
    err, items <- get-install-list
    return cb err if err?
    installed =
        items
            |> filter (.type is \coin)
            |> filter (.enabled isnt no)
            #|> sort-by (.wallet-index)
            #|> reverse
    all =  base ++ installed
    cb null, all