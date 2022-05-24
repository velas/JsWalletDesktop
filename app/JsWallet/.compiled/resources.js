// Generated by LiveScript 1.6.0
(function(){
  var react, reactDom, navigate, getPrimaryInfo, CopyToClipboard, copiedInform, copy, web3, getLang, historyFuncs, icon, switchAccount, icons, epoch, alertDemo, burger, resources;
  react = require('react');
  reactDom = require('react-dom');
  navigate = require('../navigate.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  CopyToClipboard = require('react-copy-to-clipboard').CopyToClipboard;
  copiedInform = require('../copied-inform.ls');
  copy = require('../copy.ls');
  web3 = require('../web3.ls');
  getLang = require('../get-lang.ls');
  historyFuncs = require('../history-funcs.ls');
  icon = require('./icon.ls');
  switchAccount = require('./switch-account.ls');
  icons = require('../icons.ls');
  epoch = require('./epoch.ls');
  alertDemo = require('./alert-demo.ls');
  burger = require('../components/burger.ls');
  resources = function(arg$){
    var store, web3t, lang, goBack, gotoSearch, info, action, active, style, borderStyle, resource, resourceHeader, borderRight, buttonPrimary2Style, headerTableStyle, filterBody, borderB, buttonPrimary1Style, filterIcon, addressInput, lightText, expandCollapse, bgCpu, bgGpu, bgSpacing, th, trOdd, trEven, showClass, children;
    store = arg$.store, web3t = arg$.web3t;
    lang = getLang(store);
    goBack = historyFuncs(store, web3t).goBack;
    gotoSearch = function(){
      return navigate(store, web3t, 'search');
    };
    info = getPrimaryInfo(store);
    action = function(){
      return store.current.active = !store.current.active;
    };
    active = store.current.active ? 'active' : "";
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
    resource = {
      color: info.app.text,
      border: "1px solid " + info.app.border,
      background: info.app.header,
      borderRadius: info.app.borderBtn
    };
    resourceHeader = {
      color: info.app.text,
      background: info.app.th
    };
    borderRight = {
      color: info.app.text,
      borderRight: "1px solid " + info.app.border
    };
    buttonPrimary2Style = {
      border: "1px solid " + info.app.primary2,
      color: info.app.text,
      background: info.app.primary2,
      backgroundColor: info.app.primary2Spare
    };
    headerTableStyle = {
      borderBottom: "1px solid " + info.app.border,
      background: info.app.walletLight
    };
    filterBody = {
      border: "1px solid " + info.app.border,
      background: info.app.header
    };
    borderB = {
      borderBottom: "1px solid " + info.app.border
    };
    buttonPrimary1Style = {
      border: "1px solid " + info.app.primary1,
      color: info.app.text,
      background: info.app.primary1,
      backgroundColor: info.app.primary1Spare
    };
    filterIcon = {
      filter: info.app.filterIcon
    };
    addressInput = {
      color: info.app.color3,
      background: info.app.bgPrimaryLight
    };
    lightText = {
      color: info.app.color3
    };
    expandCollapse = function(){
      return store.filestore.menuOpen = !store.filestore.menuOpen;
    };
    bgCpu = {
      background: "url('" + icons.bgCpu + "')"
    };
    bgGpu = {
      background: "url('" + icons.bgGpu + "')"
    };
    bgSpacing = {
      background: "url('" + icons.bgSpacing + "')"
    };
    th = {
      background: info.app.th
    };
    trOdd = {
      background: info.app.trOdd
    };
    trEven = {
      background: info.app.trEven
    };
    showClass = store.current.openMenu ? 'hide' : "";
    return react.createElement('div', {
      className: 'resources resources1489477053'
    }, children = [
      alertDemo(store, web3t), react.createElement('div', {
        style: borderStyle,
        className: 'title'
      }, children = [
        react.createElement('div', {
          className: showClass + " header"
        }, ' Resources Center'), react.createElement('div', {
          onClick: gotoSearch,
          className: 'close'
        }, children = react.createElement('img', {
          src: icons.arrowLeft + "",
          className: 'icon-svg'
        })), burger(store, web3t), epoch(store, web3t), switchAccount(store, web3t)
      ]), react.createElement('div', {
        className: 'container-price'
      }, children = [
        react.createElement('div', {
          className: 'plan'
        }, children = react.createElement('div', {
          style: resource,
          className: 'plan-inner'
        }, children = react.createElement('div', {
          className: 'entry-title cpu'
        }, children = [
          react.createElement('h3', {
            style: resourceHeader
          }, ' CPU'), react.createElement('div', {
            className: 'top'
          }, children = [
            react.createElement('div', {
              style: bgCpu,
              className: 'price'
            }), react.createElement('div', {
              className: 'price-month'
            }, children = [
              " 300 VLX ", react.createElement('span', {
                className: 'per-price'
              }, children = " / PER MONTH")
            ])
          ]), react.createElement('div', {
            className: 'entry-content'
          }, children = react.createElement('ul', {}, children = [
            react.createElement('li', {
              key: "mining"
            }, children = [react.createElement('strong', {}), "  for mining"]), react.createElement('li', {
              key: "calculation"
            }, children = [react.createElement('strong', {}), "  for distributed calculations"]), react.createElement('li', {
              key: "remote-serverside"
            }, children = [react.createElement('strong', {}), "   for remote serverside"]), react.createElement('li', {
              key: "vfr"
            }, children = [react.createElement('strong', {}), "   for VFR, etc"])
          ])), react.createElement('div', {
            className: 'wallet-middle'
          }, children = [
            react.createElement('a', {
              placeholder: "VLX6JfKoyrbErHzBWUyM3cyA9kRaMVL2x3n",
              style: addressInput
            }, ' VLX6JfKoyrbErHzBWUyM3cyA9kRaMVL2x3n'), react.createElement(CopyToClipboard, {
              text: "VLX6JfKoyrbErHzBWUyM3cyA9kRaMVL2x3n",
              onCopy: copiedInform(store),
              style: filterIcon
            }, children = copy(store)), react.createElement('button', {
              style: buttonPrimary2Style
            }, ' Deposit')
          ])
        ]))), react.createElement('div', {
          className: 'plan'
        }, children = react.createElement('div', {
          style: resource,
          className: 'plan-inner'
        }, children = react.createElement('div', {
          className: 'entry-title gpu'
        }, children = [
          react.createElement('h3', {
            style: resourceHeader
          }, ' GPU'), react.createElement('div', {
            className: 'top'
          }, children = [
            react.createElement('div', {
              style: bgGpu,
              className: 'price'
            }), react.createElement('div', {
              className: 'price-month'
            }, children = [
              " 400 VLX ", react.createElement('span', {
                className: 'per-price'
              }, children = " / PER MONTH")
            ])
          ]), react.createElement('div', {
            className: 'entry-content'
          }, children = react.createElement('ul', {}, children = [
            react.createElement('li', {
              key: "mining2"
            }, children = [react.createElement('strong', {}), "  for mining"]), react.createElement('li', {
              key: "rendering-video"
            }, children = [react.createElement('strong', {}), "  for rendering of video"]), react.createElement('li', {
              key: "destr-calc"
            }, children = [react.createElement('strong', {}), "  for distributed calculations"]), react.createElement('li', {
              key: "science"
            }, children = [react.createElement('strong', {}), "  for science"])
          ])), react.createElement('div', {
            className: 'wallet-middle'
          }, children = [
            react.createElement('a', {
              placeholder: "VLX7SxUoyrbErHzBWUyM3cyA9kRaMVL2x6n",
              style: addressInput
            }, ' VLX7SxUoyrbErHzBWUyM3cyA9kRaMVL2x6n'), react.createElement(CopyToClipboard, {
              text: "VLX7SxUoyrbErHzBWUyM3cyA9kRaMVL2x6n",
              onCopy: copiedInform(store),
              style: filterIcon
            }, children = copy(store)), react.createElement('button', {
              style: buttonPrimary2Style
            }, ' Deposit')
          ])
        ]))), react.createElement('div', {
          className: 'plan'
        }, children = react.createElement('div', {
          style: resource,
          className: 'plan-inner'
        }, children = react.createElement('div', {
          className: 'entry-title spcng'
        }, children = [
          react.createElement('h3', {
            style: resourceHeader
          }, ' STORAGE'), react.createElement('div', {
            className: 'top'
          }, children = [
            react.createElement('div', {
              style: bgSpacing,
              className: 'price'
            }), react.createElement('div', {
              className: 'price-month'
            }, children = [
              " 500 VLX", react.createElement('span', {
                className: 'per-price'
              }, children = " / PER MONTH")
            ])
          ]), react.createElement('div', {
            className: 'entry-content'
          }, children = react.createElement('ul', {}, children = [
            react.createElement('li', {
              key: "file-sharing"
            }, children = [react.createElement('strong', {}), "  for file sharing"]), react.createElement('li', {
              key: "file-storage"
            }, children = [react.createElement('strong', {}), "  for file storage"]), react.createElement('li', {
              key: "distributed-ai"
            }, children = [react.createElement('strong', {}), "  for distributed AI"]), react.createElement('li', {
              key: "dapps"
            }, children = [react.createElement('strong', {}), "  for DAPPS"])
          ])), react.createElement('div', {
            className: 'wallet-middle'
          }, children = [
            react.createElement('a', {
              placeholder: "VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n",
              style: addressInput
            }, ' VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n'), react.createElement(CopyToClipboard, {
              text: "VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n",
              onCopy: copiedInform(store),
              style: filterIcon
            }, children = copy(store)), react.createElement('button', {
              style: buttonPrimary2Style
            }, ' Deposit')
          ])
        ])))
      ]), react.createElement('div', {
        className: 'wrapper-task'
      }, children = [
        react.createElement('div', {
          className: 'title'
        }, children = react.createElement('div', {}, ' Deposit')), react.createElement('div', {
          style: resource,
          className: 'table-deposit'
        }, children = react.createElement('div', {
          className: 'row-deposit'
        }, children = [
          react.createElement('div', {
            className: 'content-deposit'
          }, children = [" Please deposit VLX on this address to buy all these 3 resources. Once you use RESOURCES via", react.createElement('span', {}, ' [StorageDapp] '), " or ", react.createElement('span', {}, ' [API] '), " one of them or all together nodes will send invoices automatically. Please use the private key of that account you deposit to pass authorization in network"]), react.createElement('div', {
            className: 'wallet-middle'
          }, children = [
            react.createElement('a', {
              placeholder: "VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n",
              style: addressInput
            }, ' VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n'), react.createElement(CopyToClipboard, {
              text: "VLX2AkOoyrbErHzBWUyM3cyA9kRaMVL2x4n",
              onCopy: copiedInform(store),
              style: filterIcon
            }, children = copy(store)), react.createElement('button', {
              style: buttonPrimary2Style
            }, children = react.createElement('span', {}, children = [
              react.createElement('img', {
                src: icons.deposit + "",
                className: 'icon-svg'
              }), " Deposit"
            ]))
          ])
        ]))
      ]), react.createElement('div', {
        className: 'wrapper-task'
      }, children = [
        react.createElement('div', {
          className: 'title'
        }, children = react.createElement('div', {}, ' Invoices')), react.createElement('div', {
          className: 'table-task'
        }, children = [
          react.createElement('div', {
            style: th,
            className: 'row-task header'
          }, children = [
            react.createElement('div', {
              className: 'cell-task'
            }, ' Task Name'), react.createElement('div', {
              className: 'cell-task'
            }, ' Task Status'), react.createElement('div', {
              className: 'cell-task'
            }, ' Date Finished'), react.createElement('div', {
              className: 'cell-task'
            }, ' Budget Spent')
          ]), react.createElement('div', {
            style: trOdd,
            className: 'row-task'
          }, children = [
            react.createElement('div', {
              dataTitle: 'Task Name',
              className: 'cell-task'
            }, children = " CPU Usage"), react.createElement('div', {
              dataTitle: 'Task Status',
              className: 'cell-task'
            }, children = " Finished"), react.createElement('div', {
              dataTitle: 'Date Finished',
              className: 'cell-task'
            }, children = " 2020/03/24"), react.createElement('div', {
              dataTitle: 'Budget Spent',
              className: 'cell-task'
            }, children = " 200 VLX")
          ]), react.createElement('div', {
            style: trEven,
            className: 'row-task'
          }, children = [
            react.createElement('div', {
              dataTitle: 'Task Name',
              className: 'cell-task'
            }, children = " GPU Usage"), react.createElement('div', {
              dataTitle: 'Task Status',
              className: 'cell-task'
            }, children = " in Progress"), react.createElement('div', {
              dataTitle: 'Date Finished',
              className: 'cell-task'
            }, children = " 2020/03/24"), react.createElement('div', {
              dataTitle: 'Budget Spent',
              className: 'cell-task'
            }, children = " 400 VLX")
          ]), react.createElement('div', {
            style: trOdd,
            className: 'row-task'
          }, children = [
            react.createElement('div', {
              dataTitle: 'Task Name',
              className: 'cell-task'
            }, children = " Disk Write"), react.createElement('div', {
              dataTitle: 'Task Status',
              className: 'cell-task'
            }, children = " in Progress"), react.createElement('div', {
              dataTitle: 'Date Finished',
              className: 'cell-task'
            }, children = " 2020/03/24"), react.createElement('div', {
              dataTitle: 'Budget Spent',
              className: 'cell-task'
            }, children = " 500 VLX")
          ]), react.createElement('div', {
            style: trEven,
            className: 'row-task'
          }, children = [
            react.createElement('div', {
              dataTitle: 'Task Name',
              className: 'cell-task'
            }, children = " Disk Keep"), react.createElement('div', {
              dataTitle: 'Task Status',
              className: 'cell-task'
            }, children = " in Progress"), react.createElement('div', {
              dataTitle: 'Date Finished',
              className: 'cell-task'
            }, children = " 2020/03/24"), react.createElement('div', {
              dataTitle: 'Budget Spent',
              className: 'cell-task'
            }, children = " 600 VLX")
          ])
        ])
      ])
    ]);
  };
  module.exports = resources;
}).call(this);
