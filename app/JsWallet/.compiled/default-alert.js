// Generated by LiveScript 1.6.0
(function(){
  var react, getPrimaryInfo, getLang, icons;
  react = require('react');
  getPrimaryInfo = require('./../get-primary-info.ls');
  getLang = require('./../get-lang.ls');
  icons = require('./../icons.ls');
  module.exports = function(store){
    var message, copiedClass, style, lang, cut, copyStyle, cancel, children;
    if (store.current.send.parseError === '') {
      return null;
    }
    if (store.current.send.parseError === '') {
      message = null;
    }
    copiedClass = '';
    style = getPrimaryInfo(store);
    lang = getLang(store);
    cut = function(tx){
      var t;
      if (tx == null) {
        return 'none';
      }
      t = tx.toString();
      if (t.toLowerCase().indexOf("private key") > -1) {
        return t;
      } else {
        return t.substr(0, 10) + '..' + t.substr(tx.length - 25, 0) + '..' + t.substr(t.length - 10, 10);
      }
    };
    copyStyle = {
      color: style.app.text,
      zIndex: 99999999999
    };
    cancel = function(){
      return store.current.send.parseError = "";
    };
    return react.createElement('div', {
      key: "default-alert",
      style: copyStyle,
      className: "opened copied copied-2047102665"
    }, children = [
      react.createElement('div', {
        onClick: cancel,
        id: "prompt-close",
        className: 'button-close'
      }, children = react.createElement('span', {
        className: 'cancel'
      }, children = react.createElement('img', {
        src: icons.close + "",
        className: 'icon-svg-cancel'
      }))), react.createElement('div', {
        className: 'copied-inner'
      }, children = [
        react.createElement('div', {
          className: 'mb-5'
        }, ' ' + lang.errorParseTitle), react.createElement('div', {
          className: 'contents'
        }, children = [
          react.createElement('span', {}, ' ' + lang.errorParseMessage1), react.createElement('a', {
            target: "_blank",
            href: "https://support.velas.com"
          }, ' ' + lang.support.toLowerCase()), react.createElement('span', {}, ' ' + lang.errorParseMessage2)
        ])
      ])
    ]);
  };
}).call(this);