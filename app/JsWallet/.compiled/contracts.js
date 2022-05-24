// Generated by LiveScript 1.6.0
(function(){
  var ref$, map, find, keys, filter, addresses, div, swappingAddresses, getContractByName, getContractName, isContract, isSwapContract, getHomeNetworkFee, out$ = typeof exports != 'undefined' && exports || this;
  ref$ = require('prelude-ls'), map = ref$.map, find = ref$.find, keys = ref$.keys, filter = ref$.filter;
  addresses = require('./velas/addresses.ls');
  div = require('./math.ls').div;
  swappingAddresses = require('./swaping/addresses.ls');
  out$.getContractByName = getContractByName = function(store, name){
    var network;
    network = store.current.network;
    return addresses[network][name];
  };
  out$.getContractName = getContractName = function(store, address){
    var network, result, ref$;
    network = store.current.network;
    result = filter(function(it){
      var ref$;
      return ((ref$ = addresses[network][it]) != null ? ref$ : "").toLowerCase() === address.toLowerCase();
    })(
    keys(
    addresses[network]));
    return (ref$ = result[0]) != null ? ref$ : address;
  };
  out$.isContract = isContract = function(store, address){
    var network, addresss, found;
    if (address == null) {
      return false;
    }
    network = store.current.network;
    addresss = (address + "").trim();
    if (addresss === "") {
      return false;
    }
    found = find(function(it){
      return addresses[network][it].toLowerCase() === addresss.toLowerCase();
    })(
    keys(
    addresses[network]));
    return found != null && found.length > 0;
  };
  out$.isSwapContract = isSwapContract = function(store, address){
    var network, addresss, found;
    if (address == null) {
      return false;
    }
    network = store.current.network;
    addresss = (address + "").trim();
    if (addresss === "") {
      return false;
    }
    found = find(function(it){
      return swappingAddresses[network][it].toLowerCase() === addresss.toLowerCase();
    })(
    keys(
    swappingAddresses[network]));
    return found != null && found.length > 0;
  };
  out$.getHomeNetworkFee = getHomeNetworkFee = function(arg$, address, cb){
    var store, web3t, name;
    store = arg$.store, web3t = arg$.web3t;
    name = getContractName(store, address);
    if (name !== "ForeignBridge") {
      return cb(null);
    }
    return web3t.velas.HomeBridgeNativeToErc.getHomeFee(function(err, fee){
      if (err != null) {
        return cb(err);
      }
      return cb(null, div(fee, Math.pow(10, 18)));
    });
  };
}).call(this);
