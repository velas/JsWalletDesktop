// Generated by LiveScript 1.6.0
(function(){
  var initWeb3t, ref$, createBtcAccount, createLtcAccount, createSttAccount, sendBtcTransaction, sendLtcTransaction, sendSttTransaction, out$ = typeof exports != 'undefined' && exports || this;
  initWeb3t = require('./example-1-core.js').initWeb3t;
  ref$ = require('./example-2-create_accounts.js'), createBtcAccount = ref$.createBtcAccount, createLtcAccount = ref$.createLtcAccount, createSttAccount = ref$.createSttAccount;
  out$.sendBtcTransaction = sendBtcTransaction = function(cb){
    return createBtcAccount(0, function(err, account){
      if (err != null) {
        return cb(err);
      }
      return initWeb3t(function(err, web3t){
        if (err != null) {
          return cb(err);
        }
        return createBtcAccount(1, function(err, accountReceiver){
          var to, amount;
          to = accountReceiver.address;
          amount = "1";
          return web3t.btc.sendTransaction({
            account: account,
            to: to,
            amount: amount
          }, cb);
        });
      });
    });
  };
  out$.sendLtcTransaction = sendLtcTransaction = function(cb){
    return createLtcAccount(0, function(err, account){
      if (err != null) {
        return cb(err);
      }
      return initWeb3t(function(err, web3t){
        if (err != null) {
          return cb(err);
        }
        return createLtcAccount(1, function(err, accountReceiver){
          var to, amount;
          to = accountReceiver.address;
          amount = "1";
          return web3t.ltc.sendTransaction({
            account: account,
            to: to,
            amount: amount
          }, cb);
        });
      });
    });
  };
  out$.sendSttTransaction = sendSttTransaction = function(cb){
    return createSttAccount(0, function(err, account){
      if (err != null) {
        return cb(err);
      }
      return initWeb3t(function(err, web3t){
        if (err != null) {
          return cb(err);
        }
        return createSttAccount(1, function(err, accountReceiver){
          var to, amount;
          to = accountReceiver.address;
          amount = "1";
          return web3t.stt.sendTransaction({
            account: account,
            to: to,
            amount: amount
          }, cb);
        });
      });
    });
  };
}).call(this);