// Generated by LiveScript 1.6.0
(function(){
  var react, sendFuncs, ref$, map, find, keys, filter, getPrimaryInfo, icon, getLang, switchAccount, icons, roundHuman, roundNumber, walletsFuncs, epoch, button, addressHolder, identicon, trxFee, sendContract, historyFuncs, burger, amountField, networkSlider, times, BN, addresses, contracts, tokenNetworks, sendStyle, formGroup, send;
  react = require('react');
  sendFuncs = require('../../send-funcs.js');
  ref$ = require('prelude-ls'), map = ref$.map, find = ref$.find, keys = ref$.keys, filter = ref$.filter;
  getPrimaryInfo = require('../../get-primary-info.js');
  icon = require('../icon.js');
  getLang = require('../../get-lang.js');
  switchAccount = require('../switch-account.js');
  icons = require('../../icons.js');
  roundHuman = require('../../round-human.js');
  roundNumber = require('../../round-number.js');
  walletsFuncs = require('../../wallets-funcs.js');
  epoch = require('../epoch.js');
  button = require('../../components/button.js');
  addressHolder = require('../../components/address-holder.js');
  identicon = require('../../components/identicon.js');
  trxFee = require('../../components/trx-fee.js');
  sendContract = require('../send-contract.js');
  historyFuncs = require('../../history-funcs.js');
  burger = require('../../components/burger.js');
  amountField = require('../../components/amount-field.js');
  networkSlider = require('../../components/sliders/network-slider.js');
  times = require('../../math.js').times;
  BN = require('ethereumjs-util').BN;
  addresses = require('../../velas/addresses.js');
  contracts = require('../../contracts.js');
  tokenNetworks = require('../../swaping/networks.js');
  sendStyle = require('./send-style.js');
  formGroup = function(classes, title, style, content){
    var children;
    return react.createElement('div', {
      className: classes + " form-group"
    }, children = [
      react.createElement('label', {
        style: style,
        className: 'control-label'
      }, ' ' + title), content()
    ]);
  };
  send = function(arg$){
    var store, web3t, ref$, token, name, feeToken, bridgeFeeToken, network, send, wallet, pending, recipientChange, amountChange, amountUsdChange, amountEurChange, useMaxAmount, showData, showLabel, history, cancel, sendAnyway, beforeSendAnyway, swapBack, chooseAuto, round5edit, round5, isData, encodeDecode, changeAmount, invoice, goBack, roundMoney, style, menuStyle, inputStyle, borderStyle, amountStyle, iconStyle, useMaxStyle, buttonPrimary3Style, buttonPrimary2Style, cryptoBackground, justCryptoBackground, moreText, borderHeader, lang, walletTitle, openInvoice, activate, activateUsd, activateEur, activeClass, activeUsd, activeEur, showClass, tokenDisplay, feeTokenDisplay, feeCoinImage, goBackFromSend, makeDisabled, isSwap, sendFunc, disabled, receiverIsSwapContract, visibleError, getRecipient, recipient, children;
    store = arg$.store, web3t = arg$.web3t;
    ref$ = sendFuncs(store, web3t), token = ref$.token, name = ref$.name, feeToken = ref$.feeToken, bridgeFeeToken = ref$.bridgeFeeToken, network = ref$.network, send = ref$.send, wallet = ref$.wallet, pending = ref$.pending, recipientChange = ref$.recipientChange, amountChange = ref$.amountChange, amountUsdChange = ref$.amountUsdChange, amountEurChange = ref$.amountEurChange, useMaxAmount = ref$.useMaxAmount, showData = ref$.showData, showLabel = ref$.showLabel, history = ref$.history, cancel = ref$.cancel, sendAnyway = ref$.sendAnyway, beforeSendAnyway = ref$.beforeSendAnyway, swapBack = ref$.swapBack, chooseAuto = ref$.chooseAuto, round5edit = ref$.round5edit, round5 = ref$.round5, isData = ref$.isData, encodeDecode = ref$.encodeDecode, changeAmount = ref$.changeAmount, invoice = ref$.invoice;
    if (send.details === false) {
      return sendContract({
        store: store,
        web3t: web3t
      });
    }
    send.sending = false;
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
      background: style.app.input,
      border: "1px solid " + style.app.border,
      color: style.app.text
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
    buttonPrimary2Style = {
      border: "1px solid " + style.app.wallet,
      color: style.app.text,
      background: style.app.primary2,
      backgroundColor: style.app.primary2Spare
    };
    cryptoBackground = {
      background: style.app.wallet,
      width: "50%"
    };
    justCryptoBackground = {
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
    tokenDisplay = token === 'VLX2' ? 'VLX' : token;
    feeTokenDisplay = feeToken === 'VLX2' ? 'VLX' : feeToken;
    feeTokenDisplay = (function(){
      switch (false) {
      case bridgeFeeToken == null:
        return bridgeFeeToken;
      default:
        return feeTokenDisplay;
      }
    }());
    feeTokenDisplay = feeTokenDisplay.toUpperCase();
    feeCoinImage = (function(){
      switch (false) {
      case send.feeCoinImage == null:
        return send.feeCoinImage;
      default:
        return send.coin.image;
      }
    }());
    goBackFromSend = function(){
      send.error = '';
      return goBack();
    };
    makeDisabled = send.amountSend <= 0;
    token = store.current.send.coin.token;
    isSwap = store.current.send.swap === true;
    sendFunc = (function(){
      switch (false) {
      case !(token === 'vlx_erc20' && isSwap):
        return swapBack;
      default:
        return beforeSendAnyway;
      }
    }());
    disabled = send.to == null || send.to.trim().length === 0 || send.error.indexOf("address") > -1;
    receiverIsSwapContract = contracts.isSwapContract(store, store.current.send.contractAddress);
    visibleError = send.error != null && send.error.length > 0 ? "visible" : "";
    getRecipient = function(address){
      return address;
    };
    recipient = getRecipient(send.to);
    return react.createElement('div', {
      className: 'content'
    }, children = [
      react.createElement('div', {
        style: borderHeader,
        className: 'title'
      }, children = [
        react.createElement('div', {
          className: showClass + " header"
        }, ' ' + lang.send), react.createElement('div', {
          onClick: goBackFromSend,
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
          formGroup('sender', lang.from, iconStyle, function(){
            var children;
            return react.createElement('div', {
              style: borderStyle,
              className: 'address'
            }, children = addressHolder({
              store: store,
              wallet: wallet
            }));
          }), react.createElement('div', {
            className: 'slider network form-group'
          }, children = networkSlider({
            web3t: web3t,
            wallet: wallet,
            store: store
          })), formGroup('receiver', lang.to, iconStyle, function(){
            var children;
            return react.createElement('div', {}, children = [
              identicon({
                store: store,
                address: send.to
              }), react.createElement('input', {
                type: 'text',
                style: inputStyle,
                onChange: recipientChange,
                value: recipient + "",
                placeholder: store.current.sendToMask + "",
                id: "send-recipient"
              })
            ]);
          }), formGroup('send-amount', lang.amount, iconStyle, function(){
            var children;
            return react.createElement('div', {}, children = [
              react.createElement('div', {
                className: 'amount-field'
              }, children = [
                react.createElement('div', {
                  style: inputStyle,
                  className: 'input-wrapper'
                }, children = [
                  react.createElement('div', {
                    className: 'label crypto'
                  }, children = [
                    react.createElement('img', {
                      src: send.coin.image + "",
                      className: 'label-coin'
                    }), " " + tokenDisplay
                  ]), amountField({
                    store: store,
                    value: round5edit(send.amountSend) + "",
                    onChange: amountChange,
                    placeholder: typeof placeholder != 'undefined' && placeholder !== null ? placeholder : "0",
                    id: typeof id != 'undefined' && id !== null ? id : "send-amount",
                    token: token,
                    disabled: disabled
                  })
                ]), activeUsd === 'active' ? react.createElement('div', {
                  style: amountStyle,
                  className: 'input-wrapper small'
                }, children = [
                  react.createElement('div', {
                    className: 'label lusd'
                  }, ' $'), react.createElement('input', {
                    type: 'text',
                    style: justCryptoBackground,
                    onChange: amountUsdChange,
                    placeholder: "0",
                    title: send.amountSendUsd + "",
                    value: roundNumber(send.amountSendUsd, {
                      decimals: 8
                    }) + "",
                    id: "send-amount-usd",
                    disabled: disabled,
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
                    style: cryptoBackground,
                    onChange: amountEurChange,
                    placeholder: "0",
                    title: send.amountSendEur + "",
                    value: roundMoney(send.amountSendEur) + "",
                    id: "send-amount-eur",
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
                  id: "send-max",
                  className: 'send-all'
                }, ' ' + lang.useMax), react.createElement('span', {}, ' ' + lang.balance), react.createElement('span', {
                  className: 'balance'
                }, children = [
                  react.createElement('span', {
                    title: wallet.balance + ""
                  }, ' ' + roundHuman(wallet.balance)), react.createElement('img', {
                    src: send.coin.image + "",
                    className: 'label-coin'
                  }), react.createElement('span', {}, ' ' + tokenDisplay), +wallet.pendingSent > 0 && false ? react.createElement('span', {
                    className: 'pending'
                  }, ' ' + '(' + pending + ' ' + lang.pending + ')') : void 8
                ])
              ]), react.createElement('div', {
                title: send.error + "",
                className: visibleError + " control-label not-enough text-left"
              }, ' ' + send.error)
            ]);
          }), isData ? formGroup('contract-data', 'Data', iconStyle, function(){
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
                }, ' ' + tokenDisplay), react.createElement('div', {
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
                  src: feeCoinImage + "",
                  className: 'label-coin'
                }), react.createElement('span', {
                  title: send.amountSendFee + ""
                }, ' ' + feeTokenDisplay), react.createElement('div', {
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
            onClick: sendFunc,
            loading: send.sending,
            type: 'primary',
            error: send.error,
            makeDisabled: makeDisabled,
            id: "send-confirm"
          }), button({
            store: store,
            text: 'cancel',
            onClick: cancel,
            icon: 'close2',
            id: "send-cancel"
          })
        ]))
      ])
    ]);
  };
  module.exports = send;
  module.exports.init = function(arg$, cb){
    var store, web3t, wallet, isSwapContract, contractAddress, networkType, networks, networkKeys, defaultNetwork, wallets, currentWallet;
    store = arg$.store, web3t = arg$.web3t;
    wallet = sendFuncs(store, web3t).wallet;
    if (wallet == null) {
      return cb(null);
    }
    if (send.sending === true) {
      return cb(null);
    }
    store.current.send.foreignNetworkFee = 0;
    if (store.current.send.swap !== true) {
      store.current.send.contractAddress = null;
    }
    isSwapContract = contracts.isSwapContract(store, send.to);
    if (isSwapContract) {
      contractAddress = wallet.coin.token === 'vlx2'
        ? web3t.velas.HomeBridgeNativeToErc.address
        : web3t.velas.ForeignBridgeNativeToErc.address;
      store.current.send.to = contractAddress;
      networkType = store.current.network;
      networks = wallet.coin[networkType + "s"];
      store.current.send.networks = networks;
      networkKeys = keys(
      networks);
      defaultNetwork = networks[networkKeys[0]].name;
    }
    /* If it is Swap! */
    if (wallet.network.networks != null && store.current.send.swap === true) {
      store.current.send.chosenNetwork = wallet.network.networks.evm;
      store.current.send.to = tokenNetworks.getDefaultRecipientAddress(store);
    }
    wallets = walletsFuncs(store, web3t).wallets;
    currentWallet = find(function(it){
      return it.coin.token === wallet.coin.token;
    })(
    wallets);
    return contracts.getHomeNetworkFee({
      store: store,
      web3t: web3t
    }, store.current.send.to, function(err, fee){
      var wallet, bridgeFeeToken, secondWallet, sendTransaction;
      store.current.send.foreignNetworkFee = fee;
      wallet = sendFuncs(store, web3t).wallet;
      store.current.send.feeCoinImage = wallet.coin.image;
      if (wallet.network.txBridgeFeeIn != null && wallet.coin.token !== wallet.network.txBridgeFeeIn) {
        bridgeFeeToken = wallet.network.txBridgeFeeIn;
        secondWallet = find(function(it){
          return it.coin.token === bridgeFeeToken;
        })(
        wallets);
        store.current.send.feeCoinImage = secondWallet.coin.image;
      }
      if (currentWallet.address === wallet.address) {
        return cb(null);
      }
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
        send.sending = false;
        return cb(null);
      });
    });
  };
}).call(this);