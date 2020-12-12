// Generated by LiveScript 1.6.0
(function(){
  var react, navigate, getPrimaryInfo, web3, getLang, historyFuncs, icons, button, get, terms;
  react = require('react');
  navigate = require('../navigate.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  web3 = require('../web3.ls');
  getLang = require('../get-lang.ls');
  historyFuncs = require('../history-funcs.ls');
  icons = require('../icons.ls');
  button = require('../components/button.ls');
  get = require('../../web3t/providers/superagent.ls').get;
  terms = function(arg$){
    var store, web3t, lang, goBack, info, style, buttonStyle, btnIcon, accept, children;
    store = arg$.store, web3t = arg$.web3t;
    lang = getLang(store);
    goBack = function(){
      return navigate(store, web3t, 'settings');
    };
    info = getPrimaryInfo(store);
    style = {
      background: info.app.wallet,
      color: info.app.text
    };
    buttonStyle = {
      color: info.app.text
    };
    btnIcon = {
      filter: info.app.btnIcon
    };
    accept = function(){
      navigate(store, web3t, ':init');
      return web3t.refresh(function(){});
    };
    return react.createElement('div', {
      className: 'terms terms1061065338'
    }, children = react.createElement('div', {
      className: 'terms-body'
    }, children = [
      react.createElement('div', {
        className: 'header'
      }, ' ' + lang.privacyPolicy), react.createElement('textarea', {
        value: store.terms + "",
        style: style
      }), react.createElement('div', {
        className: 'buttons'
      }, children = button({
        store: store,
        text: 'back',
        onClick: goBack,
        icon: 'arrowLeft',
        type: 'primary'
      }))
    ]));
  };
  terms.init = function(arg$, cb){
    var store;
    store = arg$.store;
    return get('https://raw.githubusercontent.com/askucher/expo-web3/dev/Privacy.md').end(function(err, res){
      if (!(res != null && res.text)) {
        return cb(err);
      }
      store.terms = res.text;
      return cb(null);
    });
  };
  module.exports = terms;
}).call(this);
