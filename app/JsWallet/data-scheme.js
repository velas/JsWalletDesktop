// Generated by LiveScript 1.6.0
(function(){
  var ref$, map, pairsToObj, seedmem, location, langs, icons, getDevice, getSize, version, qs, localStorage, savedSeed, createSend, urlParams, urlHashParams, store;
  ref$ = require('prelude-ls'), map = ref$.map, pairsToObj = ref$.pairsToObj;
  seedmem = require('./seed.ls');
  location = require('./browser/location.ls');
  langs = require('./langs/langs.json');
  icons = require('./icons.ls');
  getDevice = require('./get-device.ls');
  getSize = require('./get-size.ls');
  version = require('./package.json').version;
  qs = require('qs');
  localStorage = require('localStorage');
  savedSeed = seedmem.saved();
  createSend = function(){
    return {
      id: "",
      to: "",
      details: true,
      proposeEscrow: false,
      address: '',
      value: '0',
      feeType: 'auto',
      feeCustomAmount: '0',
      txType: 'regular',
      amountSend: '0',
      amountCharged: '0',
      amountChargedUsd: '0',
      amountSendUsd: '0',
      amountSendEur: '0',
      amountSendFee: '0',
      amountSendFeeUsd: '0',
      amountObtain: '0',
      data: "",
      decodedData: "",
      showDataMode: 'encoded',
      error: '',
      amountSendFeeOptions: {
        cheap: 0,
        auto: 0
      }
    };
  };
  urlParams = (function(){
    switch (false) {
    case typeof window == 'undefined' || window === null:
      return qs.parse(window.location.search.replace('?', ''));
    default:
      return {};
    }
  }());
  urlHashParams = (function(){
    switch (false) {
    case typeof window == 'undefined' || window === null:
      return qs.parse(window.location.hash.replace('#', ''));
    default:
      return {};
    }
  }());
  store = {
    urlParams: urlParams,
    urlHashParams: urlHashParams,
    root: null,
    theme: (ref$ = localStorage.getItem('theme')) != null ? ref$ : 'velas',
    lang: 'en',
    langs: langs,
    icons: 'icons',
    registry: [],
    terms: "Loading...",
    terms2: "Loading...",
    collapse: "",
    development: {
      proposals: [],
      newProposal: {
        description: "",
        url: "",
        opened: false,
        progress: '0',
        updateProgress: null
      }
    },
    preference: {
      settingsVisible: true,
      invoiceVisible: true,
      usernameVisible: false,
      refreshVisible: true,
      lockVisible: true
    },
    tor: {
      enabled: false,
      real: {
        ip: "n/a",
        country: "n/a"
      },
      proxy: {
        ip: "n/a",
        country: "n/a"
      }
    },
    walletTab: {
      tab: 0
    },
    search: {
      tab: "dapps"
    },
    video: {
      tab: "home",
      menuOpen: false,
      drag: false,
      uploadLink: false,
      action: "upload",
      uploadingFiles: []
    },
    sound: {
      tab: "home",
      menuOpen: false,
      drag: false
    },
    notice: {
      search: false
    },
    faq: {
      tab: "item",
      answer: "",
      answer2: ""
    },
    dashboard: {
      epochPercent: "..",
      epochNext: '..',
      currentBlock: '..',
      epoch: '..'
    },
    peerinfo: {
      peers: []
    },
    interop: {
      isAddressQueried: false,
      origin: false
    },
    staking: {
      rewardInfo: [],
      exitTab: '',
      maxWithdrawOrderAllowed: 0,
      withdrawAmount: 0,
      maxWithdrawAllowed: 0,
      orderedWithdrawAmount: 0,
      add: {
        addValidator: "",
        addValidatorStake: "",
        result: "",
        newAddress: "",
        moveStake: 0
      },
      validators: {
        pending: [],
        active: []
      },
      reward: null,
      rewardClaim: 0,
      rewards: [],
      keystore: {
        staking: {
          keystore: ""
        },
        mining: {
          keystore: ""
        }
      },
      dataGeneration: 1,
      tab: "line",
      pools: [],
      chosenPool: null,
      stakeAmountTotal: 0,
      maxWithdraw: 0,
      delegators: 0,
      rewardLoading: false,
      waitForEpochChange: false
    },
    filestore: {
      menuOpen: false,
      fileTree: false,
      extensionIcons: {
        txt: "data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBpZD0iRmxhdCIgaGVpZ2h0PSI1MTJweCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTJweCI+PHBhdGggZD0ibTM5MiA0ODhoLTI3MmE0OCA0OCAwIDAgMSAtNDgtNDh2LTM2OGE0OCA0OCAwIDAgMSA0OC00OGgyMjRsOTYgOTZ2MzIwYTQ4IDQ4IDAgMCAxIC00OCA0OHoiIGZpbGw9IiNjZmQyZmMiLz48cGF0aCBkPSJtNzIgMzYwaDM2OGEwIDAgMCAwIDEgMCAwdjgwYTQ4IDQ4IDAgMCAxIC00OCA0OGgtMjcyYTQ4IDQ4IDAgMCAxIC00OC00OHYtODBhMCAwIDAgMCAxIDAgMHoiIGZpbGw9IiM1MTUzZmYiLz48ZyBmaWxsPSIjODY5MGZhIj48cGF0aCBkPSJtNDQwIDEyMGgtNDhhNDggNDggMCAwIDEgLTQ4LTQ4di00OHoiLz48cGF0aCBkPSJtMzc2IDE3NmgtMTc2YTggOCAwIDAgMSAwLTE2aDE3NmE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMjgwIDIwOGgtMTQ0YTggOCAwIDAgMSAwLTE2aDE0NGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMzc2IDI0MGgtMTI4YTggOCAwIDAgMSAwLTE2aDEyOGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMzIwIDI3MmgtMTg0YTggOCAwIDAgMSAwLTE2aDE4NGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMTY4IDE3NmgtMzJhOCA4IDAgMCAxIDAtMTZoMzJhOCA4IDAgMCAxIDAgMTZ6Ii8+PHBhdGggZD0ibTM3NiAyMDhoLTY0YTggOCAwIDAgMSAwLTE2aDY0YTggOCAwIDAgMSAwIDE2eiIvPjxwYXRoIGQ9Im0yMTYgMjQwaC04MGE4IDggMCAwIDEgMC0xNmg4MGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMzc2IDI3MmgtMjRhOCA4IDAgMCAxIDAtMTZoMjRhOCA4IDAgMCAxIDAgMTZ6Ii8+PHBhdGggZD0ibTE4NCAzMDRoLTQ4YTggOCAwIDAgMSAwLTE2aDQ4YTggOCAwIDAgMSAwIDE2eiIvPjxwYXRoIGQ9Im0yMTYgMTQ0aC04MGE4IDggMCAwIDEgMC0xNmg4MGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMjk2IDMwNGgtODBhOCA4IDAgMCAxIDAtMTZoODBhOCA4IDAgMCAxIDAgMTZ6Ii8+PHBhdGggZD0ibTM3NiAzMDRoLTQ4YTggOCAwIDAgMSAwLTE2aDQ4YTggOCAwIDAgMSAwIDE2eiIvPjwvZz48cGF0aCBkPSJtMTY4IDM4NGE4IDggMCAwIDAgLTggOHY2NGE4IDggMCAwIDAgOCA4IDQwIDQwIDAgMCAwIDAtODB6bTggNjIuNjI5di00NS4yNThhMjQgMjQgMCAwIDEgMCA0NS4yNTh6IiBmaWxsPSIjZmZmIi8+PHBhdGggZD0ibTI1NiAzODRjLTE3LjY0NSAwLTMyIDE3Ljk0NC0zMiA0MHMxNC4zNTUgNDAgMzIgNDAgMzItMTcuOTQ0IDMyLTQwLTE0LjM1NS00MC0zMi00MHptMCA2NGMtOC42NzMgMC0xNi0xMC45OTEtMTYtMjRzNy4zMjctMjQgMTYtMjQgMTYgMTAuOTkxIDE2IDI0LTcuMzI3IDI0LTE2IDI0eiIgZmlsbD0iI2ZmZiIvPjxwYXRoIGQ9Im0zMzYgNDAwYTEwLjcwOCAxMC43MDggMCAwIDEgNC41OSAxLjA1OCA4IDggMCAxIDAgNi44Mi0xNC40NzQgMjYuNTgxIDI2LjU4MSAwIDAgMCAtMTEuNDEtMi41ODRjLTE3LjY0NSAwLTMyIDE3Ljk0NC0zMiA0MHMxNC4zNTUgNDAgMzIgNDBhMjYuNiAyNi42IDAgMCAwIDExLjQxMS0yLjU4NCA4IDggMCAwIDAgLTYuODIyLTE0LjQ3MyAxMC43MSAxMC43MSAwIDAgMSAtNC41ODkgMS4wNTdjLTguNjczIDAtMTYtMTAuOTkxLTE2LTI0czcuMzI3LTI0IDE2LTI0eiIgZmlsbD0iI2ZmZiIvPjwvc3ZnPgo=",
        xls: "",
        unknown: ""
      },
      path: "/",
      structure: [
        {
          type: 'dir',
          name: 'some dir'
        }, {
          type: 'dir',
          name: 'some dir 2'
        }, {
          type: 'dir',
          name: 'some dir 3'
        }, {
          type: 'file',
          name: 'presentation',
          extension: 'pdf'
        }, {
          type: 'file',
          name: 'report',
          extension: 'xls'
        }
      ]
    },
    receive: {
      wallet: null
    },
    menu: {
      active: 's2',
      mobile: false,
      show: false,
      support: 'https://support.velas.com/'
    },
    ask: {
      text: '',
      enabled: false,
      callback: null,
      image: "",
      type: ''
    },
    contractAddress: '',
    contractVlxaddress: '',
    transactions: {
      all: [],
      applied: []
    },
    releases: [],
    current: {
      addressSuffix: '',
      pagePin: null,
      tryCopy: null,
      hoveredAddress: {
        address: null,
        element: null
      },
      verifySeedIndex: 0,
      verifySeed: "",
      verifySeedError: false,
      device: getDevice(),
      size: getSize(),
      list: 0,
      promptAnswer: "",
      prompt: false,
      step: "first",
      verifySeedIndexes: [],
      switchAccount: false,
      tor: false,
      rate: false,
      view: false,
      hint: true,
      openMenu: false,
      currentEpoch: false,
      switchCurrency: false,
      sendMenuOpen: false,
      langsOpen: false,
      langsOpenSide: false,
      langsOpenStart: false,
      addCoin: false,
      addVlxcoin: false,
      tokenMigration: null,
      chooseLanguage: true,
      banner: false,
      contentMigrate: false,
      acceptMigrate: false,
      active: false,
      dragfile: false,
      files: false,
      progress: false,
      hideBtn: false,
      submenu: false,
      languageMenu: false,
      walletIndex: 0,
      editAccountName: "",
      accountIndex: 1,
      manageAccount: false,
      filterPlugins: "",
      confirmation: null,
      alert: null,
      demo: location.href.indexOf('web3.space/wallet') > -1,
      network: 'mainnet',
      pin: "",
      lastTxUrl: "",
      tryEditSeed: false,
      pinTrial: 0,
      refreshing: false,
      copied: "",
      page: savedSeed ? 'locked' : 'chooseinit',
      sendToMask: "",
      status: 'main',
      nickname: "",
      nicknamefull: 'nickname@domain.com',
      message: "",
      customDomain: false,
      canBuy: false,
      checkingName: false,
      seed: "",
      seedProblem: "",
      seedWords: [],
      seedTemp: "",
      seedGenerated: false,
      savedSeed: savedSeed,
      balanceUsd: '...',
      filter: ['IN', 'OUT'],
      loading: false,
      send: createSend(),
      invoice: createSend(),
      currency: "",
      convert: "usd",
      trxType: "custom",
      allowMiningClaimCall: undefined,
      search: ""
    },
    history: {
      filterOpen: false,
      txDetails: false
    },
    pages: ['wallets'],
    seed: {
      noCopy: false,
      about: false
    },
    rates: {},
    coins: [],
    version: version
  };
  if (window.location.hash === '#util') {
    store.current.page = 'util';
  }
  module.exports = store;
}).call(this);
