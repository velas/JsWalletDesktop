// Generated by LiveScript 1.6.0
(function(){
  var react, getPrimaryInfo, icon;
  react = require('react');
  getPrimaryInfo = require('../get-primary-info.ls');
  icon = require('../pages/icon.ls');
  module.exports = function(arg$){
    var store, web3t, info, fileDescriptions, row, filterBody, headerTableStyle, hideProgress, active, switchProgress, box, children;
    store = arg$.store, web3t = arg$.web3t;
    info = getPrimaryInfo(store);
    fileDescriptions = store.video.uploadingFiles.filter(function(arg$){
      var status;
      status = arg$.status;
      return status !== 'uploaded';
    });
    row = function(desc){
      var children;
      return react.createElement('div', {
        key: desc.file.name + "",
        className: 'table-row-menu'
      }, children = [
        react.createElement('div', {
          className: 'col folder-menu pending'
        }, children = [
          react.createElement('img', {
            src: store.filestore.extensionIcons.txt + ""
          }), react.createElement('div', {
            className: 'file-name'
          }, ' ' + desc.file.name)
        ]), react.createElement('div', {
          className: 'col folder-menu progress'
        }, children = react.createElement('progress', {
          value: Math.floor(desc.uploaded / desc.file.size * 100) + "",
          max: "100"
        }))
      ]);
    };
    filterBody = {
      border: "1px solid " + info.app.border,
      background: info.app.header
    };
    headerTableStyle = {
      borderBottom: "1px solid " + info.app.border,
      background: info.app.walletLight,
      position: "sticky"
    };
    hideProgress = store.current.progress ? 'hide-progress' : "";
    active = store.current.active ? 'active' : "";
    switchProgress = function(){
      return store.current.progress = !store.current.progress;
    };
    box = react.createElement('div', {
      style: filterBody,
      className: 'active-download'
    }, children = [
      react.createElement('div', {
        style: headerTableStyle,
        className: 'top'
      }, children = react.createElement('div', {
        className: 'table-row-menu'
      }, children = [
        react.createElement('span', {
          className: 'col folder-menu'
        }, children = react.createElement('div', {}, ' Uploading ' + fileDescriptions.length + ' item(s)')), react.createElement('ul', {
          className: active + " action col"
        }, children = [
          react.createElement('li', {
            key: "hide-progress3",
            onClick: switchProgress,
            className: hideProgress + ""
          }, children = react.createElement('span', {}, children = icon("ChevronDown", 15))), react.createElement('li', {
            key: "close3"
          }, ' '), react.createElement('span', {}, children = icon('X', 15))
        ])
      ])), react.createElement('div', {
        style: headerTableStyle,
        className: hideProgress + ""
      }, children = react.createElement('div', {
        className: 'table-row-menu'
      }, children = [
        react.createElement('span', {
          className: 'col folder-menu'
        }, children = react.createElement('div', {}, ' Left ?min.')), react.createElement('span', {
          className: 'col cancel'
        }, ' Cancel')
      ])), react.createElement('div', {
        className: hideProgress + ""
      }, children = fileDescriptions.map(row))
    ]);
    return box;
  };
}).call(this);
