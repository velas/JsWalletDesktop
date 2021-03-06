// Generated by LiveScript 1.6.0
(function(){
  var react, ref$, map, take, drop, filter, div, times, plus, minus, menu, web3, walletsFuncs, manageAccount, getLang, getPrimaryInfo, history, yourAccount, icon, localStorage, icons, moment, navigate;
  react = require('react');
  ref$ = require('prelude-ls'), map = ref$.map, take = ref$.take, drop = ref$.drop, filter = ref$.filter;
  ref$ = require('../math.ls'), div = ref$.div, times = ref$.times, plus = ref$.plus, minus = ref$.minus;
  menu = require('./menu.ls');
  web3 = require('../web3.ls');
  walletsFuncs = require('../wallets-funcs.ls');
  manageAccount = require('./manage-account.ls');
  getLang = require('../get-lang.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  history = require('./history.ls');
  yourAccount = require('./your-account.ls');
  icon = require('./icon.ls');
  localStorage = require('localStorage');
  icons = require('../icons.ls');
  moment = require('moment');
  navigate = require('../navigate.ls');
  module.exports = function(store, web3t){
    var ref$, wallets, goUp, canUp, goDown, canDown, style, lang, borderStyle, headerStyle, input, headerLeft, filterBody, borderRight, underDev, buttonPrimary2Style, iconColor, openEpoch, editAccountName, defaultAccountName, editAccount, doneEdit, cancelEditAccountName, currentAccountName, accountName, rotateClass, currentBlock, epochNext, monitor, showClass, openMenu, onExit, children;
    if (store.current.account == null) {
      return null;
    }
    ref$ = walletsFuncs(store, web3t), wallets = ref$.wallets, goUp = ref$.goUp, canUp = ref$.canUp, goDown = ref$.goDown, canDown = ref$.canDown;
    style = getPrimaryInfo(store);
    lang = getLang(store);
    borderStyle = {
      borderTop: "1px solid " + style.app.border
    };
    headerStyle = {
      borderTop: "1px solid " + style.app.border,
      padding: "17px 0px 20px",
      color: style.app.text,
      textAlign: "left"
    };
    input = {
      background: style.app.wallet,
      border: "1px solid " + style.app.border,
      color: style.app.text
    };
    headerLeft = {
      marginLeft: "10px"
    };
    filterBody = {
      border: "1px solid " + style.app.border,
      background: style.app.accountBg
    };
    borderRight = {
      borderRight: "1px solid " + style.app.border
    };
    underDev = {
      fontSize: "11px",
      color: "orange"
    };
    buttonPrimary2Style = {
      border: "1px solid " + style.app.primary2,
      color: style.app.text,
      background: style.app.primary2,
      backgroundColor: style.app.primary2Spare,
      margin: "0",
      width: "100%"
    };
    iconColor = {
      filter: style.app.iconFilter
    };
    openEpoch = function(){
      var cb;
      cb = alert;
      store.current.currentEpoch = !store.current.currentEpoch;
      if (!store.current.currentEpoch) {
        return;
      }
      return web3t.velas.Staking.stakingEpoch(function(err, stakingEpoch){
        if (err != null) {
          return cb(err + "");
        }
        return web3t.velas.Staking.stakingEpochEndBlock(function(err, nextBlock){
          if (err != null) {
            return cb(err);
          }
          return web3t.velas.Staking.stakingEpochStartBlock(function(err, startBlock){
            if (err != null) {
              return cb(err);
            }
            return web3t.velas.web3.getBlockNumber(function(err, currentBlock){
              var seconds, all, rest;
              if (err != null) {
                return cb(err);
              }
              seconds = times(minus(nextBlock, currentBlock), 5);
              all = times(minus(nextBlock, startBlock), 5);
              rest = minus(all, seconds);
              console.log(store.dashboard.epochPercent, all, seconds);
              store.dashboard.epochPercent = 100 - times(div(100, all), seconds);
              store.dashboard.epochNext = moment().add(seconds, 'seconds').fromNow();
              store.dashboard.currentBlock = currentBlock;
              return store.dashboard.epoch = stakingEpoch.toFixed();
            });
          });
        });
      });
    };
    editAccountName = function(){
      return store.current.editAccountName = currentAccountName();
    };
    defaultAccountName = function(){
      return lang.account + " " + store.current.accountIndex;
    };
    editAccount = function(e){
      return store.current.editAccountName = e.target.value;
    };
    doneEdit = function(){
      localStorage.setItem(defaultAccountName(), store.current.editAccountName);
      return cancelEditAccountName();
    };
    cancelEditAccountName = function(){
      return store.current.editAccountName = "";
    };
    currentAccountName = function(){
      var ref$;
      return (ref$ = localStorage.getItem(defaultAccountName())) != null
        ? ref$
        : defaultAccountName();
    };
    accountName = currentAccountName();
    rotateClass = store.current.currentEpoch ? 'rotate' : "";
    currentBlock = (ref$ = store.dashboard.currentBlock) != null ? ref$ : 'loading...';
    epochNext = (ref$ = store.dashboard.epochNext) != null ? ref$ : 'loading...';
    monitor = function(){
      return navigate(store, web3t, 'monitor');
    };
    showClass = store.current.openMenu ? 'show' : "";
    openMenu = function(){
      return store.current.openMenu = !store.current.openMenu;
    };
    onExit = function(){
      return store.current.currentEpoch = false;
    };
    if (store.current.device === 'desktop') {
      return react.createElement('div', {
        className: 'choose-account choose-account-746562784'
      }, children = [
        react.createElement('div', {
          className: showClass + " current-epoch h1"
        }, children = [
          react.createElement('span', {
            onClick: openEpoch,
            className: 'name'
          }, ' ' + lang.epoch), react.createElement('span', {
            onClick: openEpoch,
            className: rotateClass + " icon"
          }, children = react.createElement('img', {
            src: icons.arrowDown + "",
            style: iconColor,
            className: 'icon-svg-create'
          }))
        ]), store.current.currentEpoch ? react.createElement('div', {
          style: filterBody,
          onMouseLeave: onExit,
          className: 'epoch'
        }, children = react.createElement('div', {
          className: 'middle account'
        }, children = react.createElement('div', {
          className: 'table-row-menu'
        }, children = [
          react.createElement('div', {
            className: 'col folder-menu'
          }, children = [react.createElement('div', {}, ' ' + currentBlock), react.createElement('span', {}, ' ' + lang.currentBlock)]), react.createElement('div', {
            className: 'col folder-menu'
          }, children = [react.createElement('div', {}, ' ' + store.dashboard.epoch), react.createElement('span', {}, ' ' + lang.currentEpoch)]), react.createElement('div', {
            className: 'col folder-menu'
          }, children = [
            react.createElement('div', {}, children = react.createElement('progress', {
              value: store.dashboard.epochPercent + "",
              max: "100"
            })), react.createElement('span', {}, children = [" " + lang.change + " ", " " + epochNext])
          ]), window.location.href.indexOf('internal') > -1 ? react.createElement('div', {
            className: 'col folder-menu'
          }, children = react.createElement('div', {}, children = react.createElement('button', {
            onClick: monitor,
            style: buttonPrimary2Style
          }, children = react.createElement('span', {}, children = [
            react.createElement('img', {
              src: icons.monitor + "",
              className: 'icon-svg'
            }), " Monitor"
          ])))) : void 8
        ]))) : void 8
      ]);
    }
  };
}).call(this);
