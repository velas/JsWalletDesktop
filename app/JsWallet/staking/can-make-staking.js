// Generated by LiveScript 1.6.0
(function(){
  var ref$, div, times, plus, minus, moment;
  ref$ = require('../math.ls'), div = ref$.div, times = ref$.times, plus = ref$.plus, minus = ref$.minus;
  moment = require('moment');
  module.exports = function(store, web3t, cb){
    return web3t.velas.Staking.areStakeAndWithdrawAllowed(function(err, data){
      if (err != null) {
        return cb(err);
      }
      if (data === true) {
        return cb(null);
      }
      return web3t.velas.Staking.stakingEpochEndBlock(function(err, nextBlock){
        var block;
        block = plus(nextBlock, 1);
        return web3t.velas.web3.getBlockNumber(function(err, currentBlock){
          var seconds, next;
          seconds = times(minus(currentBlock, block), 5);
          if (err != null) {
            return cb(err);
          }
          next = moment().add(seconds, 'seconds').fromNow();
          return cb("Consensus changes are paused till " + block + " block. Please repeat " + next);
        });
      });
    });
  };
}).call(this);
