// Generated by LiveScript 1.6.0
(function(){
  var react, newseedFuncs, getLang, getPrimaryInfo, ref$, map, sortBy, filter, navigate, icons, bip39, typeahead, restoreWords, restoreWordsPanel, newseed;
  react = require('react');
  newseedFuncs = require('../newseed-funcs.ls');
  getLang = require('../get-lang.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  ref$ = require('prelude-ls'), map = ref$.map, sortBy = ref$.sortBy, filter = ref$.filter;
  navigate = require('../navigate.ls');
  icons = require('../icons.ls');
  bip39 = require('../../web3t/providers/deps.ls').bip39;
  typeahead = require('../components/typeahead.ls');
  restoreWords = curry$(function(store, web3t, next, item){
    var lang, style, seedStyle, txtStyle, index, list, changePart, onKeyDown, children;
    lang = getLang(store);
    style = getPrimaryInfo(store);
    seedStyle = {
      border: "1px solid " + style.app.border,
      color: style.app.text
    };
    txtStyle = {
      color: style.app.text
    };
    index = store.current.seedWords.indexOf(item) + 1;
    list = bip39.wordlists.EN;
    changePart = function(it){
      return item.part = it.target.value;
    };
    onKeyDown = function(it){
      if (it.keyCode === 13) {
        return next();
      }
    };
    return react.createElement('div', {
      style: seedStyle,
      className: 'word'
    }, children = store.current.seedWords.length === 1
      ? react.createElement('textarea', {
        value: item.part + "",
        placeholder: "Enter your custom seed phrase here. Please check your addresses and balances before use.",
        onChange: changePart
      })
      : [
        typeahead({
          store: store,
          value: item.part,
          placeholder: lang.word + " #" + index,
          onChange: changePart,
          onKeyDown: onKeyDown,
          list: list
        }), react.createElement('span', {
          className: 'effect'
        }, ' ' + index)
      ]);
  });
  restoreWordsPanel = function(store, web3t){
    var lang, save, style, buttonPrimary1Style, buttonPrimary3Style, btnIcon, textStyle, back, next, currentWord, children;
    lang = getLang(store);
    save = newseedFuncs(store, web3t).save;
    style = getPrimaryInfo(store);
    buttonPrimary1Style = {
      border: "0",
      color: style.app.text,
      background: style.app.primary1,
      backgroundColor: style.app.primary1Spare
    };
    buttonPrimary3Style = {
      border: "0",
      color: style.app.text2,
      background: style.app.primary3,
      backgroundColor: style.app.primary3Spare
    };
    btnIcon = {
      filter: style.app.btnIcon
    };
    textStyle = {
      color: style.app.text
    };
    back = function(){
      return store.current.page = 'newseedrestore';
    };
    next = function(){
      var max, word;
      max = store.current.seedWords.length - 1;
      word = sortBy(function(it){
        return it.index;
      })(
      store.current.seedWords)[store.current.verifySeedIndex].part;
      if (!in$(word, bip39.wordlists.EN) && store.current.seedWords.length !== 1) {
        return store.current.alert = lang.wordIncorrect;
      }
      if (store.current.verifySeedIndex < max) {
        return store.current.verifySeedIndex += 1;
      }
      return save();
    };
    currentWord = curry$(function(i, item){
      if (item.index === i) {
        return true;
      }
      return false;
    });
    return react.createElement('div', {}, children = [
      react.createElement('div', {
        className: 'words'
      }, children = map(restoreWords(store, web3t, next))(
      filter(currentWord(store.current.verifySeedIndex))(
      sortBy(function(it){
        return it.index;
      })(
      store.current.seedWords)))), react.createElement('div', {}, children = [
        react.createElement('button', {
          onClick: back,
          style: buttonPrimary3Style,
          className: 'right'
        }, children = [
          react.createElement('img', {
            src: icons.close2 + "",
            style: btnIcon,
            className: 'icon-svg'
          }), " " + lang.cancel
        ]), react.createElement('button', {
          onClick: next,
          style: buttonPrimary1Style,
          className: 'right'
        }, children = [
          react.createElement('img', {
            src: icons.right + "",
            className: 'icon-svg'
          }), " " + lang.next
        ])
      ]), react.createElement('div', {
        style: textStyle,
        className: 'hint'
      }, ' ' + lang.newSeedWarningRestore)
    ]);
  };
  newseed = function(arg$){
    var store, web3t, lang, style, textStyle, seedStyle, newseedStyle, children;
    store = arg$.store, web3t = arg$.web3t;
    lang = getLang(store);
    style = getPrimaryInfo(store);
    textStyle = {
      color: style.app.text
    };
    seedStyle = {
      border: "1px solid " + style.app.primaryOpct,
      color: style.app.text
    };
    newseedStyle = {
      marginBottom: "10px",
      width: "120px"
    };
    return react.createElement('div', {
      className: 'newseed newseed2001585109'
    }, children = [
      react.createElement('img', {
        style: newseedStyle,
        src: icons.newseed + ""
      }), react.createElement('div', {
        style: textStyle,
        className: 'title'
      }, ' ' + lang.yourSeedPhrase), restoreWordsPanel(store, web3t)
    ]);
  };
  module.exports = newseed;
  newseed.init = function(arg$, cb){
    var store;
    store = arg$.store;
    store.current.verifySeedIndex = 0;
    return cb(null);
  };
  function curry$(f, bound){
    var context,
    _curry = function(args) {
      return f.length > 1 ? function(){
        var params = args ? args.concat() : [];
        context = bound ? context || this : this;
        return params.push.apply(params, arguments) <
            f.length && arguments.length ?
          _curry.call(context, params) : f.apply(context, params);
      } : f;
    };
    return _curry();
  }
  function in$(x, xs){
    var i = -1, l = xs.length >>> 0;
    while (++i < l) if (x === xs[i]) return true;
    return false;
  }
}).call(this);
