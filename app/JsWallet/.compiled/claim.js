// Generated by LiveScript 1.6.0
(function(){
  var react, getLang, getPrimaryInfo, historyFuncs, switchAccount, icons, claimStake, burger;
  react = require('react');
  getLang = require('../get-lang.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  historyFuncs = require('../history-funcs.ls');
  switchAccount = require('./switch-account.ls');
  icons = require('../icons.ls');
  claimStake = require('./claim-stake.ls');
  burger = require('../components/burger.ls');
  module.exports = function(arg$){
    var store, web3t, lang, goBack, gotoSearch, info, style, borderStyle, borderStyle2, borderRight, buttonPrimary2Style, headerTableStyle, lightText, children;
    store = arg$.store, web3t = arg$.web3t;
    lang = getLang(store);
    goBack = historyFuncs(store, web3t).goBack;
    gotoSearch = function(){
      return navigate(store, web3t, 'search');
    };
    info = getPrimaryInfo(store);
    style = {
      background: info.app.wallet,
      color: info.app.text
    };
    borderStyle = {
      color: info.app.text,
      borderBottom: "1px solid " + info.app.border
    };
    borderStyle2 = {
      color: info.app.text,
      borderBottom: "1px solid " + info.app.border,
      background: "#4b2888"
    };
    borderRight = {
      color: info.app.text,
      borderRight: "1px solid " + info.app.border
    };
    buttonPrimary2Style = {
      border: "1px solid " + info.app.primary2,
      color: info.app.text,
      background: info.app.primary2,
      backgroundColor: info.app.primary2Spare
    };
    headerTableStyle = {
      borderBottom: "1px solid " + info.app.border,
      background: info.app.walletLight
    };
    lightText = {
      color: info.app.color3
    };
    return react.createElement('div', {
      className: 'claim claim-1259137236'
    }, children = [
      react.createElement('div', {
        style: borderStyle,
        className: 'title'
      }, children = [
        react.createElement('div', {
          className: 'header'
        }, ' Claim Reward'), react.createElement('div', {
          onClick: goBack,
          className: 'close'
        }, children = react.createElement('img', {
          src: icons.arrowLeft + "",
          className: 'icon-svg'
        })), burger(store, web3t), switchAccount(store, web3t)
      ]), react.createElement('div', {
        className: 'claim-content'
      }, children = react.createElement('div', {
        className: 'form-group'
      }, children = claimStake(store, web3t)))
    ]);
  };
}).call(this);