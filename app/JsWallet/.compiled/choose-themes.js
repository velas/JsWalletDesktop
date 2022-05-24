// Generated by LiveScript 1.6.0
(function(){
  var react, button, themes, ref$, objToPairs, map, createButton;
  react = require('react');
  button = require('../components/button.ls');
  themes = require('../themes.ls');
  ref$ = require('prelude-ls'), objToPairs = ref$.objToPairs, map = ref$.map;
  createButton = function(store, web3t){
    return function(text){
      var use, backgroundStyle, buttonStyle, controlStyle, children;
      use = function(){
        return web3t.setTheme(text);
      };
      backgroundStyle = {
        background: themes[text].background,
        backgroundColor: themes[text].bgspare
      };
      buttonStyle = {
        background: themes[text].primary1,
        backgroundColor: themes[text].primary1Spare
      };
      controlStyle = {
        background: themes[text].bgPrimaryLight
      };
      return react.createElement('div', {
        className: 'theme'
      }, children = [
        react.createElement('div', {
          className: 'pallete'
        }, children = [
          react.createElement('div', {
            style: backgroundStyle,
            className: 'box'
          }), react.createElement('div', {
            style: buttonStyle,
            className: 'box'
          }), react.createElement('div', {
            style: controlStyle,
            className: 'box'
          })
        ]), button({
          store: store,
          text: text,
          onClick: use,
          icon: 'show',
          type: 'secondary'
        })
      ]);
    };
  };
  module.exports = function(store, web3t){
    var children;
    return react.createElement('div', {
      className: 'choose-theme choose-theme-1045472592'
    }, children = map(createButton(store, web3t))(
    map(function(it){
      return it[0];
    })(
    objToPairs(
    themes))));
  };
}).call(this);
