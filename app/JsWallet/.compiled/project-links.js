// Generated by LiveScript 1.6.0
(function(){
  var getPrimaryInfo, react, map, getLang, createLink;
  getPrimaryInfo = require('../get-primary-info.ls');
  react = require('react');
  map = require('prelude-ls').map;
  getLang = require('../get-lang.ls');
  createLink = curry$(function(store, item){
    var info, style, children;
    info = getPrimaryInfo(store);
    style = {
      backgroundColor: info.color
    };
    return react.createElement('a', {
      href: item.href + "",
      style: style,
      target: "_blank",
      rel: "noopener noreferrer nofollow",
      className: 'link'
    }, children = react.createElement('img', {
      src: item.image + ""
    }));
  });
  module.exports = function(arg$){
    var store, info, style, children;
    store = arg$.store;
    info = getPrimaryInfo(store);
    style = {
      color: info.color
    };
    if (info.links.length === 0) {
      react.createElement('div', {
        style: style
      }, ' No Links');
    } else {}
    return react.createElement('div', {
      className: 'links links-1467872500'
    }, children = map(createLink(store))(
    info.links));
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
}).call(this);
