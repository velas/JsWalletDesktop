require! {
    \../web3t/providers/superagent.ls : { get, post }
    \atob
    \./providers.ls
    \../web3t/plugins/btc-coin.ls : btc
    \../web3t/plugins/eth-coin.ls : eth
    \../web3t/plugins/eth-legacy-coin.ls : eth_legacy
    \../web3t/plugins/symblox.ls : syx
    \../web3t/plugins/symblox-v2.ls : syx2
    \../web3t/plugins/ltc-coin.ls : ltc
    \../web3t/plugins/usdt-coin.ls : usdt
    \../web3t/plugins/usdt_erc20.json : usdt_erc20
    \../web3t/plugins/vlx_erc20-coin.ls : vlx_erc20
    \../web3t/plugins/vlx-coin.ls : vlx_evm
    \../web3t/plugins/bnb-coin.ls : bnb 
    \../web3t/plugins/vlx_busd-coin.ls : vlx_busd
    \../web3t/plugins/busd-coin.ls : busd
    \../web3t/plugins/huobi-coin.ls : huobi 
    \../web3t/plugins/vlx-huobi-coin.ls : vlx_huobi
    \../web3t/plugins/vlx-usdt-coin.ls : vlx_usdt
    \../web3t/plugins/vlx-eth-coin.ls : vlx_eth
    \../web3t/plugins/usdc-coin.ls : usdc
    \../web3t/plugins/vlx_usdc-coin.ls : vlx_usdc
    \../web3t/plugins/usdt_erc20_legacy-coin.json : usdt_erc20_legacy
    \../web3t/plugins/bsc-vlx-coin.ls : bsc_vlx
    \../web3t/plugins/vlx-evm-legacy-coin.ls : vlx_evm_legacy
}
module.exports = (cb) ->
    def = [ eth, eth_legacy, usdt, syx, syx2, usdt_erc20, ltc, vlx_erc20, vlx_evm, bnb, vlx_busd, busd, huobi, vlx_huobi, vlx_usdt, vlx_eth, usdt_erc20_legacy, usdc, vlx_usdc, bsc_vlx, vlx_evm_legacy  ]
    cb null, def