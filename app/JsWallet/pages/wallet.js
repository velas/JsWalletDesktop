// Generated by LiveScript 1.6.0
(function(){
  var react, money, ref$, each, find, walletFuncs, getLang, icon, getPrimaryInfo, get, icons, roundHuman, alert, button, addressHolder, cb;
  react = require('react');
  money = require('../tools.ls').money;
  ref$ = require('prelude-ls'), each = ref$.each, find = ref$.find;
  walletFuncs = require('../wallet-funcs.ls');
  getLang = require('../get-lang.ls');
  icon = require('./icon.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  get = require('../../web3t/providers/superagent.ls').get;
  icons = require('../icons.ls');
  roundHuman = require('../round-human.ls');
  alert = require('./confirmation.ls').alert;
  button = require('../components/button.ls');
  addressHolder = require('../components/address-holder.ls');
  cb = bind$(console, 'log');
  module.exports = curry$(function(store, web3t, wallets, wallet){
    var ref$, buttonStyle, uninstall, active, big, balance, balanceUsd, pending, send, receive, expand, usdRate, last, lang, style, labelUninstall, walletStyle, borderStyle, border, buttonPrimary3Style, addressInput, btnIcon, iconColor, placeholder, placeholderCoin, name, receiveClick, sendClick, children;
    ref$ = walletFuncs(store, web3t, wallets, wallet), buttonStyle = ref$.buttonStyle, uninstall = ref$.uninstall, wallet = ref$.wallet, active = ref$.active, big = ref$.big, balance = ref$.balance, balanceUsd = ref$.balanceUsd, pending = ref$.pending, send = ref$.send, receive = ref$.receive, expand = ref$.expand, usdRate = ref$.usdRate, last = ref$.last;
    lang = getLang(store);
    style = getPrimaryInfo(store);
    labelUninstall = (function(){
      switch (false) {
      case !store.current.refreshing:
        return '...';
      default:
        return lang.hide + "";
      }
    }());
    walletStyle = {
      color: style.app.text
    };
    borderStyle = {
      borderBottom: "1px solid " + style.app.border
    };
    border = {
      borderTop: "1px solid " + style.app.border,
      borderRight: "1px solid " + style.app.border
    };
    buttonPrimary3Style = {
      border: "0",
      color: style.app.text2,
      background: style.app.primary3,
      backgroundColor: style.app.primary3Spare
    };
    addressInput = {
      color: style.app.color3,
      background: style.app.bgPrimaryLight
    };
    btnIcon = {
      filter: style.app.btnIcon
    };
    iconColor = {
      filter: style.app.iconFilter
    };
    placeholder = (function(){
      switch (false) {
      case !store.current.refreshing:
        return "placeholder";
      default:
        return "";
      }
    }());
    placeholderCoin = (function(){
      switch (false) {
      case !store.current.refreshing:
        return "placeholder-coin";
      default:
        return "";
      }
    }());
    name = (ref$ = wallet.coin.name) != null
      ? ref$
      : wallet.coin.token;
    receiveClick = receive(wallet);
    sendClick = send(wallet);
    return react.createElement('div', {
      key: wallet.coin.token + "",
      style: borderStyle,
      className: big + " wallet wallet-1038230902"
    }, children = [
      react.createElement('div', {
        onClick: expand,
        className: 'wallet-top'
      }, children = [
        react.createElement('div', {
          style: walletStyle,
          className: 'top-left'
        }, children = [
          react.createElement('div', {
            className: placeholderCoin + " img"
          }, children = react.createElement('img', {
            src: wallet.coin.image + ""
          })), react.createElement('div', {
            className: 'info'
          }, children = [
            react.createElement('div', {
              className: placeholder + " balance title"
            }, ' ' + name), store.current.device === 'desktop' ? react.createElement('div', {
              title: wallet.balance + "",
              className: placeholder + " price token"
            }, children = [react.createElement('span', {}, ' ' + roundHuman(wallet.balance)), react.createElement('span', {}, ' ' + wallet.coin.token.toUpperCase())]) : void 8, react.createElement('div', {
              title: balanceUsd + "",
              className: placeholder + " price"
            }, children = [react.createElement('span', {}, ' ' + roundHuman(balanceUsd)), react.createElement('span', {}, ' USD')])
          ])
        ]), store.current.device === 'mobile' ? react.createElement('div', {
          style: walletStyle,
          className: 'top-middle'
        }, children = [
          +wallet.pendingSent === 0 ? react.createElement('div', {
            className: placeholder + " balance title"
          }, ' ' + name) : void 8, react.createElement('div', {
            className: placeholder + " balance"
          }, children = [
            react.createElement('span', {
              title: wallet.balance + ""
            }, ' ' + roundHuman(wallet.balance)), react.createElement('img', {
              src: wallet.coin.image + "",
              className: placeholderCoin + " label-coin"
            }), react.createElement('span', {}, ' ' + wallet.coin.token.toUpperCase()), +wallet.pendingSent > 0 ? react.createElement('div', {
              className: 'pending'
            }, children = react.createElement('span', {}, ' -' + pending)) : void 8
          ])
        ]) : void 8, react.createElement('div', {
          className: 'top-right'
        }, children = [
          store.current.device === 'desktop' ? (false && react.createElement('button', {
            onClick: expand,
            style: buttonPrimary3Style,
            className: 'btn-open'
          }, children = react.createElement('img', {
            src: icons.open + "",
            style: btnIcon,
            className: 'icon'
          })), react.createElement('span', {
            onClick: expand,
            className: 'icon'
          }, children = react.createElement('img', {
            src: icons.arrowDown + "",
            style: iconColor,
            className: 'icon-svg-create'
          }))) : void 8, button({
            store: store,
            onClick: typeof onClick != 'undefined' && onClick !== null ? onClick : sendClick,
            text: 'send',
            icon: 'send',
            type: 'primary'
          }), button({
            store: store,
            onClick: typeof onClick != 'undefined' && onClick !== null ? onClick : receiveClick,
            text: 'receive',
            icon: 'get',
            type: 'secondary'
          })
        ])
      ]), react.createElement('div', {
        style: border,
        className: 'wallet-middle'
      }, children = [
        addressHolder({
          store: store,
          wallet: wallet,
          type: 'bg'
        }), (ref$ = wallet.coin.token) !== 'btc' && ref$ !== 'vlx2' ? react.createElement('div', {
          onClick: uninstall,
          style: walletStyle,
          className: 'uninstall'
        }, ' ' + labelUninstall) : void 8
      ]), react.createElement('div', {
        style: border,
        className: 'wallet-middle title-balance'
      }, children = [
        react.createElement('div', {
          title: usdRate + "",
          className: placeholder + " name"
        }, ' $' + roundHuman(usdRate)), react.createElement('div', {
          className: placeholder + " name per"
        }, children = [react.createElement('span', {}, ' ' + lang.per), " " + wallet.coin.token.toUpperCase()])
      ])
    ]);
  });
  function bind$(obj, key, target){
    return function(){ return (target || obj)[key].apply(obj, arguments) };
  }
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
