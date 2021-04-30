require! {
    \prelude-ls : { filter }
    \./install-plugin.ls : { get-install-list }
    \./browser/window.ls
}
gobyte = require \../web3t/plugins/gobyte-coin.ls
zec = require \../web3t/plugins/zec-coin.ls
common = (store)->
    vlx2 = require \../web3t/plugins/vlx2-coin.ls
    btc  = require \../web3t/plugins/btc-coin.ls
    sol  = require \../web3t/plugins/sol-coin.ls
    coins = [vlx2, sol, btc]
    #if store.url-params.segwit?
    #    coins.push btc_sw
    if store.url-params.gbx?
        coins.push gobyte
    coins
export get-coins = (store, cb)->
    network = store.current.network
    base =
        common store
            |> filter (?)
            |> filter (.type is \coin)
            |> filter (.enabled)
            |> filter (-> not it[network].disabled is yes)
    err, items <- get-install-list
    return cb err if err?
    installed =
        items |> filter (.type is \coin)
            |> filter (.enabled isnt no)
    all =  base ++ installed
    cb null, all