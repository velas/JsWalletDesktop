// Generated by LiveScript 1.6.0
(function(){
  var getBalance, ref$, times, plus, find, map, pairsToObj, foldl, filter, run, task, round5, roundHuman, calcWallet;
  getBalance = require('./api.ls').getBalance;
  ref$ = require('./math.ls'), times = ref$.times, plus = ref$.plus;
  ref$ = require('prelude-ls'), find = ref$.find, map = ref$.map, pairsToObj = ref$.pairsToObj, foldl = ref$.foldl, filter = ref$.filter;
  ref$ = require('./workflow.ls'), run = ref$.run, task = ref$.task;
  round5 = require('./round5.ls');
  roundHuman = require('./round-human.ls');
  calcWallet = function(store, cb){
    var wallets, rates, buildLoader;
    if (store == null) {
      return cb("Store is required");
    }
    wallets = store.current.account.wallets;
    rates = store.rates;
    if (calcWallet.loading === true) {
      return;
    }
    calcWallet.loading = true;
    buildLoader = function(wallet){
      return setTimeout(function(){
        var token, usdRate, eurRate, btcRate, err;
        wallet.status = 'loading';
        token = wallet.coin.token;
        token = wallet.coin.token.toLowerCase();
        usdRate = (function(){
          switch (false) {
          case rates[token] != null:
            return '..';
          case rates[token] !== "":
            return '..';
          default:
            return rates[token];
          }
        }());
        usdRate = usdRate + '';
        wallet.usdRate = (function(){
          switch (false) {
          case usdRate !== '..':
            return '..';
          default:
            return usdRate;
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
        try {
          getBalance({
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
              case !isNaN(balance):
                return 'error';
              default:
                return 'loaded';
              }
            }());
            return wallet.state = (function(){
              switch (false) {
              case err == null:
                return 'error';
              default:
                return 'success';
              }
            }());
          });
        } catch (e$) {
          err = e$;
          wallet.status = "error";
          wallet.state = 'error';
          cb();
        }
        return cb();
      }, 1);
    };
    map(buildLoader)(
    store.current.account.wallets);
    calcWallet.loading = false;
    return cb(null);
  };
  module.exports = calcWallet;
}).call(this);