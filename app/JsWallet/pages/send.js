// Generated by LiveScript 1.6.0
(function(){
  var react, sendFuncs, ref$, map, find, getPrimaryInfo, icon, getLang, switchAccount, icons, roundHuman, walletsFuncs, epoch, button, addressHolder, identicon, trxFee, sendContract, historyFuncs, burger, formGroup, send;
  react = require('react');
  sendFuncs = require('../send-funcs.ls');
  ref$ = require('prelude-ls'), map = ref$.map, find = ref$.find;
  getPrimaryInfo = require('../get-primary-info.ls');
  icon = require('./icon.ls');
  getLang = require('../get-lang.ls');
  switchAccount = require('./switch-account.ls');
  icons = require('../icons.ls');
  roundHuman = require('../round-human.ls');
  walletsFuncs = require('../wallets-funcs.ls');
  epoch = require('./epoch.ls');
  button = require('../components/button.ls');
  addressHolder = require('../components/address-holder.ls');
  identicon = require('../components/identicon.ls');
  trxFee = require('../components/trx-fee.ls');
  sendContract = require('./send-contract.ls');
  historyFuncs = require('../history-funcs.ls');
  burger = require('../components/burger.ls');
  formGroup = function(title, style, content){
    var children;
    return react.createElement('div', {
      className: 'form-group'
    }, children = [
      react.createElement('label', {
        style: style,
        className: 'control-label'
      }, ' ' + title), content()
    ]);
  };
  send = function(arg$){
    var store, web3t, ref$, token, name, feeToken, network, send, wallet, pending, recipientChange, amountChange, amountUsdChange, amountEurChange, useMaxAmount, showData, showLabel, history, cancel, sendAnyway, chooseAuto, round5edit, round5, isData, encodeDecode, changeAmount, invoice, goBack, roundMoney, style, menuStyle, inputStyle, borderStyle, amountStyle, iconStyle, useMaxStyle, buttonPrimary3Style, cryptoBackground, moreText, borderHeader, lang, walletTitle, openInvoice, activate, activateUsd, activateEur, activeClass, activeUsd, activeEur, showClass, children;
    store = arg$.store, web3t = arg$.web3t;
    ref$ = sendFuncs(store, web3t), token = ref$.token, name = ref$.name, feeToken = ref$.feeToken, network = ref$.network, send = ref$.send, wallet = ref$.wallet, pending = ref$.pending, recipientChange = ref$.recipientChange, amountChange = ref$.amountChange, amountUsdChange = ref$.amountUsdChange, amountEurChange = ref$.amountEurChange, useMaxAmount = ref$.useMaxAmount, showData = ref$.showData, showLabel = ref$.showLabel, history = ref$.history, cancel = ref$.cancel, sendAnyway = ref$.sendAnyway, chooseAuto = ref$.chooseAuto, round5edit = ref$.round5edit, round5 = ref$.round5, isData = ref$.isData, encodeDecode = ref$.encodeDecode, changeAmount = ref$.changeAmount, invoice = ref$.invoice;
    if (send.details === false) {
      return sendContract({
        store: store,
        web3t: web3t
      });
    }
    goBack = historyFuncs(store, web3t).goBack;
    if (wallet == null) {
      return goBack();
    }
    roundMoney = function(val){
      return function(it){
        return it / 100;
      }(
      Math.round(
      function(it){
        return it * 100;
      }(
      +val)));
    };
    style = getPrimaryInfo(store);
    menuStyle = {
      background: style.app.background,
      backgroundColor: style.app.bgspare,
      border: "1px solid " + style.app.border
    };
    inputStyle = {
      background: style.app.input,
      border: "1px solid " + style.app.border,
      color: style.app.text
    };
    borderStyle = {
      border: "1px solid " + style.app.border
    };
    amountStyle = {
      border: "1px solid " + style.app.background
    };
    iconStyle = {
      color: style.app.icon
    };
    useMaxStyle = {
      color: style.app.text2
    };
    buttonPrimary3Style = {
      border: "0",
      color: style.app.text2,
      background: style.app.primary3,
      backgroundColor: style.app.primary3Spare
    };
    cryptoBackground = {
      background: style.app.wallet
    };
    moreText = {
      color: style.app.text
    };
    borderHeader = {
      color: style.app.text,
      borderBottom: "1px solid " + style.app.border,
      background: style.app.background,
      backgroundColor: style.app.bgspare
    };
    lang = getLang(store);
    walletTitle = (name + network) + " " + ((ref$ = lang.wallet) != null ? ref$ : 'wallet');
    openInvoice = function(){
      return invoice(store, wallet);
    };
    activate = function(convert){
      return function(){
        return store.current.convert = convert;
      };
    };
    activateUsd = activate('usd');
    activateEur = activate('eur');
    activeClass = function(convert){
      if (store.current.convert === convert) {
        return 'active';
      } else {
        return '';
      }
    };
    activeUsd = activeClass('usd');
    activeEur = activeClass('eur');
    showClass = store.current.openMenu ? 'hide' : "";
    return react.createElement('div', {
      className: 'content content934132681'
    }, children = [
      react.createElement('div', {
        style: borderHeader,
        className: 'title'
      }, children = [
        react.createElement('div', {
          className: showClass + " header"
        }, ' ' + lang.send), react.createElement('div', {
          onClick: goBack,
          className: 'close'
        }, children = react.createElement('img', {
          src: icons.arrowLeft + "",
          className: 'icon-svg'
        })), burger(store, web3t), epoch(store, web3t), switchAccount(store, web3t)
      ]), react.createElement('div', {
        style: moreText,
        className: 'content-body'
      }, children = [
        store.current.device !== 'mobile' ? react.createElement('div', {
          className: 'header'
        }, children = [
          react.createElement('span', {
            className: 'head left'
          }, children = react.createElement('img', {
            src: send.coin.image + ""
          })), react.createElement('span', {
            style: moreText,
            className: 'head center'
          }, ' ' + walletTitle), store.current.device === 'mobile' ? react.createElement('span', {
            onClick: history,
            style: iconStyle,
            className: 'head right'
          }, children = react.createElement('img', {
            src: icons.history + "",
            className: 'icon-svg-history'
          })) : void 8
        ]) : void 8, store.current.sendMenuOpen ? react.createElement('div', {
          style: menuStyle,
          className: 'more-buttons'
        }, children = [
          store.preference.invoiceVisible === true ? store.current.device === 'desktop' ? react.createElement('a', {
            onClick: openInvoice,
            className: 'more receive'
          }, children = react.createElement('div', {}, children = [
            react.createElement('span', {
              style: iconStyle,
              className: 'more-icon'
            }, children = icon('Mail', 20)), react.createElement('span', {
              style: moreText,
              className: 'more-text'
            }, ' ' + lang.invoice)
          ])) : void 8 : void 8, store.current.device === 'mobile' ? react.createElement('a', {
            onClick: history,
            className: 'more history'
          }, children = react.createElement('div', {}, children = [
            react.createElement('span', {
              style: iconStyle,
              className: 'more-icon'
            }, children = icon('Inbox', 20)), react.createElement('span', {
              style: moreText,
              className: 'more-text'
            }, ' ' + lang.history)
          ])) : void 8
        ]) : void 8, react.createElement('form', {}, children = [
          formGroup(lang.from, iconStyle, function(){
            var children;
            return react.createElement('div', {
              style: borderStyle,
              className: 'address'
            }, children = addressHolder({
              store: store,
              wallet: wallet
            }));
          }), formGroup(lang.to, iconStyle, function(){
            var children;
            return react.createElement('div', {}, children = [
              identicon({
                store: store,
                address: send.to
              }), react.createElement('input', {
                type: 'text',
                style: inputStyle,
                onChange: recipientChange,
                value: send.to + "",
                placeholder: store.current.sendToMask + ""
              })
            ]);
          }), formGroup(lang.amount, iconStyle, function(){
            var children;
            return react.createElement('div', {}, children = [
              react.createElement('div', {
                className: 'amount-field'
              }, children = [
                react.createElement('div', {
                  className: 'input-wrapper'
                }, children = [
                  react.createElement('div', {
                    style: cryptoBackground,
                    className: 'label crypto'
                  }, children = [
                    react.createElement('img', {
                      src: send.coin.image + "",
                      className: 'label-coin'
                    }), " " + token
                  ]), react.createElement('input', {
                    type: 'text',
                    style: inputStyle,
                    onChange: amountChange,
                    placeholder: "0",
                    title: send.amountSend + "",
                    value: round5edit(send.amountSend) + "",
                    className: 'amount'
                  })
                ]), activeUsd === 'active' ? react.createElement('div', {
                  style: amountStyle,
                  className: 'input-wrapper small'
                }, children = [
                  react.createElement('div', {
                    className: 'label lusd'
                  }, ' $'), react.createElement('input', {
                    type: 'text',
                    style: inputStyle,
                    onChange: amountUsdChange,
                    placeholder: "0",
                    title: send.amountSendUsd + "",
                    value: roundMoney(send.amountSendUsd) + "",
                    className: 'amount-usd'
                  })
                ]) : void 8, activeEur === 'active' ? react.createElement('div', {
                  style: amountStyle,
                  className: 'input-wrapper small'
                }, children = [
                  react.createElement('div', {
                    className: 'label lusd'
                  }, ' €'), react.createElement('input', {
                    type: 'text',
                    style: inputStyle,
                    onChange: amountEurChange,
                    placeholder: "0",
                    title: send.amountSendEur + "",
                    value: roundMoney(send.amountSendEur) + "",
                    className: 'amount-eur'
                  })
                ]) : void 8
              ]), react.createElement('div', {
                className: 'usd'
              }, children = [
                react.createElement('button', {
                  onClick: useMaxAmount,
                  style: buttonPrimary3Style,
                  type: "button",
                  className: 'send-all'
                }, ' ' + lang.useMax), react.createElement('span', {}, ' ' + lang.balance), react.createElement('span', {
                  className: 'balance'
                }, children = [
                  react.createElement('span', {
                    title: wallet.balance + ""
                  }, ' ' + roundHuman(wallet.balance)), react.createElement('img', {
                    src: send.coin.image + "",
                    className: 'label-coin'
                  }), react.createElement('span', {}, ' ' + token), +wallet.pendingSent > 0 ? react.createElement('span', {
                    className: 'pending'
                  }, ' ' + '(' + pending + ' ' + lang.pending + ')') : void 8
                ]), react.createElement('button', {
                  onClick: activateEur,
                  style: useMaxStyle,
                  type: "button",
                  className: activeEur + " send-all switch-currency"
                }, ' eur'), react.createElement('button', {
                  onClick: activateUsd,
                  style: useMaxStyle,
                  type: "button",
                  className: activeUsd + " send-all switch-currency"
                }, ' usd')
              ]), react.createElement('div', {
                title: send.error + "",
                className: 'control-label not-enough text-left'
              }, ' ' + send.error)
            ]);
          }), isData ? formGroup('Data', iconStyle, function(){
            return react.createElement('div', {
              style: inputStyle,
              className: 'smart-contract'
            }, ' ' + showData());
          }) : void 8, trxFee({
            store: store,
            web3t: web3t,
            wallet: wallet
          }), react.createElement('table', {
            style: borderStyle
          }, children = react.createElement('tbody', {}, children = [
            react.createElement('tr', {}, children = [
              react.createElement('td', {}, ' ' + lang.youSpend), react.createElement('td', {}, children = [
                react.createElement('span', {
                  title: send.amountCharged + ""
                }, ' ' + round5(send.amountCharged)), react.createElement('img', {
                  src: send.coin.image + "",
                  className: 'label-coin'
                }), react.createElement('span', {
                  title: send.amountCharged + ""
                }, ' ' + token), react.createElement('div', {
                  className: 'usd'
                }, ' $ ' + round5(send.amountChargedUsd))
              ])
            ]), react.createElement('tr', {
              className: 'orange'
            }, children = [
              react.createElement('td', {}, ' ' + lang.fee), react.createElement('td', {}, children = [
                react.createElement('span', {
                  title: send.amountSendFee + ""
                }, ' ' + round5(send.amountSendFee)), react.createElement('img', {
                  src: send.coin.image + "",
                  className: 'label-coin'
                }), react.createElement('span', {
                  title: send.amountSendFee + ""
                }, ' ' + feeToken), react.createElement('div', {
                  className: 'usd'
                }, ' $ ' + round5(send.amountSendFeeUsd))
              ])
            ])
          ]))
        ]), react.createElement('div', {
          className: 'button-container'
        }, children = react.createElement('div', {
          className: 'buttons'
        }, children = [
          button({
            store: store,
            text: 'send',
            onClick: sendAnyway,
            loading: send.sending,
            type: 'primary',
            error: send.error
          }), button({
            store: store,
            text: 'cancel',
            onClick: cancel,
            icon: 'close2'
          })
        ]))
      ])
    ]);
  };
  module.exports = send;
  module.exports.init = function(arg$, cb){
    var store, web3t, wallet, wallets, currentWallet, sendTransaction;
    store = arg$.store, web3t = arg$.web3t;
    wallet = sendFuncs(store, web3t).wallet;
    if (wallet == null) {
      return cb(null);
    }
    wallets = walletsFuncs(store, web3t).wallets;
    currentWallet = find(function(it){
      return it.coin.token === wallet.coin.token;
    })(
    wallets);
    if (currentWallet.address === wallet.address) {
      return cb(null);
    }
    wallet = sendFuncs(store, web3t).wallet;
    if (wallet == null) {
      return cb(null);
    }
    if (web3t[wallet.coin.token] == null) {
      return cb(null);
    }
    sendTransaction = web3t[wallet.coin.token].sendTransaction;
    return sendTransaction({
      to: "",
      value: 0
    }, function(err){
      return cb(null);
    });
  };
}).call(this);
