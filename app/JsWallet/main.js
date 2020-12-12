// Generated by LiveScript 1.6.0
(function(){
  var observer, ref$, observable, toJS, render, react, patchCrypto, app, dataScheme, window, web3, autodetectLang, getDevice, getSize, startService, renderError, scamWarning, serviceWorker, isAllowedContext, state, store, changeDevice, lockWallet, newIdle, resetIdle, i$, len$, event, web3t, safeRender, Main, asCallback, bootstrap, out$ = typeof exports != 'undefined' && exports || this, toString$ = {}.toString;
  observer = require('mobx-react').observer;
  ref$ = require('mobx'), observable = ref$.observable, toJS = ref$.toJS;
  render = require('react-dom').render;
  react = require('react');
  patchCrypto = require('./patch-crypto.js');
  app = require('./app.ls');
  dataScheme = require('./data-scheme.ls');
  window = require('./browser/window.ls');
  web3 = require('./web3.ls');
  autodetectLang = require('./autodetect-lang.ls');
  getDevice = require('./get-device.ls');
  getSize = require('./get-size.ls');
  startService = require('./background/background-task.ls').startService;
  renderError = require('./render-error.ls');
  scamWarning = require('./scam-warning.ls');
  serviceWorker = require('./service-worker.ls');
  isAllowedContext = function(){
    if (window === window.parent) {
      return true;
    }
    if (document.location.origin === 'https://app.symblox.io') {
      return true;
    }
    if (document.location.origin === 'http://localhost:8080') {
      return true;
    }
    return false;
  };
  state = {
    timeout: null
  };
  store = observable(dataScheme);
  startService(store);
  changeDevice = function(){
    store.current.device = getDevice();
    return store.current.size = getSize();
  };
  lockWallet = function(){
    if (window.nolock === true || store.current.page !== 'wallets') {
      return;
    }
    return store.current.page = 'locked';
  };
  newIdle = function(){
    return setTimeout(lockWallet, 90000);
  };
  resetIdle = function(){
    clearTimeout(state.timeout);
    return state.timeout = newIdle();
  };
  window.addEventListener("resize", changeDevice);
  for (i$ = 0, len$ = (ref$ = ['mousemove', 'click', 'touchmove', 'keydown']).length; i$ < len$; ++i$) {
    event = ref$[i$];
    window.addEventListener(event, resetIdle);
  }
  out$.web3t = web3t = web3(store);
  out$.store = store;
  safeRender = function(func){
    var state, err;
    state = {
      result: null
    };
    try {
      state.result = func();
    } catch (e$) {
      err = e$;
      state.result = renderError(err);
    }
    return state.result;
  };
  Main = observer(function(arg$){
    var store;
    store = arg$.store;
    return safeRender(function(){
      return app({
        store: store,
        web3t: web3t
      });
    });
  });
  if ('serviceWorker' in navigator) {
    console.log("in!");
    window.addEventListener('load', function(){
      navigator.serviceWorker.register('./service-worker.js').then(function(registration){
        console.log('ServiceWorker registration successful with scope: ', registration.scope);
      }, function(err){
        console.log('ServiceWorker registration failed: ', err);
      });
    });
  } else {
    console.log('service worker is not supported');
  }
  asCallback = function(p, cb){
    p.then(function(res){
      return cb(null, res);
    });
    return p['catch'](function(err){
      return cb(err);
    });
  };
  out$.bootstrap = bootstrap = function(root, options){
    store.root = root;
    render(react.createElement(Main, {
      store: store
    }), root);
    if ((options != null ? options.autoLang : void 8) !== false) {
      autodetectLang(store);
    }
    if (toString$.call(options).slice(8, -1) === 'Object') {
      return web3t.setPreference(options);
    }
  };
  importAll$(window, out$);
  scamWarning();
  function importAll$(obj, src){
    for (var key in src) obj[key] = src[key];
    return obj;
  }
}).call(this);
