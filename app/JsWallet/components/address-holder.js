// Generated by LiveScript 1.6.0
(function(){
  var react, ref$, getAddressLink, getAddressTitle, MiddleEllipsis, getPrimaryInfo, icons, identicon, copy;
  react = require('react');
  ref$ = require('../address-link.ls'), getAddressLink = ref$.getAddressLink, getAddressTitle = ref$.getAddressTitle;
  MiddleEllipsis = require('./middle-ellipsis');
  getPrimaryInfo = require('../get-primary-info.ls');
  icons = require('../icons.ls');
  identicon = require('./identicon.ls');
  copy = require('./copy.ls');
  module.exports = function(arg$){
    var store, wallet, type, style, addressSuffix, addressInput, addressInputBg, input, filterIcon, icon1, addressLink, addressTitle, showDetails, hideDetails, active, rotateAddressSuffix, children;
    store = arg$.store, wallet = arg$.wallet, type = arg$.type;
    style = getPrimaryInfo(store);
    addressSuffix = store.current.addressSuffix;
    addressInput = {
      color: style.app.color3
    };
    addressInputBg = {
      color: style.app.color3,
      background: style.app.input
    };
    input = (function(){
      switch (false) {
      case type !== 'bg':
        return addressInputBg;
      default:
        return addressInput;
      }
    }());
    filterIcon = {
      filter: style.app.filterIcon
    };
    icon1 = {
      filter: style.app.icon1
    };
    addressLink = (function(){
      switch (false) {
      case store.current.refreshing !== false:
        return getAddressLink(wallet, addressSuffix);
      default:
        return "...";
      }
    }());
    addressTitle = (function(){
      switch (false) {
      case store.current.refreshing !== false:
        return getAddressTitle(wallet, addressSuffix);
      default:
        return "...";
      }
    }());
    showDetails = function(){
      return store.current.hoveredAddress.address = wallet.address;
    };
    hideDetails = function(){
      return store.current.hoveredAddress.address = null;
    };
    active = wallet.address === store.current.hoveredAddress.address ? 'active' : '';
    rotateAddressSuffix = function(){
      return store.current.addressSuffix = (function(){
        switch (false) {
        case !(store.current.addressSuffix === '' && wallet.address2):
          return "2";
        case !(store.current.addressSuffix === '2' && wallet.address3):
          return '3';
        default:
          return "";
        }
      }());
    };
    return react.createElement('div', {
      onMouseEnter: showDetails,
      onMouseLeave: hideDetails,
      className: 'address-holder address-holder-168277421'
    }, children = [
      identicon({
        store: store,
        address: addressTitle
      }), react.createElement('span', {
        style: input
      }, children = [
        store.urlParams.internal != null
          ? react.createElement('a', {
            onClick: rotateAddressSuffix,
            className: 'browse'
          }, children = react.createElement('img', {
            src: icons.choose + "",
            style: filterIcon
          }))
          : react.createElement('a', {
            target: "_blank",
            href: addressLink + "",
            className: 'browse'
          }, children = react.createElement('img', {
            src: icons.browseOpen + "",
            style: icon1
          })), react.createElement(MiddleEllipsis, {
          key: addressTitle
        }, children = react.createElement('a', {
          target: "_blank",
          href: addressLink + "",
          className: active + ""
        }, ' ' + addressTitle))
      ]), copy({
        store: store,
        text: addressTitle
      })
    ]);
  };
}).call(this);