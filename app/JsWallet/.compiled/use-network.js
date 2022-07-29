// Generated by LiveScript 1.6.0
(function(){
  module.exports = function(web3, store, network, cb){
    if (network !== 'mainnet' && network !== 'testnet') {
      return cb("Accept only mainnet and testnet");
    }
    if (network === store.current.network) {
      return cb("Already on that network");
    }
    store.current.network = network;
    store.forceReload = true;
    store.forceReloadTxs = true;
    return web3.refresh(function(err){
      store.forceReload = false;
      store.forceReloadTxs = false;
      if (err != null) {
        return cb(err);
      }
      return cb(null);
    });
  };
}).call(this);