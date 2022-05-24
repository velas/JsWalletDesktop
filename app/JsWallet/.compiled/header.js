// Generated by LiveScript 1.6.0
(function(){
  var react, icons, getPrimaryInfo, getLang, switchAccount, navigate, addWallet, applyTransactions, ref$, map, find, filter, groupBy, keys, objToPairs;
  react = require('react');
  icons = require('../icons.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  getLang = require('../get-lang.ls');
  switchAccount = require('../pages/switch-account.ls');
  navigate = require('../navigate.ls');
  addWallet = require('../pages/add-wallet.ls');
  applyTransactions = require('../apply-transactions.ls');
  ref$ = require('prelude-ls'), map = ref$.map, find = ref$.find, filter = ref$.filter, groupBy = ref$.groupBy, keys = ref$.keys, objToPairs = ref$.objToPairs;
  module.exports = function(store, web3t){
    var lang, style, rightSide, header, lockIcon, iconStyle, inputStyle, iconColor, buttonAdd, lock, showClass, show, searchOnChange, children;
    lang = getLang(store);
    style = getPrimaryInfo(store);
    rightSide = {
      borderLeft: "1px solid " + style.app.border
    };
    header = {
      color: style.app.text,
      borderBottom: "1px solid " + style.app.border,
      background: style.app.leftSide
    };
    lockIcon = {
      width: "14px",
      filter: style.app.iconFilter
    };
    iconStyle = {
      color: style.app.text,
      borderLeft: "1px solid " + style.app.border
    };
    inputStyle = {
      background: style.app.inputLight,
      border: "0",
      color: style.app.text
    };
    iconColor = {
      filter: style.app.iconFilter
    };
    buttonAdd = {
      color: style.app.text,
      background: style.app.bgBtn,
      filter: style.app.icon1
    };
    lock = function(){
      return navigate(store, web3t, 'locked');
    };
    showClass = store.menu.show ? 'show' : "";
    show = function(){
      return store.menu.show = !store.menu.show;
    };
    searchOnChange = function(event){
      var walletsGroups, groups, groupIndex, groupsWallets, groupWallets, wallet;
      store.current.search = event.target.value;
      walletsGroups = groupBy(function(it){
        return it.network.group;
      })(
      filter(function(arg$){
        var coin, network;
        coin = arg$.coin, network = arg$.network;
        return (coin.name + coin.token).toLowerCase().indexOf(store.current.search.toLowerCase()) !== -1 && network.disabled !== true;
      })(
      filter(function(it){
        return it != null;
      })(
      store.current.account.wallets)));
      groups = keys(
      walletsGroups);
      groupIndex = store.current.groupIndex;
      groupsWallets = map(function(it){
        return it[1];
      })(
      objToPairs(
      walletsGroups));
      groupWallets = groupsWallets[groupIndex];
      if (groupWallets == null) {
        groupWallets = [];
      }
      wallet = find(function(it){
        return groupWallets.indexOf(it) === store.current.walletIndex;
      })(
      groupWallets);
      if (wallet == null) {
        store.current.groupIndex = 0;
        store.current.walletIndex = 0;
      }
      store.current.filter.token = (function(){
        switch (false) {
        case wallet == null:
          return wallet.coin.token;
        default:
          return "";
        }
      }());
      return applyTransactions(store);
    };
    return react.createElement('div', {
      style: header,
      className: 'header header1840047076'
    }, children = [
      react.createElement('div', {
        className: 'left-side'
      }, children = [
        react.createElement('button', {
          style: buttonAdd,
          onClick: show,
          id: "menu-hamb-tablet",
          className: showClass + " button menu"
        }, children = react.createElement('img', {
          src: icons.menu + "",
          className: 'icon-svg-plus'
        })), react.createElement('div', {
          className: 'search-area'
        }, children = [
          react.createElement('input', {
            type: 'text',
            style: inputStyle,
            placeholder: "Search",
            value: store.current.search,
            onChange: searchOnChange
          }), react.createElement('img', {
            src: icons.search + "",
            style: iconColor
          })
        ]), addWallet({
          store: store,
          web3t: web3t
        })
      ]), react.createElement('div', {
        style: rightSide,
        className: 'right-side'
      }, children = [
        switchAccount(store, web3t), store.preference.lockVisible === true ? react.createElement('div', {
          onClick: lock,
          style: iconStyle,
          className: 'menu-item bottom'
        }, children = react.createElement('img', {
          src: icons.lock + "",
          style: lockIcon
        })) : void 8
      ])
    ]);
  };
}).call(this);
