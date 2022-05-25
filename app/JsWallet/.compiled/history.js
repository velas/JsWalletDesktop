// Generated by LiveScript 1.6.0
(function(){
  var react, ref$, sortBy, reverse, filter, map, find, take, objToPairs, historyFuncs, getPrimaryInfo, getLang, icon, CopyToClipboard, copiedInform, copy, icons, MiddleEllipsis, txAddressHolder, roundNumber, loading, loader, renderTransaction;
  react = require('react');
  ref$ = require('prelude-ls'), sortBy = ref$.sortBy, reverse = ref$.reverse, filter = ref$.filter, map = ref$.map, find = ref$.find, take = ref$.take, objToPairs = ref$.objToPairs;
  historyFuncs = require('../history-funcs.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  getLang = require('../get-lang.ls');
  icon = require('./icon.ls');
  CopyToClipboard = require('react-copy-to-clipboard').CopyToClipboard;
  copiedInform = require('../copied-inform.ls');
  copy = require('../copy.ls');
  icons = require('../icons.ls');
  MiddleEllipsis = require('../components/middle-ellipsis');
  txAddressHolder = require('../components/tx-address-holder.ls');
  roundNumber = require('../round-number.ls');
  loading = require('../components/popups/loading.ls');
  loader = require('../components/popups/loader.ls');
  renderTransaction = curry$(function(store, web3t, tran){
    var ref$, transactionInfo, coins, checked, arrow, arrowLg, sign, deletePendingTx, amountBeautify, ago, style, filterIcon, lang, menuStyle, borderStyle, lineStyle, lightStyle, lightText, icon1, tooltip, token, tx, amount, fee, time, url, type, pending, from, to, recipientType, description, coin, network, request, txDetails, rotateClass, iconPending, amountPending, about, aboutIcon, walletFrom, walletTo, cutHash, timeAgo, wallet, roundedFee, children;
    ref$ = historyFuncs(store, web3t), transactionInfo = ref$.transactionInfo, coins = ref$.coins, checked = ref$.checked, arrow = ref$.arrow, arrowLg = ref$.arrowLg, sign = ref$.sign, deletePendingTx = ref$.deletePendingTx, amountBeautify = ref$.amountBeautify, ago = ref$.ago;
    style = getPrimaryInfo(store);
    filterIcon = {
      filter: style.app.filterIcon
    };
    lang = getLang(store);
    menuStyle = {
      color: style.app.text
    };
    borderStyle = {
      borderBottom: "1px solid " + style.app.border
    };
    lineStyle = {
      background: style.app.wallet
    };
    lightStyle = {
      background: style.app.walletLight
    };
    lightText = {
      color: style.app.color3
    };
    icon1 = {
      filter: style.app.icon1
    };
    tooltip = {
      background: "black"
    };
    token = tran.token, tx = tran.tx, amount = tran.amount, fee = tran.fee, time = tran.time, url = tran.url, type = tran.type, pending = tran.pending, from = tran.from, to = tran.to, recipientType = tran.recipientType, description = tran.description;
    if (token === 'vlx_native3') {
      console.log("tran", tran.action);
    }
    coin = find(function(it){
      return it.token === token;
    })(
    coins);
    if (coin == null) {
      return null;
    }
    network = coin[store.current.network];
    request = {
      network: network,
      tx: tx
    };
    txDetails = function(){
      return store.history.txDetails = (function(){
        switch (false) {
        case store.history.txDetails !== tx + "" + type:
          return null;
        default:
          return tx + "" + type;
        }
      }());
    };
    rotateClass = (function(){
      switch (false) {
      case store.history.txDetails !== tx + "" + type:
        return "rotate";
      default:
        return "";
      }
    }());
    iconPending = {
      filter: pending === true
        ? 'grayscale(100%) brightness(40%) sepia(100%) hue-rotate(-370deg) saturate(790%) contrast(0.5)'
        : style.app.iconFilter
    };
    amountPending = {
      color: pending === true ? 'orange' : ''
    };
    about = (function(){
      switch (false) {
      case recipientType !== 'contract':
        return 'Smart';
      case description !== 'internal':
        return 'Smart';
      case description !== 'external':
        return 'User';
      default:
        return 'Unknown';
      }
    }());
    aboutIcon = (function(){
      switch (false) {
      case recipientType !== 'contract':
        return icons.smart + "";
      case description !== 'internal':
        return icons.smart + "";
      case description !== 'external':
        return icons.user + "";
      default:
        return icons.unknown + "";
      }
    }());
    walletFrom = {
      address: from,
      network: network,
      coin: coin
    };
    walletTo = {
      address: to,
      network: network,
      coin: coin
    };
    cutHash = function(tx){
      var t, r;
      if (tx == null) {
        return 'none';
      }
      t = tx.toString();
      return r = t.substr(0, 15) + '..' + t.substr(t.length - 15, 15);
    };
    timeAgo = (function(){
      switch (false) {
      case !time:
        return ago(time);
      default:
        return "";
      }
    }());
    wallet = store.current.account.wallets[store.current.walletIndex];
    roundedFee = roundNumber(fee, {
      decimals: wallet.network.decimals
    });
    return react.createElement('div', {
      key: (tx + type) + "",
      style: borderStyle,
      datatesting: "transaction",
      className: type + " record"
    }, children = [
      react.createElement('div', {
        style: lineStyle,
        className: 'tx-top'
      }, children = [
        react.createElement('div', {
          className: 'cell text-center network'
        }, children = react.createElement('div', {
          className: 'direction label-icon'
        }, children = react.createElement('img', {
          src: arrowLg(type) + "",
          className: 'icon-svg'
        }))), type === 'IN'
          ? react.createElement('div', {
            className: 'cell details-from'
          }, children = react.createElement('div', {
            style: lightText,
            className: 'gray'
          }, children = [
            react.createElement('span', {
              className: 'action'
            }, children = tran.txType != null
              ? txAddressHolder({
                store: store,
                wallet: walletFrom,
                url: url,
                text: tran.txType
              })
              : txAddressHolder({
                store: store,
                wallet: walletFrom,
                url: url
              })), false ? react.createElement('span', {
              className: 'from-to'
            }, children = [
              react.createElement('span', {
                className: 'smart-contract'
              }, children = [
                react.createElement('div', {
                  className: 'tooltip'
                }, ' ' + about), react.createElement('img', {
                  src: aboutIcon + "",
                  className: 'help'
                })
              ]), react.createElement('span', {}, ' ' + lang.from)
            ]) : void 8
          ]))
          : react.createElement('div', {
            className: 'cell details-to'
          }, children = react.createElement('div', {
            style: lightText,
            className: 'gray'
          }, children = [
            react.createElement('span', {
              className: 'action'
            }, children = tran.txType != null
              ? txAddressHolder({
                store: store,
                wallet: walletTo,
                url: url,
                text: tran.txType
              })
              : txAddressHolder({
                store: store,
                wallet: walletTo,
                url: url
              })), false ? react.createElement('span', {
              className: 'from-to'
            }, children = [
              react.createElement('span', {
                className: 'smart-contract'
              }, children = [
                react.createElement('div', {
                  className: 'tooltip'
                }, ' ' + about), react.createElement('img', {
                  src: aboutIcon + "",
                  className: 'help'
                })
              ]), react.createElement('span', {}, ' ' + lang.to)
            ]) : void 8
          ])), react.createElement('div', {
          className: 'cell created'
        }, children = react.createElement('div', {
          className: 'time-ago'
        }, ' ' + timeAgo)), react.createElement('div', {
          style: menuStyle,
          className: 'cell amount'
        }, children = react.createElement('div', {
          title: amount + "",
          style: amountPending
        }, children = [
          react.createElement('span', {
            className: 'sign direction'
          }, ' ' + sign(type)), amountBeautify(amount, 8)
        ])), react.createElement('div', {
          style: menuStyle,
          className: 'cell status'
        }, children = pending === true
          ? react.createElement('span', {}, children = [
            react.createElement('span', {
              className: 'bold confirmed'
            }, ' ' + lang.created), react.createElement('span', {
              className: 'bold'
            }, children = loader(store, web3t))
          ])
          : react.createElement('span', {}, children = react.createElement('span', {
            className: 'bold confirmed done'
          }, ' ' + lang.confirmed))), react.createElement('div', {
          onClick: txDetails,
          className: 'cell divider more'
        }, children = [
          react.createElement('img', {
            src: icons.arrowDown + "",
            style: icon1,
            className: rotateClass + " icon-svg1 more"
          }), react.createElement('div', {
            style: tooltip,
            className: 'arrow_box'
          }, ' ' + lang.details)
        ])
      ]), store.history.txDetails === tx + "" + type ? react.createElement('div', {
        style: lightStyle,
        onClick: transactionInfo(request),
        className: 'tx-middle'
      }, children = [
        react.createElement('div', {
          className: 'cell divider'
        }, children = false ? react.createElement('div', {
          className: 'direction'
        }, ' ' + arrow(type)) : void 8), react.createElement('div', {
          className: 'cell txhash'
        }, children = [
          react.createElement(MiddleEllipsis, {}, children = react.createElement('a', {
            href: url + "",
            target: "_blank"
          }, ' ' + tx)), react.createElement(CopyToClipboard, {
            text: tx + "",
            onCopy: copiedInform(store),
            style: filterIcon
          }, children = copy(store)), react.createElement('div', {
            style: lightText,
            className: 'gray'
          }, children = [
            react.createElement('span', {}, ' ' + lang.created + ':'), " " + timeAgo, pending === true
              ? react.createElement('span', {}, children = react.createElement('span', {
                onClick: deletePendingTx(tran),
                className: 'bold delete'
              }, ' ' + lang['delete']))
              : react.createElement('span', {
                className: 'bold confirmed done'
              }, ' ' + lang.confirmed), react.createElement('span', {
              className: 'smart-contract'
            }, children = [
              react.createElement('div', {
                className: 'tooltip'
              }, ' ' + about), react.createElement('img', {
                src: aboutIcon + "",
                className: 'help'
              })
            ])
          ])
        ]), react.createElement('div', {
          className: 'cell divider'
        }), react.createElement('div', {
          className: 'cell divider2'
        }, children = react.createElement('div', {
          style: lightText,
          className: 'gray'
        }, children = [
          react.createElement('span', {
            className: 'fee'
          }, ' ' + lang.fee + ':              '), react.createElement('div', {
            className: 'balance'
          }, children = react.createElement('span', {
            className: 'color'
          }, ' ' + roundedFee))
        ]))
      ]) : void 8
    ]);
  });
  module.exports = function(arg$){
    var store, web3t, ref$, goBack, switchTypeIn, switchTypeOut, switchSender, switchReceiver, removeTypeFromFilter, removeFilterRaram, coins, isActive, switchFilter, wallet, style, lang, headerStyle, icon2, headerStyleLight, buttonStyle, filterStyle, split, menuStyle, borderB, borderT, filterBody, inputStyle, buttonPrimary3Style, buttonPrimary1Style, containerStyle, absoluteStylePosition, loaderStyles, lightText, nothingIcon, headerTableStyle, iconFilter, expandCollapse, length, rowRenderer, buildTypes, buildFilterItems, historyWidth, historyHeight, onSenderFilter, onReceiverFilter, sendFrom, sendTo, children, coin, textStyle;
    store = arg$.store, web3t = arg$.web3t;
    ref$ = historyFuncs(store, web3t), goBack = ref$.goBack, switchTypeIn = ref$.switchTypeIn, switchTypeOut = ref$.switchTypeOut, switchSender = ref$.switchSender, switchReceiver = ref$.switchReceiver, removeTypeFromFilter = ref$.removeTypeFromFilter, removeFilterRaram = ref$.removeFilterRaram, coins = ref$.coins, isActive = ref$.isActive, switchFilter = ref$.switchFilter;
    wallet = store.current.wallet;
    style = getPrimaryInfo(store);
    lang = getLang(store);
    headerStyle = {
      borderBottom: "1px solid " + style.app.border,
      color: style.app.text
    };
    icon2 = {
      filter: style.app.icon2
    };
    headerStyleLight = {
      color: style.app.text
    };
    buttonStyle = {
      color: style.app.text,
      borderRight: "1px solid " + style.app.border,
      borderLeft: "1px solid " + style.app.border
    };
    filterStyle = {
      background: style.app.header,
      fontWeight: "600"
    };
    split = {
      border: "1px solid " + style.app.border
    };
    menuStyle = {
      color: style.app.text
    };
    borderB = {
      borderBottom: "1px solid " + style.app.border
    };
    borderT = {
      borderTop: "1px solid " + style.app.border,
      position: "relative"
    };
    filterBody = {
      border: "1px solid " + style.app.border,
      background: style.app.accountBg
    };
    inputStyle = {
      background: style.app.bgPrimaryLight,
      border: "1px solid " + style.app.border,
      color: style.app.text
    };
    buttonPrimary3Style = {
      border: "0",
      color: style.app.text2,
      background: style.app.primary3,
      backgroundColor: style.app.primary3Spare
    };
    buttonPrimary1Style = {
      border: "0",
      color: style.app.text,
      background: style.app.primary1,
      backgroundColor: style.app.primary1Spare
    };
    containerStyle = {
      position: "relative"
    };
    absoluteStylePosition = {
      position: "absolute",
      left: 0,
      right: 0,
      top: 0,
      bottom: 0
    };
    loaderStyles = {
      loaderPage: {
        background: "none",
        position: "initial"
      }
    };
    lightText = {
      color: style.app.color3
    };
    nothingIcon = {
      filter: style.app.nothingIcon
    };
    headerTableStyle = {
      borderBottom: "1px solid " + style.app.border,
      background: style.app.walletLight
    };
    iconFilter = {
      filter: style.app.iconFilter
    };
    expandCollapse = function(){
      return store.history.filterOpen = !store.history.filterOpen;
    };
    length = store.transactions.applied.length;
    rowRenderer = function(arg$){
      var key, index, isScrolling, isVisible, style;
      key = arg$.key, index = arg$.index, isScrolling = arg$.isScrolling, isVisible = arg$.isVisible, style = arg$.style;
      return renderTransaction(store, web3t, store.transactions.applied[index]);
      return null;
    };
    buildTypes = function(item){
      var removeType, children;
      removeType = removeTypeFromFilter(item);
      return react.createElement('span', {
        onClick: removeType,
        className: 'filter-item'
      }, children = [
        react.createElement('span', {
          className: 'key'
        }, ' ' + item), react.createElement('span', {
          className: 'close-icon'
        }, children = icon('X', 10))
      ]);
    };
    buildFilterItems = function(item){
      var key, value, $key, ref$, obj, children;
      key = item[0];
      value = item[1];
      if (value == null) {
        return null;
      }
      if (key === 'token') {
        return null;
      }
      $key = ((ref$ = item[0]) != null ? ref$ : "").toUpperCase();
      obj = {};
      obj[key + ""] = value;
      return react.createElement('span', {
        onClick: removeFilterRaram(obj),
        className: 'filter-item'
      }, children = react.createElement('span', {}, children = [
        react.createElement('span', {
          className: 'key'
        }, ' ' + $key + ':'), react.createElement('span', {
          className: 'value'
        }, ' ' + value), react.createElement('span', {
          className: 'close-icon'
        }, children = icon('X', 10))
      ]));
    };
    historyWidth = store.current.size.width / 1.9;
    historyHeight = store.current.size.height - 200 - 60;
    onSenderFilter = function(e){
      var ref$;
      e.target.value = ((ref$ = e.target.value) != null ? ref$ : "").trim();
      return switchSender(e.target.value);
    };
    onReceiverFilter = function(e){
      var ref$;
      e.target.value = ((ref$ = e.target.value) != null ? ref$ : "").trim();
      return switchReceiver(e.target.value);
    };
    sendFrom = (ref$ = store.current.filter.from) != null ? ref$ : "";
    sendTo = (ref$ = store.current.filter.to) != null ? ref$ : "";
    return react.createElement('div', {
      className: 'normalheader history history372739846'
    }, children = [
      react.createElement('div', {
        style: headerStyleLight,
        className: 'header'
      }, children = [
        store.current.device === 'mobile' ? react.createElement('button', {
          onClick: goBack,
          style: buttonStyle,
          className: 'back'
        }, children = react.createElement('img', {
          src: icons.arrowLeft + "",
          className: 'icon-svg-arrow'
        })) : void 8, react.createElement('span', {
          className: 'head left h1'
        }, ' ' + lang.yourTransactions), react.createElement('span', {
          onClick: expandCollapse,
          className: 'head right'
        }, children = react.createElement('img', {
          src: icons.filter + "",
          style: icon2,
          className: 'icon-svg1'
        })), react.createElement('div', {
          className: 'filters'
        }, children = react.createElement('div', {
          className: 'filter__types'
        }, children = [
          map(buildTypes)(
          store.current.filterTxsTypes), map(buildFilterItems)(
          objToPairs(
          store.current.filter))
        ])), react.createElement('div', {
          className: 'table-header'
        }, children = [
          react.createElement('span', {
            className: 'from-to'
          }, children = [" " + lang.from, " /", " " + lang.to]), react.createElement('span', {
            className: 'created'
          }, ' ' + lang.created), react.createElement('span', {
            className: 'amount'
          }, ' ' + lang.amount), react.createElement('span', {
            className: 'status'
          }, ' ' + lang.status), react.createElement('span', {
            className: 'details'
          }, ' ' + lang.details)
        ]), store.history.filterOpen ? react.createElement('div', {
          style: filterBody,
          className: 'filter'
        }, children = [
          react.createElement('div', {
            style: borderB,
            className: 'top'
          }, children = [
            react.createElement('button', {
              onClick: switchTypeOut,
              className: isActive('OUT') + " OUT"
            }, children = react.createElement('img', {
              src: icons.send + "",
              className: 'icon-svg'
            })), react.createElement('div', {
              style: split
            }), react.createElement('button', {
              onClick: switchTypeIn,
              className: isActive('IN') + " IN"
            }, children = react.createElement('img', {
              src: icons.get + "",
              className: 'icon-svg'
            }))
          ]), react.createElement('div', {
            style: borderB,
            className: 'middle'
          }, children = [
            react.createElement('div', {}, children = react.createElement('input', {
              type: 'text',
              value: sendFrom + "",
              onChange: onSenderFilter,
              style: inputStyle,
              placeholder: lang.from + "",
              className: 'from'
            })), react.createElement('div', {}, children = react.createElement('input', {
              type: 'text',
              value: sendTo + "",
              onChange: onReceiverFilter,
              style: inputStyle,
              placeholder: lang.to + "",
              className: 'to'
            })), false ? react.createElement('button', {
              onClick: filterTxs,
              style: buttonPrimary1Style
            }, children = react.createElement('span', {}, children = [
              react.createElement('img', {
                src: icons.apply + "",
                className: 'icon-svg-btn'
              }), " " + lang.btnApply
            ])) : void 8
          ]), false ? react.createElement('div', {
            className: 'bottom'
          }, children = (function(){
            var i$, ref$, len$, results$ = [];
            for (i$ = 0, len$ = (ref$ = coins).length; i$ < len$; ++i$) {
              coin = ref$[i$];
              results$.push(react.createElement('button', {
                key: coin.token + "",
                style: filterStyle,
                onClick: switchFilter(coin.token),
                className: isActive(coin.token) + ""
              }, children = react.createElement('img', {
                src: coin.image + ""
              })));
            }
            return results$;
          }())) : void 8
        ]) : void 8
      ]), react.createElement('div', {
        style: containerStyle
      }, children = [
        react.createElement('div', {
          style: absoluteStylePosition,
          className: 'loader-container'
        }, children = loader({
          loading: (wallet != null ? wallet.txsStatus : void 8) === 'loading',
          styles: loaderStyles
        })), react.createElement('div', {
          style: borderT,
          className: 'table'
        }, children = map(renderTransaction(store, web3t))(
        take(30)(
        store.transactions.applied))), length === 0 && (wallet != null ? wallet.txsStatus : void 8) === 'loaded' ? (textStyle = {
          opacity: 0.3
        }, react.createElement('div', {
          style: menuStyle,
          className: 'nothin-to-show'
        }, children = [
          react.createElement('img', {
            style: nothingIcon,
            src: icons.searchHistory + ""
          }), react.createElement('div', {
            style: textStyle,
            className: 'head'
          }, ' ' + lang.nothingToShow)
        ])) : void 8
      ])
    ]);
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
