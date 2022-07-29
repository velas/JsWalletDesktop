// Generated by LiveScript 1.6.0
(function(){
  var getBalance, ref$, times, plus, find, map, each, pairsToObj, foldl, filter, run, task, round5, roundHuman, calcWallet;
  getBalance = require('./api.ls').getBalance;
  ref$ = require('./math.ls'), times = ref$.times, plus = ref$.plus;
  ref$ = require('prelude-ls'), find = ref$.find, map = ref$.map, each = ref$.each, pairsToObj = ref$.pairsToObj, foldl = ref$.foldl, filter = ref$.filter;
  ref$ = require('./workflow.ls'), run = ref$.run, task = ref$.task;
  round5 = require('./round5.ls');
  roundHuman = require('./round-human.ls');
  calcWallet = function(store, token, cb){
    var wallets, rates, current, index, wallet, state, buildLoader, loaders, tasks;
    if (store == null) {
      return cb("Store is required");
    }
    wallets = store.current.account.wallets;
    rates = store.rates;
    current = {
      tokenIndex: 0
    };
    index = 0;
    each(function(it){
      if (it.coin.token === token) {
        current.tokenIndex = index;
      }
      return index++;
    })(
    wallets);
    wallet = find(function(it){
      return it.coin.token === token;
    })(
    wallets);
    if (wallet == null) {
      return cb(null);
    }
    state = {
      balanceUsd: 0
    };
    buildLoader = function(wallet){
      return task(function(cb){
        var token, usdRate, ref$, eurRate, btcRate, err;
        token = wallet.coin.token;
        token = wallet.coin.token.toLowerCase();
        usdRate = (ref$ = rates[token]) != null ? ref$ : '..';
        usdRate = usdRate + '';
        wallet.usdRate = (function(){
          switch (false) {
          case usdRate !== '..':
            return 0;
          default:
            return round5(usdRate);
          }
        }());
        eurRate = '0.893191';
        btcRate = '0';
        wallet.eurRate = (function(){
          switch (false) {
          case usdRate !== '..':
            return '..';
          default:
            return round5(times(usdRate, eurRate));
          }
        }());
        wallet.btcRate = (function(){
          switch (false) {
          case usdRate !== '..':
            return '..';
          default:
            return round5(times(usdRate, btcRate));
          }
        }());
        wallet.status = 'loading';
        try {
          return getBalance({
            address: wallet.address,
            network: wallet.network,
            token: token,
            account: {
              address: wallet.address,
              privateKey: wallet.privateKey
            }
          }, function(err, balance){
            var pendingSent, balanceUsdCurrent;
            if (err != null) {
              console.error(token + " get-balance error:", err);
            }
            pendingSent = 0;
            wallet.pendingSent = pendingSent;
            wallet.balance = (function(){
              switch (false) {
              case !isNaN(balance):
                return "..";
              default:
                return balance;
              }
            }());
            wallet.balanceUsd = (function(){
              switch (false) {
              case !(isNaN(usdRate) || isNaN(balance)):
                return "..";
              default:
                return times(balance, usdRate);
              }
            }());
            balanceUsdCurrent = (function(){
              switch (false) {
              case !isNaN(wallet.balanceUsd):
                return 0;
              default:
                return wallet.balanceUsd;
              }
            }());
            wallet.status = (function(){
              switch (false) {
              case !(isNaN(balance) || err != null):
                return 'error';
              default:
                return 'loaded';
              }
            }());
            wallet.state = (function(){
              switch (false) {
              case err == null:
                return 'error';
              default:
                return 'success';
              }
            }());
            return cb();
          });
        } catch (e$) {
          err = e$;
          wallet.status = "error";
          wallet.state = "error";
          return cb();
        }
      });
    };
    loaders = map(buildLoader)(
    [wallet]);
    tasks = pairsToObj(
    map(function(it){
      return [loaders.indexOf(it).toString(), it];
    })(
    loaders));
    return run([tasks]).then(function(){
      if (store.current.account.wallets[current.tokenIndex] != null) {
        store.current.account.wallets[current.tokenIndex] = wallet;
      }
      return cb(null);
    });
  };
  module.exports = calcWallet;
}).call(this);