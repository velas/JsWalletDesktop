// Generated by LiveScript 1.6.0
(function(){
  var web3tBuilder, rem, sprkl, stt, xem, mode, plugins, initWeb3t, mnemonic, out$ = typeof exports != 'undefined' && exports || this;
  web3tBuilder = require('../index.ls');
  rem = require('./plugins/erc20-rem.json');
  sprkl = require('./plugins/erc20-sprkl.json');
  stt = require('./plugins/erc20-stt.json');
  xem = require('./plugins/xem.json');
  mode = 'testnet';
  plugins = {
    sprkl: sprkl,
    rem: rem,
    stt: stt,
    xem: xem
  };
  out$.initWeb3t = initWeb3t = function(cb){
    return web3tBuilder({
      mode: mode,
      plugins: plugins
    }, cb);
  };
  out$.mnemonic = mnemonic = "some unique pharses should be here";
}).call(this);
