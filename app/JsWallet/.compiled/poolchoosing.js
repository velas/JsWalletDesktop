// Generated by LiveScript 1.6.0
(function(){
  var react, reactDom, navigate, getPrimaryInfo, web3, bignumber, getLang, historyFuncs, queryPools, icon, ref$, map, split, filter, find, foldl, sortBy, unique, head, each, div, times, plus, minus, velasNodeTemplate, hdkey, bip39, md5, menuFuncs, btoa, Buffer, copiedInform, copy, round5, ethToVlx, vlxToEth, switchAccount, roundHuman, exitStake, icons, placeholder, claimStake, canMakeStaking, epoch, alert, notify, confirm, button, addressHolderPopup, pagination, alertTxn, amountField, moveStake, seedmem, burger, stakeAccounts, getErrorMessage, cb, asCallback, paginate, toKeystore, showValidator, stakingContent, poolChosing, stringify, out$ = typeof exports != 'undefined' && exports || this;
  react = require('react');
  reactDom = require('react-dom');
  navigate = require('../navigate.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  web3 = require('../web3.ls');
  bignumber = require('bignumber.js');
  getLang = require('../get-lang.ls');
  historyFuncs = require('../history-funcs.ls');
  queryPools = require('../staking/funcs.ls').queryPools;
  icon = require('./icon.ls');
  ref$ = require('prelude-ls'), map = ref$.map, split = ref$.split, filter = ref$.filter, find = ref$.find, foldl = ref$.foldl, sortBy = ref$.sortBy, unique = ref$.unique, head = ref$.head, each = ref$.each;
  ref$ = require('../math.ls'), div = ref$.div, times = ref$.times, plus = ref$.plus, minus = ref$.minus;
  velasNodeTemplate = require('../velas/velas-node-template.ls');
  ref$ = require('../../web3t/providers/deps.js'), hdkey = ref$.hdkey, bip39 = ref$.bip39;
  md5 = require('md5');
  menuFuncs = require('../menu-funcs.ls');
  btoa = require('btoa');
  Buffer = require('safe-buffer').Buffer;
  copiedInform = require('../copied-inform.ls');
  copy = require('../copy.ls');
  round5 = require('../round5.ls');
  ref$ = require('../../web3t/addresses.js'), ethToVlx = ref$.ethToVlx, vlxToEth = ref$.vlxToEth;
  switchAccount = require('./switch-account.ls');
  roundHuman = require('../round-human.ls');
  exitStake = require('./exit-stake.ls');
  icons = require('../icons.ls');
  placeholder = require('./placeholder.ls');
  claimStake = require('./claim-stake.ls');
  canMakeStaking = require('../staking/can-make-staking.ls');
  epoch = require('./epoch.ls');
  ref$ = require('./confirmation.ls'), alert = ref$.alert, notify = ref$.notify, confirm = ref$.confirm;
  button = require('../components/button.ls');
  addressHolderPopup = require('../components/address-holder-popup.ls');
  pagination = require('../components/pagination.ls');
  alertTxn = require('./alert-txn.ls');
  amountField = require('../components/amount-field.ls');
  moveStake = require('./move-stake.ls');
  seedmem = require('../seed.ls');
  burger = require('../components/burger.ls');
  stakeAccounts = require('./stake/accounts.ls');
  getErrorMessage = require('./stake/error-funcs.ls').getErrorMessage;
  cb = console.log;
  asCallback = function(p, cb){
    p['catch'](function(err){
      return cb(err);
    });
    return p.then(function(data){
      return cb(null, data);
    });
  };
  out$.paginate = paginate = function(array, perPage, page){
    page = page - 1;
    return array.slice(page * perPage, (page + 1) * perPage);
  };
  toKeystore = function(store, withKeystore){
    var mnemonic, seed, wallet, index, password, staking, mining;
    mnemonic = seedmem.mnemonic;
    seed = bip39.mnemonicToSeed(mnemonic);
    wallet = hdkey.fromMasterSeed(seed);
    index = store.current.accountIndex;
    password = md5(wallet.derivePath("m1").deriveChild(index).getWallet().getAddress().toString('hex'));
    staking = (function(){
      switch (false) {
      case store.urlParams.anotheracc == null:
        return {
          address: window.toEthAddress(store.urlParams.anotheracc)
        };
      default:
        return getPair(wallet, 'm0', index, password, false);
      }
    }());
    mining = getPair(wallet, 'm0/2', index, password, withKeystore);
    return {
      staking: staking,
      mining: mining,
      password: password
    };
  };
  showValidator = function(store, web3t){
    return function(validator){
      return react.createElement('li', {
        key: "show-validator-" + validator
      }, ' ' + validator);
    };
  };
  stakingContent = function(store, web3t){
    var goBack, style, lang, buttonPrimary3Style, filterIcon, commingSoon, pairs, iStakeChoosenPool, delegate, changeAddress, changeStake, velasNodeAppliedTemplate, velasNodeAppliedTemplateLine, showScript, ref$, accountLeft, accountRight, changeAccountIndex, updateCurrent, accountLeftProxy, accountRightProxy, changeAccountIndexProxy, lineStyle, activate, activateLine, activateString, activateSsh, activateDo, activeClass, activeLine, activeString, activeSsh, activeDo, getBalance, getOptions, useMin, useMax, voteForChange, yourBalance, yourStakingAmount, yourStaking, vlxToken, isSpinned, buildStaker, activateFirst, activateSecond, activateThird, activeFirst, activeSecond, activeThird, refresh, iconStyle, stakerPoolStyle, stats, totalValidators, allPages, loadingValidatorIndex, perPage, page, paginationDisabled, children;
    goBack = historyFuncs(store, web3t).goBack;
    style = getPrimaryInfo(store);
    lang = getLang(store);
    buttonPrimary3Style = {
      border: "1px solid " + style.app.primary3,
      color: style.app.text2,
      background: style.app.primary3,
      backgroundColor: style.app.primary3Spare
    };
    filterIcon = {
      filter: style.app.filterIcon
    };
    commingSoon = {
      opacity: ".3"
    };
    pairs = store.staking.keystore;
    iStakeChoosenPool = function(){
      var pool, myStake;
      pool = store.staking.chosenPool;
      myStake = +pool.myStake;
      return myStake >= 10000;
    };
    delegate = function(){
      var wallet, account, pool, payAccount;
      wallet = find(function(it){
        return it.coin.token === 'vlx_native';
      })(
      store.current.account.wallets);
      if (wallet == null) {
        return null;
      }
      if (store.staking.chosenPool == null) {
        return alert(store, "please choose the pool", cb);
      }
      account = store.staking.chosenAccount;
      pool = store.staking.chosenPool;
      payAccount = find(function(it){
        return it.address === account.address;
      })(
      store.staking.accounts);
      if (!payAccount) {
        return cb(null);
      }
      return asCallback(web3t.velas.NativeStaking.delegate(payAccount.address, pool.address), function(err, result){
        var errMessage;
        errMessage = getErrorMessage(err, result);
        if (errMessage != null) {
          return alert(store, errMessage);
        }
        store.staking.getAccountsFromCashe = false;
        return notify(store, "Funds delegated to\n " + store.staking.chosenPool.address, function(){
          if (store.staking.webSocketAvailable === false) {
            store.staking.getAccountsFromCashe = false;
            return navigate(store, web3t, 'validators');
          }
          return store.current.page = 'validators';
        });
      });
    };
    changeAddress = function(it){
      return store.staking.add.addValidator = it.target.value;
    };
    changeStake = function(it){
      var value, err;
      try {
        value = new bignumber(it.target.value).toFixed().toString();
        store.staking.add.addValidatorStake = value;
      } catch (e$) {
        err = e$;
        console.log("[Change-stake]: " + err);
      }
    };
    velasNodeAppliedTemplate = split("\n")(
    velasNodeTemplate(
    pairs));
    velasNodeAppliedTemplateLine = function(it){
      return "echo '" + it + "' | base64 --decode | sh";
    }(
    btoa(
    velasNodeTemplate(
    pairs)));
    if (pairs.mining == null) {
      return null;
    }
    showScript = function(){
      return store.staking.keystore = toKeystore(store, true);
    };
    ref$ = menuFuncs(store, web3t), accountLeft = ref$.accountLeft, accountRight = ref$.accountRight, changeAccountIndex = ref$.changeAccountIndex;
    updateCurrent = function(func){
      return function(data){
        func(data);
        return staking.init({
          store: store,
          web3t: web3t
        }, function(){
          return store.staking.keystore = toKeystore(store, false);
        });
      };
    };
    accountLeftProxy = updateCurrent(accountLeft);
    accountRightProxy = updateCurrent(accountRight);
    changeAccountIndexProxy = updateCurrent(changeAccountIndex);
    lineStyle = {
      padding: "10px",
      width: '100%'
    };
    activate = function(tab){
      return function(){
        return store.staking.tab = tab;
      };
    };
    activateLine = activate('line');
    activateString = activate('string');
    activateSsh = activate('ssh');
    activateDo = activate('do');
    activeClass = function(tab){
      if (store.staking.tab === tab) {
        return 'active';
      } else {
        return '';
      }
    };
    activeLine = activeClass('line');
    activeString = activeClass('string');
    activeSsh = activeClass('ssh');
    activeDo = activeClass('do');
    getBalance = function(){
      var wallet;
      wallet = find(function(it){
        return it.coin.token === 'vlx2';
      })(
      store.current.account.wallets);
      return wallet.balance;
    };
    getOptions = function(cb){
      var iAmStaker;
      iAmStaker = iStakeChoosenPool();
      if (iAmStaker) {
        return cb(null);
      }
      return web3t.velas.Staking.candidateMinStake(function(err, data){
        var min, balance, stake, max;
        if (err != null) {
          return cb(err);
        }
        min = (function(){
          switch (false) {
          case !(+store.staking.stakeAmountTotal >= 10000):
            return 1;
          default:
            return div(data, Math.pow(10, 18));
          }
        }());
        balance = minus(getBalance(), 0.1);
        stake = store.staking.add.addValidatorStake;
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
      return store.staking.add.addValidatorStake = 10000;
    };
    useMax = function(){
      return store.staking.add.addValidatorStake = Math.max(minus(getBalance(), 0.1), 0);
    };
    voteForChange = function(){
      return web3t.velas.ValidatorSet.emitInitiateChangeCallable(function(err, can){
        var data, to, amount;
        if (err != null) {
          return alert(store, err, cb);
        }
        if (can !== true) {
          return alert(store, lang.actionProhibited, cb);
        }
        data = web3t.velas.ValidatorSet.emitInitiateChange.getData();
        to = web3t.velas.ValidatorSet.address;
        amount = 0;
        return web3t.vlx2.sendTransaction({
          to: to,
          data: data,
          amount: amount
        }, function(err){
          return store.current.page = 'staking';
        });
      });
    };
    yourBalance = " " + store.staking.chosenAccount.balance + " ";
    yourStakingAmount = div(store.staking.stakeAmountTotal, Math.pow(10, 18));
    yourStaking = " " + roundHuman(yourStakingAmount);
    vlxToken = "VLX";
    isSpinned = (store.staking.allPoolsLoaded === false || store.staking.allPoolsLoaded == null) && store.staking.poolsAreLoading === true ? "spin disabled" : "";
    buildStaker = function(store, web3t){
      return function(item){
        var checked, stake, myStake, fee, buildMyStake, index, choosePull, cancelPool, toEth, reward, filled, filledColor, vlx_native, wallet, votePower, mystakeClass, chosen, config, children;
        checked = item.checked;
        stake = item.stake;
        myStake = (function(){
          switch (false) {
          case +item.myStake.length !== 0:
            return [];
          default:
            return item.myStake;
          }
        }());
        fee = item.commission;
        buildMyStake = function(stake){
          var showDetails, children;
          showDetails = function(){
            var account;
            account = find(function(it){
              return it.seed === stake.seed;
            })(
            store.staking.accounts);
            if (account == null) {
              return null;
            }
            store.staking.chosenAccount = account;
            return navigate(store, web3t, 'account_details');
          };
          return react.createElement('div', {
            onClick: showDetails,
            className: "stake-item"
          }, children = react.createElement('div', {
            className: 'name'
          }, children = react.createElement('span', {}, ' ' + stake.seed)));
        };
        index = store.staking.pools.indexOf(item) + 1;
        choosePull = function(){
          var page, cb, delegateAmount, delegateReceiver, confirmText;
          page = 'choosestaker';
          cb = function(err, data){
            if (err != null) {
              return alert(store, err, bind$(console, 'log'));
            }
          };
          map(function(it){
            return it.checked = false;
          })(
          store.staking.pools);
          item.checked = true;
          store.staking.chosenPool = item;
          store.staking.add.newAddress = "";
          store.staking.error = "";
          delegateAmount = yourBalance;
          delegateReceiver = store.staking.chosenPool.address;
          confirmText = "Please confirm that you would like to delegate " + delegateAmount + " VLX to " + delegateReceiver;
          return confirm(store, confirmText, function(agree){
            if (agree === false) {
              return;
            }
            return delegate();
          });
        };
        cancelPool = function(){
          return store.staking.chosenPool = null;
        };
        toEth = function(){
          return item.eth = !item.eth;
        };
        reward = (function(){
          switch (false) {
          case item.validatorRewardPercent !== "..":
            return "..";
          default:
            return (100 - +item.validatorRewardPercent) * 1.4285714286;
          }
        }());
        filled = roundHuman(reward) + "%";
        filledColor = {
          color: (function(){
            switch (false) {
            case !(reward > 95):
              return 'red';
            case !(reward > 75):
              return 'orange';
            case !(reward > 40):
              return "rgb(165, 174, 81)";
            default:
              return "rgb(38, 219, 85)";
            }
          }())
        };
        vlx_native = find(function(it){
          return it.coin.token === 'vlx_native';
        })(
        store.current.account.wallets);
        if (vlx_native == null) {
          return;
        }
        wallet = {
          address: item.address,
          network: vlx_native.network,
          coin: vlx_native.coin
        };
        votePower = (function(){
          switch (false) {
          case item.votePower == null:
            return item.votePower + "%";
          default:
            return "...";
          }
        }());
        mystakeClass = +myStake > 0 ? "with-stake" : "";
        chosen = store.staking.chosenPool != null && store.staking.chosenPool.address === item.address ? "chosen" : "";
        config = {
          decimals: 2
        };
        return react.createElement('tr', {
          className: item.status + " " + chosen
        }, children = [
          react.createElement('td', {
            datacolumn: 'Staker Address',
            title: item.address + ""
          }, children = addressHolderPopup({
            store: store,
            wallet: wallet
          })), react.createElement('td', {}, ' ' + roundHuman(stake, config)), react.createElement('td', {}, ' ' + fee + '%'), react.createElement('td', {
            className: mystakeClass + ""
          }, children = map(buildMyStake)(
          myStake)), react.createElement('td', {}, ' ' + item.stakers), react.createElement('td', {}, children = button({
            store: store,
            onClick: choosePull,
            type: 'secondary',
            icon: 'arrowRight'
          }))
        ]);
      };
    };
    activate = function(step){
      return function(){
        return store.current.step = step;
      };
    };
    activateFirst = activate('first');
    activateSecond = activate('second');
    activateThird = activate('third');
    activeClass = function(step){
      if (store.current.step === step) {
        return 'active';
      } else {
        return '';
      }
    };
    activeFirst = activeClass('first');
    activeSecond = activeClass('second');
    activeThird = activeClass('third');
    refresh = function(){
      var cb;
      store.staking.allPoolsLoaded = false;
      if ((store.staking.allPoolsLoaded === false || store.staking.allPoolsLoaded == null) && store.staking.poolsAreLoading === true) {
        return false;
      }
      store.staking.poolsAreLoading = true;
      cb = console.log;
      return staking.init({
        store: store,
        web3t: web3t
      }, function(err){
        if (err != null) {
          return cb(err);
        }
        return cb(null, 'done');
      });
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
    totalValidators = (ref$ = store.staking.totalValidators) != null ? ref$ : 0;
    allPages = Math.ceil(div(totalValidators, store.staking.validators_per_page));
    loadingValidatorIndex = store.staking.loadingValidatorIndex;
    perPage = store.staking.validators_per_page;
    page = store.staking.current_validators_page;
    paginationDisabled = store.staking.poolsAreLoading === true;
    return react.createElement('div', {
      className: 'staking-content delegate'
    }, children = [
      react.createElement('div', {
        className: 'main-sections'
      }, children = react.createElement('div', {
        id: "pools",
        className: "select-validators-list form-group"
      }, children = [
        alertTxn({
          store: store
        }), react.createElement('div', {
          className: 'section'
        }, children = [
          react.createElement('div', {
            className: 'title'
          }, children = [
            react.createElement('h3', {}, ' ' + lang.pleaseSelectValidator), react.createElement('div', {}, children = false ? react.createElement('div', {
              onClick: refresh,
              style: iconStyle,
              title: "refresh",
              className: isSpinned + " loader"
            }, children = icon('Sync', 25)) : void 8)
          ]), react.createElement('div', {
            className: 'description'
          }, children = [
            react.createElement('div', {
              className: 'table-scroll'
            }, children = react.createElement('table', {}, children = [
              react.createElement('thead', {}, children = react.createElement('tr', {}, children = [
                react.createElement('td', {
                  width: "30%",
                  style: stakerPoolStyle,
                  title: "Validator Staking Address. Permanent"
                }, ' ' + lang.validator + ' (?)'), react.createElement('td', {
                  width: "15%",
                  style: stats,
                  title: "Sum of all stakings"
                }, ' ' + lang.totalStake + ' (?)'), react.createElement('td', {
                  width: "5%",
                  style: stats,
                  title: "Validator Interest. (100% - Validator Interest = Pool Staking Reward)"
                }, ' ' + lang.comission + ' (?)'), react.createElement('td', {
                  width: "10%",
                  style: stats,
                  title: "Find you staking by Seed"
                }, ' ' + lang.myStake + ' (?)'), react.createElement('td', {
                  width: "5%",
                  style: stats,
                  title: "How many stakers in a pool"
                }, ' ' + lang.stakers + ' (?)'), react.createElement('td', {
                  width: "4%",
                  style: stats
                }, ' ' + lang.select)
              ])), react.createElement('tbody', {}, children = map(buildStaker(store, web3t))(
              paginate(store.staking.pools, perPage, store.staking.current_validators_page)))
            ])), pagination({
              store: store,
              type: 'validators',
              disabled: paginationDisabled,
              config: {
                array: store.staking.pools
              }
            })
          ])
        ])
      ])), false && store.staking.chosenPool != null ? react.createElement('div', {
        id: "choosen-pull",
        className: 'single-section form-group'
      }, children = react.createElement('div', {
        className: 'section'
      }, children = [
        react.createElement('div', {
          className: 'title'
        }, children = react.createElement('h3', {}, ' ' + lang.becomeStaker)), react.createElement('div', {
          className: 'description'
        }, children = [
          react.createElement('div', {
            className: 'left float-left'
          }, children = [
            react.createElement('span', {}, ' ' + lang.to_delegate), react.createElement('span', {
              className: 'color'
            }, ' ' + yourBalance + ' VLX'), react.createElement('span', {}, ' ' + lang.delegate_to), react.createElement('div', {
              title: store.staking.chosenPool.address + "",
              className: 'chosen-pool'
            }, children = react.createElement('span', {}, children = [
              " " + store.staking.chosenPool.address, react.createElement('img', {
                src: icons.imgCheck + "",
                className: 'check'
              })
            ]))
          ]), button({
            store: store,
            classes: typeof classes != 'undefined' && classes !== null ? classes : "float-right",
            onClick: delegate,
            type: 'secondary',
            icon: 'apply',
            text: 'btnApply'
          })
        ])
      ])) : void 8
    ]);
  };
  poolChosing = function(arg$){
    var store, web3t, lang, goBack, gotoSearch, info, style, borderStyle, borderStyle2, borderRight, headerTableStyle, lightText, iconColor, showClass, children;
    store = arg$.store, web3t = arg$.web3t;
    lang = getLang(store);
    goBack = historyFuncs(store, web3t).goBack;
    gotoSearch = function(){
      return navigate(store, web3t, 'search');
    };
    info = getPrimaryInfo(store);
    style = {
      background: info.app.wallet,
      color: info.app.text
    };
    borderStyle = {
      color: info.app.text,
      borderBottom: "1px solid " + info.app.border,
      background: info.app.background,
      backgroundColor: info.app.bgspare
    };
    borderStyle2 = {
      color: info.app.text,
      borderBottom: "1px solid " + info.app.border,
      background: "#4b2888"
    };
    borderRight = {
      color: info.app.text,
      borderRight: "1px solid " + info.app.border
    };
    headerTableStyle = {
      borderBottom: "1px solid " + info.app.border,
      background: info.app.walletLight
    };
    lightText = {
      color: info.app.color3
    };
    iconColor = {
      filter: info.app.iconFilter
    };
    showClass = store.current.openMenu ? 'hide' : "";
    return react.createElement('div', {
      className: 'staking staking1556802966'
    }, children = [
      react.createElement('div', {
        style: borderStyle,
        className: 'title'
      }, children = [
        react.createElement('div', {
          className: showClass + " header"
        }, ' ' + lang.delegateStake), react.createElement('div', {
          onClick: goBack,
          className: 'close'
        }, children = react.createElement('img', {
          src: icons.arrowLeft + "",
          style: iconColor,
          className: 'icon-svg'
        })), burger(store, web3t), epoch(store, web3t), switchAccount(store, web3t)
      ]), stakingContent(store, web3t)
    ]);
  };
  stringify = function(value){
    if (value != null) {
      return roundHuman(parseFloat(div(value, Math.pow(10, 18))));
    } else {
      return '..';
    }
  };
  module.exports = poolChosing;
  function bind$(obj, key, target){
    return function(){ return (target || obj)[key].apply(obj, arguments) };
  }
}).call(this);