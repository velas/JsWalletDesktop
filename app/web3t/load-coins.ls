require! {
    \./plugins/btc-coin.ls : btc
    \./plugins/eth-coin.ls : eth
    \./plugins/eth-legacy-coin.ls : eth_legacy
    \./plugins/symblox.ls : symblox
    \./plugins/symblox-v2.ls : symblox-v2
    \./plugins/ltc-coin.ls : ltc
    \./plugins/usdt-coin.ls : usdt
    \./plugins/sol-coin.ls : vlx_native
    \./plugins/vlx_erc20-coin.ls : vlx_erc20
    \./plugins/vlx-coin.ls : vlx_evm
    \./plugins/vlx-evm-legacy-coin.ls : vlx_evm_legacy
    \./plugins/bnb-coin.ls : bnb
    \./plugins/vlx_busd-coin.ls : vlx_busd
    \./plugins/busd-coin.ls : busd
    \./plugins/huobi-coin.ls : huobi
    \./plugins/vlx-huobi-coin.ls : vlx_huobi
    \./plugins/vlx-usdt-coin.ls : vlx_usdt
    \./plugins/vlx-eth-coin.ls : vlx_eth
    \./plugins/usdt_erc20.json : usdt_erc20
    \./plugins/usdt_erc20_legacy-coin.json : usdt_erc20_legacy
    \./plugins/usdc-coin.ls : usdc
    \./plugins/vlx_usdc-coin.ls : vlx_usdc
    \./plugins/bsc-vlx-coin.ls : bsc_vlx
    
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
    def = { btc, eth, ltc, usdt, vlx_erc20, vlx_eth, vlx_native, vlx_evm, symblox, symblox-v2, bnb, vlx_busd, busd, huobi, vlx_huobi, vlx_usdt, eth_legacy, usdt_erc20, usdt_erc20_legacy, usdc, vlx_usdc, bsc_vlx, vlx_evm_legacy }
    extend-coins def, config
    cb null, def
