// Generated by LiveScript 1.6.0
(function(){
  var ref$, map, join;
  ref$ = require('prelude-ls'), map = ref$.map, join = ref$.join;
  module.exports = function(store){
    return join(',')(
    map(function(it){
      return it.coin.token + ':' + it.address;
    })(
    store.current.account.wallets));
  };
}).call(this);
