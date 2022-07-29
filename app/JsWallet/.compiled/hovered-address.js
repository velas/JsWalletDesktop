// Generated by LiveScript 1.6.0
(function(){
  var react, qrcode, getPrimaryInfo;
  react = require('react');
  qrcode = require('../components/qrcode.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  module.exports = function(arg$){
    var store, style, copyStyle, children;
    store = arg$.store;
    if (store.current.tryCopy == null) {
      return null;
    }
    style = getPrimaryInfo(store);
    copyStyle = {
      color: style.app.text,
      background: style.app.bgPrimaryLight,
      border: "1px solid " + style.app.border
    };
    return react.createElement('div', {
      style: copyStyle,
      className: 'hovered-address hovered-address-239788434'
    }, children = [
      react.createElement('div', {
        className: 'text'
      }, ' ' + store.current.tryCopy), react.createElement('div', {
        className: 'qr-border'
      }, children = qrcode({
        store: store,
        address: store.current.tryCopy
      }))
    ]);
  };
}).call(this);