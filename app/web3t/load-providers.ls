require! {
    \./providers/eth.ls
    \./providers/eth_legacy.ls
    \./providers/insight.ls
    \./providers/bitcore.ls
    \./providers/erc20.ls
    \./providers/omni.ls
    \./providers/velas2.ls
    \./providers/solana.ls
    \./providers/velas_evm.ls
    \./providers/vlx_evm_legacy.ls
    \./providers/bnb.ls
    \./providers/velas_busd.ls
    \./providers/busd.ls
    \./providers/huobi.ls
    \./providers/velas_huobi.ls
    \./providers/velas_usdt.ls
    \./providers/velas_eth.ls
    \./providers/usdt_erc20_legacy.ls
    \./providers/usdc.ls
    \./providers/vlx_usdc.ls
    \./providers/bsc_vlx.ls
}
extend-providers = (providers, config)->
    return if typeof! config.providers isnt \Object
    providers <<<< config.providers
module.exports = (config, cb)->
   def = { eth, insight, erc20, omni, velas2, velas_evm, vlx_evm_legacy, bitcore, solana, bnb, velas_busd, busd, huobi, velas_huobi, velas_usdt, velas_eth, eth_legacy, usdt_erc20_legacy, usdc, vlx_usdc, bsc_vlx }
   extend-providers def, config
   cb null, def
