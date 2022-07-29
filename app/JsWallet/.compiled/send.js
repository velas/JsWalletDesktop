// Generated by LiveScript 1.6.0
(function(){
  var react, sendFuncs, ref$, map, find, keys, filter, pairsToObj, objToPairs, calcFeeBeforeSend, getPrimaryInfo, icon, getLang, switchAccount, icons, roundHuman, roundNumber, walletsFuncs, epoch, button, addressHolder, identicon, trxFee, trxCustomGasPrice, sendContract, historyFuncs, burger, amountField, amountFiatField, networkSlider, times, div, minus, BN, addresses, contracts, tokenNetworks, HomeBridgeNativeToErc, ForeignBridgeNativeToErc, contractData, moment, loader, formGroup, send;
  react = require('react');
  sendFuncs = require('../send-funcs.ls');
  ref$ = require('prelude-ls'), map = ref$.map, find = ref$.find, keys = ref$.keys, filter = ref$.filter, pairsToObj = ref$.pairsToObj, objToPairs = ref$.objToPairs;
  calcFeeBeforeSend = require('../calc-amount.js').calcFeeBeforeSend;
  getPrimaryInfo = require('../get-primary-info.ls');
  icon = require('./icon.ls');
  getLang = require('../get-lang.ls');
  switchAccount = require('./switch-account.ls');
  icons = require('../icons.ls');
  roundHuman = require('../round-human.ls');
  roundNumber = require('../round-number.ls');
  walletsFuncs = require('../wallets-funcs.ls');
  epoch = require('./epoch.ls');
  button = require('../components/button.ls');
  addressHolder = require('../components/address-holder.ls');
  identicon = require('../components/identicon.ls');
  trxFee = require('../components/trx-fee.ls');
  trxCustomGasPrice = require('../components/trx-custom-gas-price.ls');
  sendContract = require('./send-contract.ls');
  historyFuncs = require('../history-funcs.ls');
  burger = require('../components/burger.ls');
  amountField = require('../components/amount-field.ls');
  amountFiatField = require('../components/amount-fiat-field.ls');
  networkSlider = require('../components/sliders/network-slider.ls');
  ref$ = require('../math.ls'), times = ref$.times, div = ref$.div, minus = ref$.minus;
  BN = require('ethereumjs-util').BN;
  addresses = require('../velas/addresses.ls');
  contracts = require('../contracts.ls');
  tokenNetworks = require('../swaping/networks.ls');
  HomeBridgeNativeToErc = require('../../web3t/contracts/HomeBridgeNativeToErc.json');
  ForeignBridgeNativeToErc = require('../../web3t/contracts/ForeignBridgeNativeToErc.json');
  contractData = require('../contract-data.ls');
  moment = require('moment');
  loader = require('../components/popups/loader.ls');
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
    var store, web3t, ref$, walletIcon, executeContractData, getBridgeInfo, token, name, homeFee, homeFeeUsd, feeToken, bridgeFeeToken, network, send, wallet, pending, recipientChange, amountChange, amountUsdChange, amountEurChange, useMaxAmount, showData, showLabel, history, cancel, sendAnyway, beforeSendAnyway, chooseAuto, round5edit, round5, isData, encodeDecode, changeAmount, invoice, theme, goBack, roundMoney, style, menuStyle, inputStyle, inputCustomStyle, borderStyle, amountStyle, iconStyle, useMaxStyle, buttonPrimary3Style, buttonPrimary2Style, cryptoBackground, justCryptoBackground, contentBodyStyle, moreText, borderHeader, lang, walletTitle, openInvoice, activate, activateUsd, activateEur, activeClass, activeUsd, activeEur, showClass, isCustom, tokenDisplay, down, feeTokenDisplay, feeCoinImage, goBackFromSend, makeDisabled, isSwap, sendFunc, disabled, ref1$, placeholderClass, receiverIsSwapContract, visibleError, getRecipient, recipient, title, homeFeePercent, homeFeePercentLabel, isNotBridge, isSwapPair, networkOnChange, beforeAmountChange, checkStop, inputWrapperStyle, inlineStyle, amountSendFeeRounded, children, ref2$;
    store = arg$.store, web3t = arg$.web3t;
    ref$ = sendFuncs(store, web3t), walletIcon = ref$.walletIcon, executeContractData = ref$.executeContractData, getBridgeInfo = ref$.getBridgeInfo, token = ref$.token, name = ref$.name, homeFee = ref$.homeFee, homeFeeUsd = ref$.homeFeeUsd, feeToken = ref$.feeToken, bridgeFeeToken = ref$.bridgeFeeToken, network = ref$.network, send = ref$.send, wallet = ref$.wallet, pending = ref$.pending, recipientChange = ref$.recipientChange, amountChange = ref$.amountChange, amountUsdChange = ref$.amountUsdChange, amountEurChange = ref$.amountEurChange, useMaxAmount = ref$.useMaxAmount, showData = ref$.showData, showLabel = ref$.showLabel, history = ref$.history, cancel = ref$.cancel, sendAnyway = ref$.sendAnyway, beforeSendAnyway = ref$.beforeSendAnyway, chooseAuto = ref$.chooseAuto, round5edit = ref$.round5edit, round5 = ref$.round5, isData = ref$.isData, encodeDecode = ref$.encodeDecode, changeAmount = ref$.changeAmount, invoice = ref$.invoice;
    if (send.details === false) {
      return sendContract({
        store: store,
        web3t: web3t
      });
    }
    theme = getPrimaryInfo(store);
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
      color: style.app.text,
      userSelect: "text"
    };
    inputCustomStyle = {
      background: style.app.input,
      border: "1px solid " + style.app.border,
      color: style.app.text,
      width: "100%"
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
    contentBodyStyle = {
      color: style.app.text,
      border: "1px solid " + style.app.border,
      background: (ref$ = theme.app.sendForm) != null
        ? ref$
        : theme.app.background
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
    down = function(it){
      return (it != null ? it : "").toLowerCase();
    };
    feeTokenDisplay = feeToken.toUpperCase();
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
    makeDisabled = send.amountSend <= 0 || store.current.send.feeCalculating === true;
    token = store.current.send.coin.token;
    isSwap = store.current.send.isSwap === true;
    sendFunc = beforeSendAnyway;
    disabled = send.to == null || send.to.trim().length === 0 || ((ref1$ = send.error) != null ? ref1$ : "").indexOf("address") > -1;
    placeholderClass = store.current.send.feeCalculating === true ? "placeholder" : "";
    receiverIsSwapContract = contracts.isSwapContract(store, store.current.send.contractAddress);
    visibleError = send.error != null && send.error.length > 0 ? "visible" : "";
    getRecipient = function(address){
      return address;
    };
    recipient = getRecipient(send.to);
    title = store.current.send.isSwap !== true ? 'send' : 'swap';
    homeFeePercent = (function(){
      switch (false) {
      default:
        return times(send.homeFeePercent, 100);
      }
    }());
    homeFeePercentLabel = (function(){
      switch (false) {
      case store.current.send.feeMode !== "fixed":
        return "";
      default:
        return "(" + homeFeePercent + "%)";
      }
    }());
    isNotBridge = function(){
      var token, chosenNetwork, ref$;
      token = store.current.send.wallet.coin.token;
      chosenNetwork = store.current.send.chosenNetwork;
      return ((ref$ = chosenNetwork.referTo) === 'vlx_evm' || ref$ === 'vlx2' || ref$ === 'vlx_native') && (token === 'vlx_evm' || token === 'vlx2' || token === 'vlx_native');
    };
    isSwapPair = function(arg$){
      var from, to, ref$, chosenNetwork, coin, wallet, token;
      from = arg$.from, to = arg$.to;
      ref$ = store.current.send, chosenNetwork = ref$.chosenNetwork, coin = ref$.coin, wallet = ref$.wallet;
      token = coin.token;
      return token === from && chosenNetwork.referTo === to;
    };
    networkOnChange = function(cb){
      return getBridgeInfo(function(err){
        if (err != null) {
          store.current.send.error = err;
          return cb(err);
        }
        return executeContractData({
          store: store
        }, function(err){
          if (err != null) {
            store.current.send.error = err;
            return cb(err);
          }
          amountChange({
            target: {
              value: store.current.send.amountSend
            }
          });
          return cb(null);
        });
      });
    };
    beforeAmountChange = function(e){
      var TYPING_THRESHOLD_MS, typingAmountTimeMs, feeCalculating, now, timeout;
      TYPING_THRESHOLD_MS = send.TYPING_THRESHOLD_MS, typingAmountTimeMs = send.typingAmountTimeMs, feeCalculating = send.feeCalculating;
      feeCalculating = true;
      now = moment().valueOf();
      timeout = +minus(now, typingAmountTimeMs);
      store.current.send.typingAmountTimeMs = moment().valueOf();
      return amountChange(e);
    };
    checkStop = function(e){
      return function(){
        var TYPING_THRESHOLD_MS, typingAmountTimeMs, feeCalculating, now, timeout;
        TYPING_THRESHOLD_MS = send.TYPING_THRESHOLD_MS, typingAmountTimeMs = send.typingAmountTimeMs, feeCalculating = send.feeCalculating;
        now = moment().valueOf();
        timeout = +minus(now, typingAmountTimeMs);
        if (timeout > TYPING_THRESHOLD_MS) {
          console.log("run amount-change");
          return amountChange(e);
        }
      };
    };
    inputWrapperStyle = (function(){
      switch (false) {
      case isCustom !== true:
        return inputCustomStyle;
      default:
        return inputStyle;
      }
    }());
    inlineStyle = {
      display: "inline",
      minWidth: "30px"
    };
    amountSendFeeRounded = roundHuman(send.amountSendFee, {
      decimals: 8
    });
    /* Render */
    return react.createElement('div', {
      className: 'content content-828432226'
    }, children = [
      loader({
        loading: store.current.send.checkingAllowed,
        text: "Please wait, approving bridge contract..."
      }), react.createElement('div', {
        style: borderHeader,
        className: 'title'
      }, children = [
        react.createElement('div', {
          className: showClass + " header"
        }, ' ' + title), react.createElement('div', {
          onClick: goBackFromSend,
          className: 'close'
        }, children = react.createElement('img', {
          src: icons.arrowLeft + "",
          className: 'icon-svg'
        })), burger(store, web3t), epoch(store, web3t), switchAccount(store, web3t)
      ]), react.createElement('div', {
        style: contentBodyStyle,
        className: 'content-body'
      }, children = [
        store.current.device !== 'mobile' ? react.createElement('div', {
          className: 'header'
        }, children = [
          react.createElement('span', {
            className: 'head left'
          }, children = react.createElement('img', {
            src: walletIcon + ""
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
            className: 'network form-group'
          }, children = networkSlider({
            web3t: web3t,
            wallet: wallet,
            store: store,
            onChange: networkOnChange
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
                  style: inputWrapperStyle,
                  className: 'input-wrapper'
                }, children = [
                  react.createElement('div', {
                    className: 'label crypto'
                  }, children = [
                    react.createElement('img', {
                      src: walletIcon + "",
                      className: 'label-coin'
                    }), " " + tokenDisplay
                  ]), amountField({
                    store: store,
                    value: send.amountSend,
                    onChange: beforeAmountChange,
                    placeholder: typeof placeholder != 'undefined' && placeholder !== null ? placeholder : "0",
                    id: typeof id != 'undefined' && id !== null ? id : "send-amount",
                    token: token,
                    disabled: disabled
                  })
                ]), activeUsd === 'active' ? !isCustom ? amountFiatField({
                  store: store,
                  onChange: amountUsdChange,
                  placeholder: "0",
                  title: send.amountSendUsd + "",
                  value: send.amountSendUsd + "",
                  id: "send-amount-usd",
                  disabled: false
                }) : void 8 : void 8, activeEur === 'active' ? react.createElement('div', {
                  style: amountStyle,
                  className: 'input-wrapper small'
                }, children = [
                  react.createElement('div', {
                    className: 'label lusd'
                  }), react.createElement('input', {
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
                    src: walletIcon + "",
                    className: 'label-coin'
                  }), react.createElement('span', {}, ' ' + tokenDisplay), +wallet.pendingSent > 0 && false ? react.createElement('span', {
                    className: 'pending'
                  }, ' ' + '(' + pending + ' ' + lang.pending + ')') : void 8
                ])
              ]), !store.current.send.parseError ? react.createElement('div', {
                title: send.error + "",
                className: visibleError + " control-label not-enough text-left"
              }, ' ' + send.error) : void 8
            ]);
          }), isData ? formGroup('contract-data', 'Data', iconStyle, function(){
            return react.createElement('div', {
              style: inputStyle,
              className: 'smart-contract'
            }, ' ' + showData());
          }) : void 8, down((ref1$ = wallet.network) != null ? ref1$.group : void 8) === 'bitcoin' || ((ref2$ = wallet.coin.token) === 'vlx_native' || ref2$ === 'ltc')
            ? trxFee({
              store: store,
              web3t: web3t,
              wallet: wallet,
              feeToken: feeToken
            })
            : trxCustomGasPrice({
              store: store,
              web3t: web3t,
              wallet: wallet,
              feeToken: feeToken
            }), react.createElement('table', {
            style: borderStyle
          }, children = react.createElement('tbody', {}, children = [
            react.createElement('tr', {}, children = [
              react.createElement('td', {}, ' ' + lang.youSpend), react.createElement('td', {}, children = [
                react.createElement('span', {
                  title: send.amountCharged + ""
                }, ' ' + roundHuman(send.amountCharged)), react.createElement('img', {
                  src: walletIcon + "",
                  className: 'label-coin'
                }), react.createElement('span', {
                  title: send.amountCharged + ""
                }, ' ' + tokenDisplay), !isCustom ? react.createElement('div', {
                  className: 'usd'
                }, ' $ ' + roundHuman(send.amountChargedUsd)) : void 8
              ])
            ]), react.createElement('tr', {
              className: 'orange'
            }, children = [
              react.createElement('td', {}, ' ' + lang.fee), react.createElement('td', {}, children = [
                react.createElement('span', {
                  title: send.amountSendFee + "",
                  style: inlineStyle,
                  className: placeholderClass + ""
                }, ' ' + amountSendFeeRounded), react.createElement('img', {
                  src: feeCoinImage + "",
                  className: 'label-coin'
                }), react.createElement('span', {
                  title: send.amountSendFee + ""
                }, ' ' + feeTokenDisplay), react.createElement('div', {
                  className: 'usd'
                }, ' $ ' + roundHuman(send.amountSendFeeUsd))
              ])
            ]), send.homeFeePercent != null && send.homeFeePercent > 0 ? react.createElement('tr', {
              className: 'orange home-fee'
            }, children = [
              react.createElement('td', {}, children = [" " + lang.homeFee, " " + homeFeePercentLabel]), react.createElement('td', {}, children = [
                react.createElement('span', {
                  title: homeFee + ""
                }, ' ' + roundHuman(homeFee)), react.createElement('img', {
                  src: send.coin.image + "",
                  className: 'label-coin'
                }), react.createElement('span', {
                  title: homeFee + ""
                }, ' ' + tokenDisplay), react.createElement('div', {
                  className: 'usd'
                }, ' $ ' + roundHuman(homeFeeUsd))
              ])
            ]) : void 8
          ]))
        ]), react.createElement('div', {
          className: 'button-container'
        }, children = [
          react.createElement('div', {
            className: 'buttons'
          }, children = [
            button({
              store: store,
              text: title + "",
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
          ]), store.current.send.isSwap === true ? !isNotBridge() ? react.createElement('div', {
            className: 'swap-notification'
          }, children = react.createElement('p', {}, ' ' + lang.swapNotification)) : void 8 : void 8
        ])
      ])
    ]);
  };
  module.exports = send;
  module.exports.init = function(arg$, cb){
    var store, web3t, ref$, executeContractData, wallet, getBridgeInfo, isSwapContract, $wallets, availableNetworks, walletSwapNetworksIds, defaultNetwork;
    store = arg$.store, web3t = arg$.web3t;
    if (store == null || web3t == null) {
      return cb(null);
    }
    ref$ = sendFuncs(store, web3t), executeContractData = ref$.executeContractData, wallet = ref$.wallet, getBridgeInfo = ref$.getBridgeInfo;
    if (wallet == null) {
      return cb(null);
    }
    if (send.sending === true) {
      return cb(null);
    }
    store.current.send.feeCalculating = false;
    store.current.send.checkingAllowed = false;
    store.current.send.foreignNetworkFee = 0;
    store.current.send.amountCharged = 0;
    store.current.send.amountChargedUsd = 0;
    store.current.send.homeFeePercent = 0;
    store.current.send.gasEstimate = '0';
    store.current.send.gasPriceAuto = null;
    store.current.send.gasPriceType = 'auto';
    store.current.send.gasPriceCustomAmount = '0';
    store.current.send.amountBuffer.val = '0';
    store.current.send.amountBuffer.usdVal = '0';
    store.current.send.error = '';
    store.current.send.feeMode = 'percent';
    if (store.current.send.isSwap !== true) {
      store.current.send.contractAddress = null;
    }
    isSwapContract = contracts.isSwapContract(store, send.to);
    /* If it is Swap! */
    if (wallet.network.networks != null && store.current.send.isSwap === true) {
      $wallets = pairsToObj(
      map(function(it){
        return [it.coin.token, it];
      })(
      store.current.account.wallets));
      availableNetworks = pairsToObj(
      filter(function(it){
        var ref$, ref1$;
        return ((ref$ = it[1]) != null ? ref$.disabled : void 8) == null || ((ref1$ = it[1]) != null ? ref1$.disabled : void 8) === false;
      })(
      filter(function(it){
        var ref$;
        return $wallets[(ref$ = it[1]) != null ? ref$.referTo : void 8] != null;
      })(
      objToPairs(
      wallet.network.networks))));
      walletSwapNetworksIds = Object.keys(availableNetworks);
      if (walletSwapNetworksIds.length > 0) {
        defaultNetwork = wallet.network.networks[walletSwapNetworksIds[0]];
        store.current.send.chosenNetwork = defaultNetwork;
        store.current.send.to = tokenNetworks.getDefaultRecipientAddress(store);
      } else {
        console.error("networks prop in " + store.current.send.token + " wallet is defined but is empty");
      }
    }
    return contractData({
      store: store
    }).formContractData(function(err){
      if (err != null) {
        console.log("form-contract-data err: ", err);
      }
      return getBridgeInfo(function(err){
        var wallets, currentWallet;
        if (err != null) {
          return cb(err);
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
          var wallet, txFeeInWallet, send, account, query;
          store.current.send.foreignNetworkFee = fee;
          wallet = sendFuncs(store, web3t).wallet;
          store.current.send.feeCoinImage = (function(){
            var ref$;
            switch (false) {
            case wallet.network.txFeeIn == null:
              txFeeInWallet = find(function(it){
                return it.coin.token === wallet.network.txFeeIn;
              })(
              wallets);
              if (!txFeeInWallet) {
                store.current.send.error = "Please add " + ((ref$ = wallet.network.txFeeIn) != null ? ref$ : "").toUpperCase() + " wallet in order to calculate transaction fee";
              }
              return (ref$ = txFeeInWallet != null ? (ref$ = txFeeInWallet.coin) != null ? ref$.image : void 8 : void 8) != null ? ref$ : "";
            default:
              return wallet.coin.image;
            }
          }());
          send = store.current.send;
          account = {
            address: wallet.address,
            privateKey: wallet.privateKey,
            balance: wallet.balance
          };
          query = {
            store: store,
            token: wallet.coin.token,
            to: wallet.address,
            data: send.data,
            network: send.network,
            amount: 0,
            feeType: 'auto',
            account: account
          };
          return calcFeeBeforeSend({
            store: store,
            query: query,
            fast: true
          }, function(err, result){
            var ref$, sendTransaction;
            if (err != null) {
              return cb(err);
            }
            send.gasPriceAuto = (ref$ = result != null ? result.gasPrice : void 8) != null ? ref$ : 0;
            send.gasPriceCustomAmount = +div((ref$ = result != null ? result.gasPrice : void 8) != null ? ref$ : 0, Math.pow(10, 9));
            send.amountSendFee = +((ref$ = result != null ? result.calcedFee : void 8) != null ? ref$ : 0);
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
        });
      });
    });
  };
}).call(this);