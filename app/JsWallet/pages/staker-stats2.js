// Generated by LiveScript 1.6.0
(function(){
  var Pie, react, map, ethToVlx, getStake, getColor, buildData, legend;
  Pie = require('react-chartjs-2').Pie;
  react = require('react');
  map = require('prelude-ls').map;
  ethToVlx = require('../../web3t/addresses.js').ethToVlx;
  getStake = function(it){
    switch (false) {
    case it.stakers !== '..':
      return 0;
    default:
      return +it.stakers;
    }
  };
  getColor = function(items){
    return function(it){
      var index, base, h;
      index = items.indexOf(it);
      base = (function(){
        switch (false) {
        case it.status !== 'active':
          return 3986863 + index * 2;
        case it.status !== 'inactive':
          return 3872625;
        case it.status !== 'banned':
          return 16730920;
        default:
          return 3872625;
        }
      }());
      h = base.toString(16);
      return '#' + h;
    };
  };
  buildData = function(items){
    return {
      datasets: [{
        data: map(getStake)(
        items),
        backgroundColor: map(getColor(items))(
        items)
      }],
      labels: map(ethToVlx)(
      map(function(it){
        return it.address;
      })(
      items))
    };
  };
  legend = {
    display: false
  };
  module.exports = function(store, web3t){
    var data;
    if (store.staking.pools.length === 0) {
      return null;
    }
    data = buildData(store.staking.pools);
    return react.createElement(Pie, {
      data: data,
      width: 100,
      height: 100,
      legend: legend
    });
  };
}).call(this);