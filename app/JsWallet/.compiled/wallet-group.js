// Generated by LiveScript 1.6.0
(function(){
  var react, money, ref$, each, find, map, walletFuncs, getLang, icon, getPrimaryInfo, get, icons, roundHuman, alert, button, addressHolder, loadWalletTransactions, calcCertainWallet, cb;
  react = require('react');
  money = require('../tools.ls').money;
  ref$ = require('prelude-ls'), each = ref$.each, find = ref$.find, map = ref$.map;
  walletFuncs = require('../wallet-funcs.ls');
  getLang = require('../get-lang.ls');
  icon = require('./icon.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  get = require('../../web3t/providers/superagent.js').get;
  icons = require('../icons.ls');
  roundHuman = require('../round-human.ls');
  alert = require('./confirmation.ls').alert;
  button = require('../components/button.ls');
  addressHolder = require('../components/address-holder.ls');
  loadWalletTransactions = require('../transactions.ls').loadWalletTransactions;
  calcCertainWallet = require('../calc-certain-wallet.ls');
  cb = bind$(console, 'log');
  module.exports = curry$(function(store, web3t, wallets, walletsGroups, walletsGroup){
    var lang, style, labelUninstall, walletStyle, borderStyle, border, buttonPrimary3Style, addressInput, btnIcon, iconColor, customStyle, infoStyle, isLoading, groupName, children;
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
    customStyle = {
      border: "1px solid #71f4c0",
      borderRadius: "13px",
      padding: "2px 4px",
      fontSize: "8px",
      color: "#71f4c0"
    };
    infoStyle = {
      width: "13px",
      height: "13px",
      fontSize: "10px",
      marginLeft: "5px",
      marginTop: "-1px",
      float: "revert",
      display: "block"
    };
    isLoading = store.current.refreshing === true;
    groupName = (function(){
      switch (false) {
      case (walletsGroup != null ? walletsGroup[0] : void 8) == null:
        return walletsGroup[0];
      default:
        return '';
      }
    }());
    wallets = walletsGroup[1];
    return react.createElement('div', {
      id: "wallet-group-switch-" + groupName,
      className: 'wallet-group wallet-group2089655129'
    }, children = [
      react.createElement('div', {
        className: 'group-name'
      }, ' ' + groupName + ' Network'), map(function(wallet){
        var ref$, walletIcon, buttonStyle, uninstall, active, big, balance, balanceUsd, pending, send, receive, swap, expand, usdRate, last, containerClass, placeholder, placeholderCoin, withError, name, receiveClick, sendClick, swapClick, expandClick, token, isCustom, tokenDisplay, makeDisabled, walletIsDisabled, disabledClass, sendSwapDisabled, syncing, refresh, toggleTooltipVisible, children;
        ref$ = walletFuncs(store, web3t, wallets, wallet, walletsGroups, groupName), walletIcon = ref$.walletIcon, buttonStyle = ref$.buttonStyle, uninstall = ref$.uninstall, wallet = ref$.wallet, active = ref$.active, big = ref$.big, balance = ref$.balance, balanceUsd = ref$.balanceUsd, pending = ref$.pending, send = ref$.send, receive = ref$.receive, swap = ref$.swap, expand = ref$.expand, usdRate = ref$.usdRate, last = ref$.last;
        containerClass = (function(){
          switch (false) {
          case wallet.status !== 'loading':
            return "";
          default:
            return "loaded";
          }
        }());
        placeholder = (function(){
          switch (false) {
          case !(wallet.status === 'loading' && isNaN(wallet.balance)):
            return "placeholder";
          default:
            return "";
          }
        }());
        placeholderCoin = (function(){
          switch (false) {
          case !(wallet.status === 'loading' && isNaN(wallet.balance)):
            return "placeholder-coin";
          default:
            return "";
          }
        }());
        withError = wallet.status === 'error';
        name = (ref$ = wallet.coin.name) != null
          ? ref$
          : wallet.coin.token;
        receiveClick = receive(wallet);
        sendClick = send(wallet);
        swapClick = swap(store, wallet);
        expandClick = function(e){
          store.current.wallet = wallet;
          expand(e);
          return loadWalletTransactions(store, web3t, wallet.coin.token, function(err){
            if (err != null) {
              return console.error(err);
            }
          });
        };
        token = wallet.coin.token;
        isCustom = (wallet != null ? (ref$ = wallet.coin) != null ? ref$.custom : void 8 : void 8) === true;
        tokenDisplay = (function(){
          var ref$;
          switch (false) {
          case isCustom !== true:
            return ((ref$ = wallet.coin.name) != null ? ref$ : "").toUpperCase();
          default:
            return ((ref$ = wallet.coin.nickname) != null ? ref$ : "").toUpperCase();
          }
        }());
        makeDisabled = store.current.refreshing;
        walletIsDisabled = isNaN(wallet.balance);
        disabledClass = !isLoading && walletIsDisabled ? "disabled-wallet-item" : "";
        walletIsDisabled = isNaN(wallet.balance);
        sendSwapDisabled = walletIsDisabled || isLoading;
        isCustom = wallet.coin.custom === true;
        syncing = (function(){
          switch (false) {
          case wallet.status !== 'loading':
            return 'syncing';
          default:
            return "";
          }
        }());
        refresh = function(){
          return calcCertainWallet(store, token, function(err){});
        };
        toggleTooltipVisible = function(isHovered){
          return function(event){
            store.showTooltip = isHovered;
            if (isHovered) {
              store.tooltipCoordinates = {
                x: event.pageX,
                y: event.pageY
              };
              return store.tooltipMessage = lang["tooltip_" + wallet.coin.token];
            }
          };
        };
        /* Render */
        return react.createElement('div', {
          key: token + "",
          style: borderStyle,
          id: "token-" + token,
          className: big + " " + disabledClass + " wallet wallet-item"
        }, children = [
          wallet.state === "error" ? react.createElement('div', {
            className: 'retry-container'
          }, children = react.createElement('button', {
            onClick: refresh,
            className: syncing + " button lock mt-5 retry-button"
          }, children = icon('Sync', 20))) : void 8, react.createElement('div', {
            className: "inner-wallet-container " + disabledClass
          }, children = react.createElement('div', {
            onClick: expandClick,
            className: 'wallet-top'
          }, children = [
            react.createElement('div', {
              style: walletStyle,
              className: containerClass + " top-left"
            }, children = [
              react.createElement('div', {
                className: placeholderCoin + " img"
              }, children = react.createElement('img', {
                src: walletIcon + ""
              })), react.createElement('div', {
                className: 'info'
              }, children = [
                react.createElement('div', {
                  className: 'name-holder'
                }, children = [
                  react.createElement('div', {
                    className: placeholder + " balance title"
                  }, ' ' + name), token === 'vlx_native' || token === 'vlx_evm' || token === 'vlx2' || token === 'bsc_vlx' || token === 'vlx_erc20' || token === 'vlx_huobi' ? react.createElement('div', {
                    className: 'tooltips'
                  }, children = react.createElement('div', {
                    style: walletStyle,
                    onMouseEnter: toggleTooltipVisible(true),
                    onMouseLeave: toggleTooltipVisible(false),
                    className: 'tooltip'
                  }, children = react.createElement('img', {
                    src: icons.info + "",
                    style: infoStyle,
                    className: 'tooltipIcon'
                  }))) : void 8
                ]), store.current.device === 'desktop' ? react.createElement('div', {
                  title: wallet.balance + "",
                  className: placeholder + " price token"
                }, children = [react.createElement('span', {}, ' ' + roundHuman(wallet.balance)), react.createElement('span', {}, ' ' + tokenDisplay)]) : void 8, isCustom
                  ? react.createElement('div', {
                    title: balanceUsd + "",
                    className: placeholder + " price"
                  }, children = react.createElement('span', {
                    style: customStyle
                  }, ' CUSTOM'))
                  : react.createElement('div', {
                    title: balanceUsd + "",
                    className: placeholder + " price"
                  }, children = [react.createElement('span', {}, ' ' + roundHuman(balanceUsd)), react.createElement('span', {}, ' USD')])
              ])
            ]), token === 'vlx_native' || token === 'vlx_evm' || token === 'vlx2' || token === 'bsc_vlx' || token === 'vlx_erc20' || token === 'vlx_huobi' ? react.createElement('div', {
              className: 'tooltips'
            }, children = react.createElement('div', {
              style: walletStyle,
              onMouseEnter: toggleTooltipVisible(true),
              onMouseLeave: toggleTooltipVisible(false),
              className: 'tooltip'
            }, children = react.createElement('div', {
              className: placeholder + " tooltipIcon title"
            }, ' ?'))) : void 8
          ]))
        ]);
      })(
      wallets)
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