require! {
    \./plugins/btc-coin.js : btc
    \./plugins/eth-coin.js : eth
    \./plugins/symblox.js : symblox
    \./plugins/symblox-v2.js : symblox-v2
    \./plugins/ltc-coin.js : ltc
    \./plugins/usdt-coin.js : usdt
    \./plugins/sol-coin.js : sol
    \./plugins/vlx_erc20-coin.ls : vlx_erc20
    \./plugins/vlx-coin.js : vlx
    \prelude-ls : { obj-to-pairs, pairs-to-obj, filter }
}
only-coins = (plugins)->
    plugins
        |> obj-to-pairs
        |> filter (.1?type is \coin)
        |> pairs-to-obj
extend-coins = (coins, config)->
    return if typeof! config.plugins isnt \Object
    coins <<<< only-coins config.plugins
module.exports = (config, cb)->
    #eos
    def = { btc, eth, ltc, usdt, vlx_erc20, sol, vlx, symblox, symblox-v2  }
    extend-coins def, config
    cb null, def
