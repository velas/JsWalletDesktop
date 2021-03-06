// Generated by LiveScript 1.6.0
(function(){
  var react, reactDom, navigate, getPrimaryInfo, web3, getLang, historyFuncs, icon, switchAccount, icons, epoch, alertDemo, burger, item, item2, notice;
  react = require('react');
  reactDom = require('react-dom');
  navigate = require('../navigate.ls');
  getPrimaryInfo = require('../get-primary-info.ls');
  web3 = require('../web3.ls');
  getLang = require('../get-lang.ls');
  historyFuncs = require('../history-funcs.ls');
  icon = require('./icon.ls');
  switchAccount = require('./switch-account.ls');
  icons = require('../icons.ls');
  epoch = require('./epoch.ls');
  alertDemo = require('./alert-demo.ls');
  burger = require('../components/burger.ls');
  item = function(store, web3t){
    var lang, goBack, info, style, borderStyle, borderRight, borderStyle2, borderStyle3, buttonPrimary2Style, headerTableStyle, dashedBorder, filterBody, borderB, borderT, buttonPrimary1Style, inputStyle, lightText, iconStyle, switchFiles, search, searchShow, fileTree, imgs, children;
    lang = getLang(store);
    goBack = historyFuncs(store, web3t).goBack;
    info = getPrimaryInfo(store);
    style = {
      background: info.app.wallet,
      color: info.app.text
    };
    borderStyle = {
      color: info.app.text,
      borderBottom: "1px solid " + info.app.border
    };
    borderRight = {
      color: info.app.text,
      borderRight: "1px solid " + info.app.border
    };
    borderStyle2 = {
      color: info.app.text,
      borderBottom: "1px solid " + info.app.border,
      background: "#4b2888"
    };
    borderStyle3 = {
      color: info.app.text,
      borderBottom: "0"
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
      background: info.app.walletLight,
      position: "sticky"
    };
    dashedBorder = {
      borderColor: info.app.border + "",
      color: info.app.color3
    };
    filterBody = {
      border: "1px solid " + info.app.border,
      background: info.app.header
    };
    borderB = {
      borderBottom: "1px solid " + info.app.border,
      background: info.app.header
    };
    borderT = {
      borderTop: "1px solid " + info.app.border,
      background: info.app.header
    };
    buttonPrimary1Style = {
      border: "1px solid " + info.app.primary1,
      color: info.app.text,
      background: info.app.primary1,
      backgroundColor: info.app.primary1Spare
    };
    inputStyle = {
      background: info.app.wallet,
      border: "0",
      color: info.app.text
    };
    lightText = {
      color: info.app.color3
    };
    iconStyle = {
      filter: info.app.nothingIcon
    };
    switchFiles = function(){
      return store.current.files = !store.current.files;
    };
    search = function(){
      return store.notice.search = !store.notice.search;
    };
    searchShow = store.notice.search ? 'active' : "";
    fileTree = store.current.files ? 'file-tree' : "";
    imgs = {
      ava: "https://res.cloudinary.com/dfbhd7liw/image/upload/v1588866150/velas/interface_1.png"
    };
    return react.createElement('div', {
      className: fileTree + " msg-content"
    }, children = [
      react.createElement('div', {
        style: borderB,
        className: 'header'
      }, children = [
        react.createElement('img', {
          src: imgs.ava + ""
        }), react.createElement('span', {}, children = [
          react.createElement('div', {
            className: 'name'
          }, ' Paul Smith'), react.createElement('div', {
            className: 'activity'
          }, ' last seen 2 minutes ago')
        ]), react.createElement('ul', {
          className: 'action'
        }, children = react.createElement('li', {}, children = react.createElement('img', {
          onClick: search,
          src: icons.search + "",
          className: 'icon-svg-video'
        })))
      ]), react.createElement('div', {
        style: borderB,
        className: searchShow + " search"
      }, children = react.createElement('input', {
        type: 'text',
        style: inputStyle,
        value: '',
        placeholder: lang.search + ""
      })), react.createElement('div', {
        style: borderT,
        className: 'textarea'
      }, children = react.createElement('input', {
        type: 'text',
        style: inputStyle,
        value: '',
        placeholder: lang.writemsg + ""
      })), react.createElement('div', {
        className: 'content-msg'
      }, children = react.createElement('ul', {}, children = [
        react.createElement('li', {
          className: 'in'
        }, children = react.createElement('span', {}, children = [" Hello", react.createElement('span', {}, ' 22:53')])), react.createElement('li', {
          className: 'out'
        }, children = react.createElement('span', {}, children = [" Hi", react.createElement('span', {}, ' 22:53')])), react.createElement('li', {
          className: 'in'
        }, children = react.createElement('span', {}, children = [" How are you?", react.createElement('span', {}, ' 22:53')])), react.createElement('li', {
          className: 'out'
        }, children = react.createElement('span', {}, children = [" Fine", react.createElement('span', {}, ' 22:53')])), react.createElement('li', {
          className: 'out'
        }, children = react.createElement('span', {}, children = [" And you?", react.createElement('span', {}, ' 22:53')])), react.createElement('li', {
          className: 'in'
        }, children = react.createElement('span', {}, children = [" Inconspicuous motes of rock and gas how far away brain is the seed of intelligence gathered by gravity concept of the number one Orions sword.", react.createElement('span', {}, ' 22:53')]))
      ]))
    ]);
  };
  item2 = function(store, web3t){
    var lang, goBack, info, style, borderStyle, borderRight, borderStyle2, borderStyle3, buttonPrimary2Style, headerTableStyle, dashedBorder, filterBody, borderB, borderT, buttonPrimary1Style, inputStyle, lightText, iconStyle, switchFiles, search, searchShow, fileTree, imgs, children;
    lang = getLang(store);
    goBack = historyFuncs(store, web3t).goBack;
    info = getPrimaryInfo(store);
    style = {
      background: info.app.wallet,
      color: info.app.text
    };
    borderStyle = {
      color: info.app.text,
      borderBottom: "1px solid " + info.app.border
    };
    borderRight = {
      color: info.app.text,
      borderRight: "1px solid " + info.app.border
    };
    borderStyle2 = {
      color: info.app.text,
      borderBottom: "1px solid " + info.app.border,
      background: "#4b2888"
    };
    borderStyle3 = {
      color: info.app.text,
      borderBottom: "0"
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
      background: info.app.walletLight,
      position: "sticky"
    };
    dashedBorder = {
      borderColor: info.app.border + "",
      color: info.app.color3
    };
    filterBody = {
      border: "1px solid " + info.app.border,
      background: info.app.header
    };
    borderB = {
      borderBottom: "1px solid " + info.app.border,
      background: info.app.header
    };
    borderT = {
      borderTop: "1px solid " + info.app.border,
      background: info.app.header
    };
    buttonPrimary1Style = {
      border: "1px solid " + info.app.primary1,
      color: info.app.text,
      background: info.app.primary1,
      backgroundColor: info.app.primary1Spare
    };
    inputStyle = {
      background: info.app.wallet,
      border: "0",
      color: info.app.text
    };
    lightText = {
      color: info.app.color3
    };
    iconStyle = {
      filter: info.app.nothingIcon
    };
    switchFiles = function(){
      return store.current.files = !store.current.files;
    };
    search = function(){
      return store.notice.search = !store.notice.search;
    };
    searchShow = store.notice.search ? 'active' : "";
    fileTree = store.current.files ? 'file-tree' : "";
    imgs = {
      ava: "https://res.cloudinary.com/dfbhd7liw/image/upload/v1588866150/velas/interface_1.png"
    };
    return react.createElement('div', {
      className: fileTree + " msg-content"
    }, children = [
      react.createElement('div', {
        style: borderB,
        className: 'header'
      }, children = [
        react.createElement('img', {
          src: imgs.ava + ""
        }), react.createElement('span', {}, children = [
          react.createElement('div', {
            className: 'name'
          }, ' Nicolas Gate'), react.createElement('div', {
            className: 'activity'
          }, ' last seen 2 minutes ago')
        ]), react.createElement('ul', {
          className: 'action'
        }, children = react.createElement('li', {}, children = react.createElement('img', {
          onClick: search,
          src: icons.search + "",
          className: 'icon-svg-video'
        })))
      ]), react.createElement('div', {
        style: borderB,
        className: searchShow + " search"
      }, children = react.createElement('input', {
        type: 'text',
        style: inputStyle,
        value: '',
        placeholder: lang.search + ""
      })), react.createElement('div', {
        style: borderT,
        className: 'textarea'
      }, children = react.createElement('input', {
        type: 'text',
        style: inputStyle,
        value: '',
        placeholder: lang.writemsg + ""
      })), react.createElement('div', {
        className: 'content-msg'
      }, children = react.createElement('ul', {}, children = [
        react.createElement('li', {
          className: 'in'
        }, children = react.createElement('span', {}, children = [" Hi, bro", react.createElement('span', {}, ' 22:53')])), react.createElement('li', {
          className: 'out'
        }, children = react.createElement('span', {}, children = [" Hello", react.createElement('span', {}, ' 22:53')])), react.createElement('li', {
          className: 'in'
        }, children = react.createElement('span', {}, children = [" How are you feeling?", react.createElement('span', {}, ' 22:53')])), react.createElement('li', {
          className: 'out'
        }, children = react.createElement('span', {}, children = [" Good", react.createElement('span', {}, ' 22:53')])), react.createElement('li', {
          className: 'out'
        }, children = react.createElement('span', {}, children = [" And you?", react.createElement('span', {}, ' 22:53')])), react.createElement('li', {
          className: 'in'
        }, children = react.createElement('span', {}, children = [" Also good!", react.createElement('span', {}, ' 22:53')]))
      ]))
    ]);
  };
  notice = function(arg$){
    var store, web3t, lang, goBack, gotoSearch, info, filterBody, headerTableStyle, active, switchProgress, hideProgress, switchFiles, fileTree, style, borderStyle, borderUsers, borderStyle3, borderRight, buttonPrimary2Style, dashedBorder, borderB, searchBg, buttonPrimary1Style, inputStyle, lightText, iconStyle, borderT, activate, activateItem, activateItem2, activateItem3, activateItem4, activeClass, activeItem, activeItem2, activeItem3, activeItem4, showClass, imgs, children;
    store = arg$.store, web3t = arg$.web3t;
    lang = getLang(store);
    goBack = historyFuncs(store, web3t).goBack;
    gotoSearch = function(){
      return navigate(store, web3t, 'search');
    };
    info = getPrimaryInfo(store);
    filterBody = {
      border: "1px solid " + info.app.border,
      background: info.app.header
    };
    headerTableStyle = {
      borderBottom: "1px solid " + info.app.border,
      background: info.app.walletLight,
      position: "sticky"
    };
    active = store.current.active ? 'active' : "";
    switchProgress = function(){
      return store.current.progress = !store.current.progress;
    };
    hideProgress = store.current.progress ? 'hide-progress' : "";
    switchFiles = function(){
      return store.current.files = !store.current.files;
    };
    fileTree = store.current.files ? 'file-tree' : "";
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
    borderUsers = {
      color: info.app.text,
      borderRight: "1px solid " + info.app.border
    };
    borderStyle3 = {
      color: info.app.text,
      borderBottom: "0"
    };
    borderRight = {
      color: info.app.text
    };
    buttonPrimary2Style = {
      border: "1px solid " + info.app.primary2,
      color: info.app.text,
      background: info.app.primary2,
      backgroundColor: info.app.primary2Spare
    };
    headerTableStyle = {
      borderBottom: "1px solid " + info.app.border,
      background: info.app.walletLight,
      position: "sticky"
    };
    dashedBorder = {
      borderColor: info.app.border + "",
      color: info.app.color3
    };
    filterBody = {
      border: "1px solid " + info.app.border,
      background: info.app.header
    };
    borderB = {
      borderBottom: "1px solid " + info.app.border
    };
    searchBg = {
      borderBottom: "1px solid " + info.app.border,
      borderRight: "1px solid " + info.app.border,
      background: info.app.header
    };
    buttonPrimary1Style = {
      border: "1px solid " + info.app.primary1,
      color: info.app.text,
      background: info.app.primary1,
      backgroundColor: info.app.primary1Spare
    };
    inputStyle = {
      background: info.app.wallet,
      border: "0",
      color: info.app.text
    };
    lightText = {
      color: info.app.color3
    };
    iconStyle = {
      filter: info.app.nothingIcon
    };
    borderT = {
      borderTop: "1px solid " + info.app.border,
      borderRight: "1px solid " + info.app.border,
      background: info.app.header
    };
    activate = function(tab){
      return function(){
        return store.faq.tab = tab;
      };
    };
    activateItem = activate('item');
    activateItem2 = activate('item2');
    activateItem3 = activate('item3');
    activateItem4 = activate('item4');
    activeClass = function(tab){
      if (store.faq.tab === tab) {
        return 'active';
      } else {
        return '';
      }
    };
    activeItem = activeClass('item');
    activeItem2 = activeClass('item2');
    activeItem3 = activeClass('item3');
    activeItem4 = activeClass('item4');
    showClass = store.current.openMenu ? 'hide' : "";
    imgs = {
      ava: "https://res.cloudinary.com/dfbhd7liw/image/upload/v1588866150/velas/interface_1.png"
    };
    return react.createElement('div', {
      className: 'notice notice-970801489'
    }, children = [
      alertDemo(store, web3t), react.createElement('div', {
        style: borderStyle,
        className: 'title'
      }, children = [
        react.createElement('div', {
          className: showClass + " header"
        }, ' ' + lang.velasMessenger), react.createElement('div', {
          onClick: gotoSearch,
          className: 'close'
        }, children = react.createElement('img', {
          src: icons.arrowLeft + "",
          className: 'icon-svg'
        })), burger(store, web3t), epoch(store, web3t), switchAccount(store, web3t)
      ]), false ? react.createElement('div', {
        className: 'search-input'
      }, children = react.createElement('div', {
        style: borderStyle,
        className: 'section'
      }, children = [
        react.createElement('span', {
          onClick: switchFiles,
          className: 'close'
        }, children = react.createElement('img', {
          src: icons.menu + "",
          className: 'icon-svg-video'
        })), react.createElement('div', {
          className: 'title'
        }), react.createElement('div', {
          className: 'description search-field'
        }, children = react.createElement('div', {
          className: 'left'
        }, children = [
          react.createElement('input', {
            type: 'text',
            style: inputStyle,
            value: "velas",
            placeholder: "velas"
          }), react.createElement('div', {
            className: 'icon'
          }, children = icon('Search', 15))
        ]))
      ])) : void 8, react.createElement('div', {
        className: 'wrapper'
      }, children = [
        react.createElement('div', {
          style: borderUsers,
          className: fileTree + " main-content"
        }, children = react.createElement('div', {
          style: borderRight,
          className: 'section filter'
        }, children = react.createElement('div', {
          className: 'tabs'
        }, children = [
          react.createElement('div', {
            style: borderT,
            className: 'left-menu'
          }), react.createElement('ul', {
            style: borderStyle3
          }, children = [
            react.createElement('li', {
              style: searchBg
            }, children = [
              react.createElement('input', {
                type: 'text',
                style: inputStyle,
                value: '',
                placeholder: lang.search + ""
              }), react.createElement('img', {
                src: icons.create + "",
                className: 'edit'
              })
            ]), react.createElement('li', {
              onClick: activateItem,
              style: borderB,
              className: activeItem + ""
            }, children = [
              react.createElement('img', {
                src: imgs.ava + "",
                className: 'ava'
              }), react.createElement('span', {
                className: 'preview'
              }, children = [
                react.createElement('div', {
                  className: 'name'
                }, ' Paul Smith'), react.createElement('div', {
                  className: 'msg'
                }, ' Inconspicuous motes of rock and gas how far away brain is the seed of intelligence gathered by gravity concept of the number one Orions sword.')
              ]), react.createElement('span', {
                className: 'notification'
              }, children = [
                react.createElement('div', {
                  className: 'time'
                }, ' 22:51'), react.createElement('div', {
                  className: 'count'
                }, ' 2')
              ])
            ]), react.createElement('li', {
              onClick: activateItem2,
              style: borderB,
              className: activeItem2 + ""
            }, children = [
              react.createElement('img', {
                src: imgs.ava + "",
                className: 'ava'
              }), react.createElement('span', {
                className: 'preview'
              }, children = [
                react.createElement('div', {
                  className: 'name'
                }, ' Nicolas Gate'), react.createElement('div', {
                  className: 'msg'
                }, ' Hey')
              ]), react.createElement('span', {
                className: 'notification'
              }, children = [
                react.createElement('div', {
                  className: 'time'
                }, ' Thu'), react.createElement('div', {
                  className: 'count'
                }, ' 10')
              ])
            ])
          ])
        ]))), activeItem === 'active' ? item(store, web3t) : void 8, activeItem2 === 'active' ? item2(store, web3t) : void 8
      ])
    ]);
  };
  module.exports = notice;
}).call(this);
