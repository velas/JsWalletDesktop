require! {
    \./providers/eth.js
    \./providers/insight.js
    \./providers/bitcore.js
    \./providers/erc20.js
    \./providers/omni.js
    \./providers/velas2.js
    \./providers/solana.js
    \./providers/velas_evm.js
}
extend-providers = (providers, config)->
    return if typeof! config.providers isnt \Object
    providers <<<< config.providers
module.exports = (config, cb)->
   def = { eth, insight, erc20, omni, velas2, velas_evm, bitcore, solana }
   extend-providers def, config
   cb null, def
