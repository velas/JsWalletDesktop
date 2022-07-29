// Generated by LiveScript 1.6.0
(function(){
  var btc, eth, eth_legacy, symblox, symbloxV2, ltc, usdt, vlx_native, vlx_erc20, vlx_evm, vlx_evm_legacy, bnb, vlx_busd, busd, huobi, vlx_huobi, vlx_usdt, vlx_eth, usdt_erc20, usdt_erc20_legacy, usdc, vlx_usdc, bsc_vlx, ref$, objToPairs, pairsToObj, filter, onlyCoins, extendCoins, toString$ = {}.toString;
  btc = require('./plugins/btc-coin');
  eth = require('./plugins/eth-coin');
  eth_legacy = require('./plugins/eth-legacy-coin');
  symblox = require('./plugins/symblox');
  symbloxV2 = require('./plugins/symblox-v2');
  ltc = require('./plugins/ltc-coin');
  usdt = require('./plugins/usdt-coin');
  vlx_native = require('./plugins/sol-coin');
  vlx_erc20 = require('./plugins/vlx_erc20-coin');
  vlx_evm = require('./plugins/vlx-coin');
  vlx_evm_legacy = require('./plugins/vlx-evm-legacy-coin');
  bnb = require('./plugins/bnb-coin');
  vlx_busd = require('./plugins/vlx_busd-coin');
  busd = require('./plugins/busd-coin');
  huobi = require('./plugins/huobi-coin');
  vlx_huobi = require('./plugins/vlx-huobi-coin');
  vlx_usdt = require('./plugins/vlx-usdt-coin');
  vlx_eth = require('./plugins/vlx-eth-coin');
  usdt_erc20 = require('./plugins/usdt_erc20.json');
  usdt_erc20_legacy = require('./plugins/usdt_erc20_legacy-coin.json');
  usdc = require('./plugins/usdc-coin');
  vlx_usdc = require('./plugins/vlx_usdc-coin');
  bsc_vlx = require('./plugins/bsc-vlx-coin');
  ref$ = require('prelude-ls'), objToPairs = ref$.objToPairs, pairsToObj = ref$.pairsToObj, filter = ref$.filter;
  onlyCoins = function(plugins){
    return pairsToObj(
    filter(function(it){
      var ref$;
      return ((ref$ = it[1]) != null ? ref$.type : void 8) === 'coin';
    })(
    objToPairs(
    plugins)));
  };
  extendCoins = function(coins, config){
    if (toString$.call(config.plugins).slice(8, -1) !== 'Object') {
      return;
    }
    return importAll$(coins, onlyCoins(config.plugins));
  };
  module.exports = function(config, cb){
    var def;
    def = {
      btc: btc,
      eth: eth,
      ltc: ltc,
      usdt: usdt,
      vlx_erc20: vlx_erc20,
      vlx_eth: vlx_eth,
      vlx_native: vlx_native,
      vlx_evm: vlx_evm,
      symblox: symblox,
      symbloxV2: symbloxV2,
      bnb: bnb,
      vlx_busd: vlx_busd,
      busd: busd,
      huobi: huobi,
      vlx_huobi: vlx_huobi,
      vlx_usdt: vlx_usdt,
      eth_legacy: eth_legacy,
      usdt_erc20: usdt_erc20,
      usdt_erc20_legacy: usdt_erc20_legacy,
      usdc: usdc,
      vlx_usdc: vlx_usdc,
      bsc_vlx: bsc_vlx,
      vlx_evm_legacy: vlx_evm_legacy
    };
    extendCoins(def, config);
    return cb(null, def);
  };
  function importAll$(obj, src){
    for (var key in src) obj[key] = src[key];
    return obj;
  }
}).call(this);