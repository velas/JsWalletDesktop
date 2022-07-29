// Generated by LiveScript 1.6.0
(function(){
  var ref$, map, filter, objToPairs, addresses, contracts, getAddressLabel, getAddress, getAddressLink, getAddressTitle, getAddressDisplay, out$ = typeof exports != 'undefined' && exports || this, toString$ = {}.toString;
  ref$ = require('prelude-ls'), map = ref$.map, filter = ref$.filter, objToPairs = ref$.objToPairs;
  addresses = require('./velas/addresses.ls');
  contracts = require('./contracts.ls');
  getAddressLabel = function(wallet){
    var ref$;
    switch (false) {
    case (ref$ = wallet.coin.token) !== 'xem' && ref$ !== 'eos':
      return 'account';
    default:
      return 'address';
    }
  };
  getAddress = function(wallet, addressSuffix){
    return wallet["address" + addressSuffix];
  };
  out$.getAddressLink = getAddressLink = function(wallet, addressSuffix){
    var address, network, ref$, ref1$, res, $cluster;
    address = getAddress(wallet, addressSuffix);
    network = ((ref$ = global.store) != null ? (ref1$ = ref$.current) != null ? ref1$.network : void 8 : void 8) || 'mainnet';
    res = (function(){
      var ref$, ref1$, ref2$, ref3$, ref4$, ref5$;
      switch (false) {
      case wallet.network != null:
        return 'about:blank';
      case wallet.coin.token !== 'btc':
        return "https://bitpay.com/insight/#/BTC/" + network + "/address/" + address;
      case wallet.coin.token !== 'vlx_native':
        $cluster = (wallet != null ? (ref$ = wallet.network) != null ? (ref1$ = ref$.api) != null ? ref1$.cluster : void 8 : void 8 : void 8) != null ? "?cluster=" + wallet.network.api.cluster : "";
        return (wallet != null ? (ref2$ = wallet.network) != null ? (ref3$ = ref2$.api) != null ? ref3$.url : void 8 : void 8 : void 8) + "/" + getAddressLabel(wallet) + "/" + address + $cluster;
      case toString$.call(address).slice(8, -1) !== 'String':
        return (wallet != null ? (ref4$ = wallet.network) != null ? (ref5$ = ref4$.api) != null ? ref5$.url : void 8 : void 8 : void 8) + "/" + getAddressLabel(wallet) + "/" + address;
      case !(toString$.call(address).slice(8, -1) === 'Null' && wallet.publicKey != null):
        return wallet.network.registerAccountLink.replace(':public-key', wallet.publicKey);
      default:
        return "#";
      }
    }());
    return res;
  };
  out$.getAddressTitle = getAddressTitle = function(wallet, addressSuffix){
    var address, res;
    address = getAddress(wallet, addressSuffix);
    res = (function(){
      switch (false) {
      case toString$.call(address).slice(8, -1) !== 'String':
        return address;
      case toString$.call(address).slice(8, -1) !== 'Null':
        return "...";
      default:
        return "n/a";
      }
    }());
    return res;
  };
  out$.getAddressDisplay = getAddressDisplay = function(store, wallet, addressSuffix){
    var address;
    address = getAddress(wallet, addressSuffix);
    if (address == null) {
      return "";
    }
    return address;
  };
}).call(this);