// Generated by LiveScript 1.6.0
(function(){
  var react, reactDom, navigate, getPrimaryInfo, CopyToClipboard, copiedInform, copy, web3, getLang, historyFuncs, icon, switchAccount, icons, epoch, alertDemo, burger, find, Staking, StakingStore, staking2;
  react = require('react');
  reactDom = require('react-dom');
  navigate = require('../navigate.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  CopyToClipboard = require('react-copy-to-clipboard').CopyToClipboard;
  copiedInform = require('../copied-inform.ls');
  copy = require('../copy.ls');
  web3 = require('../web3.ls');
  getLang = require('../get-lang.ls');
  historyFuncs = require('../history-funcs.ls');
  icon = require('./icon.ls');
  switchAccount = require('./switch-account.ls');
  icons = require('../icons.ls');
  epoch = require('./epoch.ls');
  alertDemo = require('./alert-demo.ls');
  burger = require('../components/burger.ls');
  find = require('prelude-ls').find;
  Staking = require('@velas/staking.2.0');
  StakingStore = require('@velas/staking.2.0/lib/modules/staking-store.js').StakingStore;
  staking2 = function(arg$){
    var store, web3t, lang, goBack, gotoSearch, info, action, active, style, borderStyle, resource, showClass, children;
    store = arg$.store, web3t = arg$.web3t;
    lang = getLang(store);
    goBack = historyFuncs(store, web3t).goBack;
    gotoSearch = function(){
      return navigate(store, web3t, 'search');
    };
    info = getPrimaryInfo(store);
    action = function(){
      return store.current.active = !store.current.active;
    };
    active = store.current.active ? 'active' : "";
    style = {
      background: info.app.wallet,
      color: info.app.text
    };
    borderStyle = {
      color: info.app.text,
      borderBottom: "1px solid " + info.app.border,
      background: info.app.background,
      backgroundColor: info.app.bgspare
    };
    resource = {
      color: info.app.text,
      border: "1px solid " + info.app.border,
      background: info.app.header,
      borderRadius: info.app.borderBtn
    };
    showClass = store.current.openMenu ? 'hide' : "";
    /* Render */
    return react.createElement('div', {
      className: 'staking2 staking2-981606074'
    }, children = [
      react.createElement('div', {
        style: borderStyle,
        className: 'title'
      }, children = [
        react.createElement('div', {
          className: showClass + " header"
        }, ' ' + lang.staking), burger(store, web3t)
      ]), react.createElement('div', {
        className: 'container'
      }, children = react.createElement(Staking, {
        stakingStore: store.stakingStore,
        lang: lang,
        info: info
      }))
    ]);
  };
  staking2.init = function(arg$, cb){
    var store, web3t, wallet_native, nativeData, ref$, wallet_evm, evmData, ref1$, config, stakingStore;
    store = arg$.store, web3t = arg$.web3t;
    wallet_native = find(function(it){
      return it.coin.token === 'vlx_native';
    })(
    store.current.account.wallets);
    nativeData = wallet_native != null ? (ref$ = wallet_native.network) != null ? ref$.api : void 8 : void 8;
    wallet_evm = find(function(it){
      return it.coin.token === 'vlx_evm';
    })(
    store.current.account.wallets);
    evmData = wallet_evm != null ? (ref1$ = wallet_evm.network) != null ? ref1$.api : void 8 : void 8;
    config = {
      API_HOST: nativeData.apiUrl,
      evmAPI: evmData.web3Provider,
      nativeApi: nativeData.web3Provider,
      validatorsBackend: nativeData.validatorsBackend,
      publicKey: wallet_native.publicKey,
      evmAddress: wallet_evm.address,
      evmPrivateKey: wallet_evm.privateKey,
      network: store.current.network,
      nativePrivateKey: wallet_native.privateKey,
      fetchAccountsFromBackend: false,
      refresh: true
    };
    stakingStore = new StakingStore(config);
    store.stakingStore = stakingStore;
    return cb(null);
  };
  module.exports = staking2;
}).call(this);
