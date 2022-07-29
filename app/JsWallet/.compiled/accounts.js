// Generated by LiveScript 1.6.0
(function(){
  var react, reactDom, bignumber, navigate, getPrimaryInfo, getLang, historyFuncs, icon, ref$, map, split, filter, find, foldl, sortBy, unique, head, each, findIndex, div, times, plus, minus, Buffer, ethToVlx, roundHuman, checkbox, icons, placeholder, canMakeStaking, button, addressHolder, addressHolderPopup, alertTxn, amountField, seedmem, moment, prompt2, promptStakeAccountAmount, alert, confirm, notify, pagination, getErrorMessage, creationAccountSubscribe, loader, asCallback, cb, showValidator, paginate, stakingAccountsContent, stakingAccounts, stringify, out$ = typeof exports != 'undefined' && exports || this;
  react = require('react');
  reactDom = require('react-dom');
  bignumber = require('bignumber.js');
  navigate = require('../../navigate.ls');
  getPrimaryInfo = require('../../get-primary-info.ls');
  getLang = require('../../get-lang.ls');
  historyFuncs = require('../../history-funcs.ls');
  icon = require('../icon.ls');
  ref$ = require('prelude-ls'), map = ref$.map, split = ref$.split, filter = ref$.filter, find = ref$.find, foldl = ref$.foldl, sortBy = ref$.sortBy, unique = ref$.unique, head = ref$.head, each = ref$.each, findIndex = ref$.findIndex;
  ref$ = require('../../math.ls'), div = ref$.div, times = ref$.times, plus = ref$.plus, minus = ref$.minus;
  Buffer = require('safe-buffer').Buffer;
  ethToVlx = require('../../../web3t/addresses.js').ethToVlx;
  roundHuman = require('../../round-human.ls');
  checkbox = require('../../components/checkbox.ls');
  icons = require('../../icons.ls');
  placeholder = require('../placeholder.ls');
  canMakeStaking = require('../../staking/can-make-staking.ls');
  button = require('../../components/button.ls');
  addressHolder = require('../../components/address-holder.ls');
  addressHolderPopup = require('../../components/address-holder-popup.ls');
  alertTxn = require('../alert-txn.ls');
  amountField = require('../../components/amount-field.ls');
  seedmem = require('../../seed.ls');
  moment = require('moment');
  ref$ = require('../confirmation.ls'), prompt2 = ref$.prompt2, promptStakeAccountAmount = ref$.promptStakeAccountAmount, alert = ref$.alert, confirm = ref$.confirm, notify = ref$.notify;
  pagination = require('../../components/pagination.ls');
  getErrorMessage = require('./error-funcs.ls').getErrorMessage;
  creationAccountSubscribe = require('../../staking-funcs.ls').creationAccountSubscribe;
  loader = require('../../components/popups/loader.ls');
  asCallback = function(p, cb){
    p['catch'](function(err){
      return cb(err);
    });
    return p.then(function(data){
      return cb(null, data);
    });
  };
  cb = console.log;
  showValidator = function(store, web3t){
    return function(validator){
      return react.createElement('li', {
        key: "validator-" + validator
      }, ' ' + validator);
    };
  };
  out$.paginate = paginate = function(array, perPage, page){
    page = page - 1;
    return array.slice(page * perPage, (page + 1) * perPage);
  };
  stakingAccountsContent = function(store, web3t){
    var style, lang, buttonPrimary3Style, goBack, getBalance, getOptions, useMin, useMax, isSpinned, refresh, perPage, page, _index, build, cancel, iconStyle, stakerPoolStyle, stats, notificationBorder, blockStyle, createStakingAccount, totalOwnStakingAccounts, ref$, loadingAccountIndex, paginationDisabled, fetchErrorOccurred, svgIcon, children;
    style = getPrimaryInfo(store);
    lang = getLang(store);
    buttonPrimary3Style = {
      border: "1px solid " + style.app.primary3,
      color: style.app.text2,
      background: style.app.primary3,
      backgroundColor: style.app.primary3Spare
    };
    goBack = historyFuncs(store, web3t).goBack;
    lang = getLang(store);
    getBalance = function(){
      var wallet, ref$;
      wallet = find(function(it){
        return it.coin.token === 'vlx_native';
      })(
      store.current.account.wallets);
      return (ref$ = wallet != null ? wallet.balance : void 8) != null ? ref$ : 0;
    };
    getOptions = function(cb){
      return web3t.velas.Staking.candidateMinStake(function(err, data){
        var min, balance, stake, max;
        if (err != null) {
          return cb(err);
        }
        min = (function(){
          switch (false) {
          case !(+store.stakingAccounts.stakeAmountTotal >= 10000):
            return 1;
          default:
            return div(data, Math.pow(10, 18));
          }
        }());
        balance = minus(div(store.stakingAccounts.chosenLockup.lockedFundsRaw, Math.pow(10, 18)), 0.1);
        stake = store.stakingAccounts.add.addValidatorStake;
        if (10000 > +stake) {
          return cb(lang.amountLessStaking);
        }
        if (+balance < +stake) {
          return cb(lang.balanceLessStaking);
        }
        max = +balance;
        return cb(null, {
          min: min,
          max: max
        });
      });
    };
    useMin = function(){
      return store.stakingAccounts.add.addValidatorStake = 10000;
    };
    useMax = function(){
      var balance;
      balance = div(store.stakingAccounts.chosenLockup.lockedFundsRaw, Math.pow(10, 18));
      return store.stakingAccounts.add.addValidatorStake = Math.max(minus(balance, 0.1), 0);
    };
    isSpinned = (store.staking.allAccountsLoaded === false || store.staking.allAccountsLoaded == null) && store.staking.accountsAreLoading === true ? "spin disabled" : "";
    refresh = function(){
      store.errors.fetchAccounts = null;
      store.errors.fetchValidators = null;
      if (store.staking.allAccountsLoaded !== true) {
        return;
      }
      store.staking.getAccountsFromCashe = false;
      return navigate(store, web3t, "validators");
    };
    perPage = store.staking.accounts_per_page;
    page = store.staking.current_accounts_page;
    _index = 1 + (page - 1) * perPage;
    build = function(store, web3t){
      return function(item){
        var index, account, lamports, address, key, rent, seed, status, validator, activationEpoch, deactivationEpoch, active_stake, lockupUnixTimestamp, inactive_stake, balance, balanceRaw, highlight, activeBalanceIsZero, maxEpoch, isActivating, hasValidator, $status, vlx, wallet, walletValidator, undelegate, choose, removeStakeAcc, withdraw, now, lockedAndCanWithdraw, notLocked, canDelegate, $button, disabled, icon, highlighted, children;
        index = _index++;
        if (item == null || item.key == null) {
          return null;
        }
        account = item.account, lamports = item.lamports, address = item.address, key = item.key, rent = item.rent, seed = item.seed, status = item.status, validator = item.validator, activationEpoch = item.activationEpoch, deactivationEpoch = item.deactivationEpoch, active_stake = item.active_stake, lockupUnixTimestamp = item.lockupUnixTimestamp, inactive_stake = item.inactive_stake;
        balance = rent != null ? div(times(Math.round(div(minus(lamports, rent), Math.pow(10, 9))), 100), 100) : "-";
        balanceRaw = rent != null ? minus(lamports, rent) : lamports;
        highlight = item.highlight;
        activeBalanceIsZero = +active_stake === 0;
        maxEpoch = web3t.velas.NativeStaking.max_epoch;
        isActivating = activeBalanceIsZero && validator != null;
        hasValidator = (item.validator != null && item.validator !== '') && (activationEpoch != null && deactivationEpoch != null) && activationEpoch !== deactivationEpoch;
        $status = (function(){
          switch (false) {
          case !(item.status === "inactive" && !hasValidator):
            return "Not Delegated";
          case !(item.status === "inactive" && hasValidator):
            return "Delegated (Inactive)";
          default:
            return status;
          }
        }());
        vlx = find(function(it){
          return it.coin.token === 'vlx_native';
        })(
        store.current.account.wallets);
        if (vlx == null) {
          return null;
        }
        wallet = {
          address: item.address,
          network: vlx.network,
          coin: vlx.coin
        };
        walletValidator = {
          address: validator,
          network: vlx.network,
          coin: vlx.coin
        };
        undelegate = function(){
          var undelegateAmount;
          undelegateAmount = item.balance;
          return confirm(store, lang.areYouSureToUndelegate + (" " + undelegateAmount + " VLX \nfrom " + item.validator + " ?"), function(agree){
            if (agree === false) {
              return;
            }
            return asCallback(web3t.velas.NativeStaking.undelegate(item.address), function(err, result){
              if (err != null) {
                console.error("Undelegate error: ", err);
              }
              if (err != null) {
                return alert(store, err.toString());
              }
              return notify(store, lang.fundsUndelegated, function(){
                store.staking.getAccountsFromCashe = false;
                if (store.staking.webSocketAvailable === false) {
                  return navigate(store, web3t, 'validators');
                }
              });
            });
          });
        };
        choose = function(){
          store.staking.chosenAccount = item;
          navigate(store, web3t, 'poolchoosing');
          return cb(null);
        };
        removeStakeAcc = function(public_key){
          var index, accountIndex, index2, ref$;
          index = findIndex(function(it){
            return it.pubkey === public_key;
          })(
          store.staking.accounts);
          if (index > -1) {
            store.staking.accounts.splice(index, 1);
          }
          accountIndex = store.current.accountIndex;
          index2 = findIndex(function(it){
            return it.pubkey === public_key;
          })(
          (ref$ = store.staking.accountsCached[accountIndex]) != null
            ? ref$
            : []);
          if (index2 > -1) {
            return ((ref$ = store.staking.accountsCached[accountIndex]) != null
              ? ref$
              : []).splice(index2, 1);
          }
        };
        withdraw = function(){
          if ((deactivationEpoch != null && activationEpoch != null) && +deactivationEpoch >= +store.staking.currentEpoch) {
            return;
          }
          return confirm(store, lang.areYouSureToWithdraw, function(agree){
            var balanceRaw, rent, address, account, pubkey, amount;
            if (agree === false) {
              return;
            }
            balanceRaw = item.balanceRaw, rent = item.rent, address = item.address, account = item.account, pubkey = item.pubkey;
            amount = plus(lamports, rent);
            return asCallback(web3t.velas.NativeStaking.withdraw(address, amount), function(err, result){
              var errMessage;
              errMessage = getErrorMessage(err, result);
              if (errMessage != null) {
                return alert(store, errMessage);
              }
              return setTimeout(function(){
                return notify(store, lang.fundsWithdrawn, function(){
                  store.staking.getAccountsFromCashe = false;
                  store.current.page = 'validators';
                  return removeStakeAcc(pubkey);
                });
              }, 1000);
            });
          });
        };
        now = moment().unix();
        lockedAndCanWithdraw = lockupUnixTimestamp != null && lockupUnixTimestamp <= now;
        notLocked = lockupUnixTimestamp == null || +lockupUnixTimestamp === 0 || +lockupUnixTimestamp < now;
        canDelegate = (function(){
          switch (false) {
          case !hasValidator:
            return false;
          default:
            return true;
          }
        }());
        $button = (function(){
          switch (false) {
          case !canDelegate:
            return button({
              classes: "action-delegate",
              store: store,
              text: lang.to_delegate,
              onClick: choose,
              type: 'secondary',
              icon: 'arrowRight'
            });
          case !((notLocked || lockedAndCanWithdraw) && +deactivationEpoch !== +maxEpoch && +store.staking.currentEpoch >= +deactivationEpoch):
            disabled = (function(){
              switch (false) {
              case !((deactivationEpoch != null && activationEpoch != null) && +deactivationEpoch >= +store.staking.currentEpoch):
                return true;
              default:
                return false;
              }
            }());
            return button({
              classes: "action-withdraw",
              store: store,
              text: lang.withdraw,
              onClick: withdraw,
              type: 'secondary',
              icon: 'arrowLeft',
              makeDisabled: disabled
            });
          default:
            disabled = item.status === 'deactivating';
            icon = (function(){
              switch (false) {
              case !notLocked:
                return 'arrowLeft';
              default:
                return 'lock';
              }
            }());
            if (activationEpoch != null && deactivationEpoch != null && !deepEq$(activationEpoch, deactivationEpoch, '===')) {
              if (+activationEpoch < +deactivationEpoch && +deactivationEpoch !== +maxEpoch) {
                disabled = true;
              }
            }
            return button({
              store: store,
              classes: "action-undelegate",
              text: lang.to_undelegate,
              onClick: undelegate,
              type: 'secondary',
              icon: icon,
              makeDisabled: disabled
            });
          }
        }());
        highlighted = highlight === true ? "highlight" : "";
        return react.createElement('tr', {
          key: address + "",
          className: "stake-account-item " + item.status + " " + highlighted
        }, children = [
          react.createElement('td', {}, children = react.createElement('span', {
            className: item.status + " circle"
          }, ' ' + index)), react.createElement('td', {
            datacolumn: 'Staker Address',
            title: address + ""
          }, children = addressHolderPopup({
            store: store,
            wallet: wallet,
            item: item
          })), react.createElement('td', {}, ' ' + balance), react.createElement('td', {
            title: validator + "",
            className: "validator-address"
          }, children = hasValidator ? addressHolderPopup({
            store: store,
            wallet: walletValidator,
            item: item
          }) : "---"), react.createElement('td', {}, children = react.createElement('div', {
            className: 'seed'
          }, ' ' + seed)), false ? react.createElement('td', {
            className: "account-status " + status
          }, ' ' + $status) : void 8, react.createElement('td', {}, children = $button)
        ]);
      };
    };
    cancel = function(){
      store.stakingAccounts.chosenLockup = null;
      return store.stakingAccounts.add.addValidatorStake = 0;
    };
    iconStyle = {
      color: style.app.loader,
      marginTop: "10px",
      width: "inherit"
    };
    stakerPoolStyle = {
      maxWidth: 200,
      background: style.app.stats
    };
    stats = {
      background: style.app.stats
    };
    notificationBorder = {
      border: "1px solid orange",
      padding: 5,
      borderRadius: 5,
      width: "auto",
      margin: "10px 20px 0"
    };
    blockStyle = {
      display: "block"
    };
    createStakingAccount = function(){
      var cb, buffer;
      cb = console.log;
      buffer = {};
      return prompt2(store, lang.howMuchToDeposit, function(amount){
        var min_stake, main_balance, txFee, rest;
        if (amount == null) {
          return;
        }
        if (amount + "".trim().length === 0) {
          return;
        }
        buffer.amount = amount;
        createStakingAccount.InProcess = true;
        store.staking.creatingStakingAccount = true;
        min_stake = web3t.velas.NativeStaking.min_stake;
        main_balance = getBalance();
        txFee = div(5000, Math.pow(10, 9));
        rest = 0.1;
        if (+minus(main_balance, amount) <= 0) {
          amount = minus(amount, plus(plus(store.staking.rent, txFee), rest));
        }
        if (+min_stake > +main_balance) {
          store.staking.creatingStakingAccount = false;
          createStakingAccount.InProcess = false;
          return alert(store, lang.balanceIsNotEnoughToCreateStakingAccount);
        }
        if (+min_stake > +amount) {
          store.staking.creatingStakingAccount = false;
          createStakingAccount.InProcess = false;
          return alert(store, lang.minimalStakeMustBe + (" " + min_stake + " VLX"));
        }
        if (+main_balance < +amount) {
          store.staking.creatingStakingAccount = false;
          createStakingAccount.InProcess = false;
          return alert(store, lang.balanceIsNotEnoughToSpend + (" " + amount + " VLX"));
        }
        amount = buffer.amount * Math.pow(10, 9);
        return asCallback(web3t.velas.NativeStaking.createAccount(amount), function(err, result){
          var ref$, errorMsg, signature;
          if (err != null) {
            createStakingAccount.InProcess = false;
            store.staking.creatingStakingAccount = false;
            if (((ref$ = err.toString()) != null ? ref$ : "").indexOf("custom program error: 0x1") > -1) {
              err = lang.balanceIsNotEnoughToCreateStakingAccount;
            }
            return alert(store, err.toString());
          }
          if (result.error != null) {
            createStakingAccount.InProcess = false;
            store.staking.creatingStakingAccount = false;
            errorMsg = (ref$ = result.description) != null ? ref$ : "An unexpected error occurred during account creation.";
            return alert(store, errorMsg, cb);
          }
          signature = result;
          return creationAccountSubscribe({
            store: store,
            web3t: web3t,
            signature: signature,
            acc_type: "create",
            inProcess: createStakingAccount.InProcess
          }, function(err){
            if (err != null) {
              console.log("creation-account-subscribe err");
              createStakingAccount.InProcess = false;
              store.staking.creatingStakingAccount = false;
              return alert(store, err, cb);
            }
            createStakingAccount.InProcess = false;
            store.staking.creatingStakingAccount = false;
            if (store.staking.webSocketAvailable === false) {
              return notify(store, lang.accountCreatedAndFundsDeposited, function(){});
            }
          });
        });
      });
    };
    totalOwnStakingAccounts = (ref$ = store.staking.totalOwnStakingAccounts) != null ? ref$ : 0;
    loadingAccountIndex = Math.min(totalOwnStakingAccounts, store.staking.loadingAccountIndex);
    perPage = store.staking.accounts_per_page;
    page = store.staking.current_accounts_page;
    paginationDisabled = store.staking.accountsAreLoading === true;
    fetchErrorOccurred = (function(){
      switch (false) {
      case !(store.errors.fetchAccounts != null && store.staking.accountsAreLoading === false):
        return true;
      default:
        return false;
      }
    }());
    svgIcon = react.createElement('svg', {
      width: '15px',
      height: '15px',
      viewBox: '0 0 15 15',
      version: '1.1',
      xmlns: 'http://www.w3.org/2000/svg'
    }, children = react.createElement('g', {
      xmlns: "http://www.w3.org/2000/svg",
      transform: "matrix(0.026385223 0 0 0.026385223 -0 0.029023906)"
    }, children = react.createElement('g', {
      xmlns: "http://www.w3.org/2000/svg",
      transform: "matrix(0.1 0 -0 -0.1 0 340)"
    }, children = react.createElement('path', {
      xmlns: "http://www.w3.org/2000/svg",
      d: "M1796 2907C 1749 2827 1701 2743 1515 2420C 1407 2230 1275 2001 1222 1910C 1170 1819 1110 1716 1090 1680C 950 1438 891 1334 845 1255C 816 1206 747 1084 690 985C 633 886 554 749 514 680L514 680L441 555L1130 552C 1510 551 2130 551 2508 552L2508 552L3197 555L3102 720C 3050 811 2991 914 2970 950C 2950 986 2856 1150 2761 1315C 2665 1480 2510 1750 2415 1915C 1758 3060 1827 2940 1820 2940C 1817 2940 1806 2925 1796 2907z",
      stroke: "none",
      fill: "rgb(255 215 0)",
      fillRule: "nonzero"
    }))));
    return react.createElement('div', {
      className: 'staking-accounts-content staking-accounts-content711009742'
    }, children = [
      loader({
        loading: store.staking.creatingStakingAccount,
        text: "Creating staking account..."
      }), react.createElement('div', {}, children = react.createElement('div', {
        id: "create-staking-account",
        className: 'form-group'
      }, children = react.createElement('div', {
        className: 'section create-staking-account'
      }, children = [
        react.createElement('div', {
          className: 'title'
        }, children = react.createElement('h3', {}, ' ' + lang.createStakingAccount)), react.createElement('div', {
          className: 'description'
        }, children = [
          store.staking.creatingStakingAccount === true
            ? react.createElement('span', {}, children = button({
              store: store,
              classes: "width-auto",
              text: "Creating...",
              noIcon: true,
              onClick: createStakingAccount,
              makeDisabled: true,
              style: {
                width: 'auto',
                display: 'block'
              }
            }))
            : react.createElement('span', {}, children = button({
              store: store,
              classes: "width-auto",
              text: lang.createAccount,
              noIcon: true,
              onClick: createStakingAccount,
              style: {
                width: 'auto',
                display: 'block'
              }
            })), store.staking.accounts.length === 0
            ? react.createElement('span', {
              style: notificationBorder,
              className: 'notification-entity'
            }, ' Please create a staking account before you stake')
            : react.createElement('span', {
              style: notificationBorder,
              className: 'notification-entity'
            }, ' ' + lang.youCanStakeMore)
        ])
      ]))), react.createElement('div', {}, children = react.createElement('div', {
        id: "staking-accounts",
        className: 'form-group'
      }, children = react.createElement('div', {
        className: 'section'
      }, children = [
        react.createElement('div', {
          className: 'title'
        }, children = [
          react.createElement('h3', {
            className: 'section-title'
          }, ' ' + lang.yourStakingAccounts + ' '), react.createElement('span', {
            className: 'amount'
          }, ' (' + store.staking.accounts.length + ')'), !store.staking.webSocketAvailable || fetchErrorOccurred || (store.errors.fetchValidators != null && store.staking.poolsAreLoading === false) ? react.createElement('div', {}, children = react.createElement('div', {
            onClick: refresh,
            style: iconStyle,
            title: "refresh",
            className: isSpinned + " loader"
          }, children = icon('Sync', 25))) : void 8, fetchErrorOccurred ? react.createElement('div', {
            className: 'pointer-container'
          }, children = [
            svgIcon, react.createElement('div', {
              className: 'shadow-icon'
            })
          ]) : void 8
        ]), react.createElement('div', {
          className: 'description'
        }, children = store.errors.fetchAccounts != null
          ? react.createElement('div', {
            className: 'error'
          }, children = [
            react.createElement('span', {
              className: 'warning-icon'
            }, ' ⚠️'), react.createElement('div', {
              className: 'message'
            }, ' An error occurred during fetching stake accounts. Please try one more time...')
          ])
          : react.createElement('div', {
            className: 'cont'
          }, children = [
            store.staking.accountsAreLoading === false ? react.createElement('div', {
              className: 'table-scroll'
            }, children = react.createElement('table', {}, children = [
              react.createElement('thead', {}, children = react.createElement('tr', {}, children = [
                react.createElement('td', {
                  width: "3%",
                  style: stats
                }, ' #'), react.createElement('td', {
                  width: "40%",
                  style: stakerPoolStyle,
                  title: "Your Staking Account"
                }, ' ' + lang.account + ' (?)'), react.createElement('td', {
                  width: "10%",
                  style: stats,
                  title: "Your Deposited Balance"
                }, ' ' + lang.balance + ' (?)'), react.createElement('td', {
                  width: "30%",
                  style: stats,
                  title: "Where you staked"
                }, ' ' + lang.validator + ' (?)'), react.createElement('td', {
                  width: "7%",
                  style: stats,
                  title: "The ID of your stake. This is made to simplify the search of your stake in validator list"
                }, ' ID (?)'), false ? react.createElement('td', {
                  width: "10%",
                  style: stats,
                  title: "Current staking status. Please notice that you cannot stake / unstake immediately. You need to go through the waiting period. This is made to reduce attacks by staking and unstaking spam."
                }, ' ' + lang.status + ' (?)') : void 8, react.createElement('td', {
                  width: "10%",
                  style: stats
                }, ' ' + ((ref$ = lang.action) != null ? ref$ : "Action"))
              ])), react.createElement('tbody', {}, children = map(build(store, web3t))(
              paginate(sortBy(function(it){
                return it.seedIndex;
              })(
              store.staking.accounts), perPage, page)))
            ])) : void 8, store.staking.accountsAreLoading === false
              ? pagination({
                store: store,
                type: 'accounts',
                disabled: paginationDisabled,
                config: {
                  array: store.staking.accounts
                }
              })
              : react.createElement('div', {
                className: 'table-scroll'
              }, children = react.createElement('span', {
                className: 'entities-loader'
              }, children = react.createElement('span', {
                className: 'inner-section'
              }, children = [
                react.createElement('h3', {
                  className: 'item blink'
                }, ' Loading...'), react.createElement('span', {
                  className: 'item'
                }, '  ' + loadingAccountIndex), react.createElement('span', {
                  className: 'item'
                }, ' of'), react.createElement('span', {
                  className: 'item'
                }, '  ' + totalOwnStakingAccounts)
              ])))
          ]))
      ])))
    ]);
  };
  stakingAccounts = function(arg$){
    var store, web3t, children;
    store = arg$.store, web3t = arg$.web3t;
    return react.createElement('div', {
      className: 'staking-accounts-content staking-accounts-content711009742'
    }, children = stakingAccountsContent(store, web3t));
  };
  stringify = function(value){
    if (value != null) {
      return roundHuman(parseFloat(div(value, Math.pow(10, 18))));
    } else {
      return '..';
    }
  };
  module.exports = stakingAccounts;
  function deepEq$(x, y, type){
    var toString = {}.toString, hasOwnProperty = {}.hasOwnProperty,
        has = function (obj, key) { return hasOwnProperty.call(obj, key); };
    var first = true;
    return eq(x, y, []);
    function eq(a, b, stack) {
      var className, length, size, result, alength, blength, r, key, ref, sizeB;
      if (a == null || b == null) { return a === b; }
      if (a.__placeholder__ || b.__placeholder__) { return true; }
      if (a === b) { return a !== 0 || 1 / a == 1 / b; }
      className = toString.call(a);
      if (toString.call(b) != className) { return false; }
      switch (className) {
        case '[object String]': return a == String(b);
        case '[object Number]':
          return a != +a ? b != +b : (a == 0 ? 1 / a == 1 / b : a == +b);
        case '[object Date]':
        case '[object Boolean]':
          return +a == +b;
        case '[object RegExp]':
          return a.source == b.source &&
                 a.global == b.global &&
                 a.multiline == b.multiline &&
                 a.ignoreCase == b.ignoreCase;
      }
      if (typeof a != 'object' || typeof b != 'object') { return false; }
      length = stack.length;
      while (length--) { if (stack[length] == a) { return true; } }
      stack.push(a);
      size = 0;
      result = true;
      if (className == '[object Array]') {
        alength = a.length;
        blength = b.length;
        if (first) {
          switch (type) {
          case '===': result = alength === blength; break;
          case '<==': result = alength <= blength; break;
          case '<<=': result = alength < blength; break;
          }
          size = alength;
          first = false;
        } else {
          result = alength === blength;
          size = alength;
        }
        if (result) {
          while (size--) {
            if (!(result = size in a == size in b && eq(a[size], b[size], stack))){ break; }
          }
        }
      } else {
        if ('constructor' in a != 'constructor' in b || a.constructor != b.constructor) {
          return false;
        }
        for (key in a) {
          if (has(a, key)) {
            size++;
            if (!(result = has(b, key) && eq(a[key], b[key], stack))) { break; }
          }
        }
        if (result) {
          sizeB = 0;
          for (key in b) {
            if (has(b, key)) { ++sizeB; }
          }
          if (first) {
            if (type === '<<=') {
              result = size < sizeB;
            } else if (type === '<==') {
              result = size <= sizeB
            } else {
              result = size === sizeB;
            }
          } else {
            first = false;
            result = size === sizeB;
          }
        }
      }
      stack.pop();
      return result;
    }
  }
}).call(this);