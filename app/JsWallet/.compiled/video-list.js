// Generated by LiveScript 1.6.0
(function(){
  var react, getPrimaryInfo, getLang, icon, navigate, icons;
  react = require('react');
  getPrimaryInfo = require('../get-primary-info.ls');
  getLang = require('../get-lang.ls');
  icon = require('../pages/icon.ls');
  navigate = require('../navigate.ls');
  icons = require('../icons.ls');
  module.exports = function(arg$){
    var store, web3t, fileDescriptions, info, gotoDetails, videoStyle, videos;
    store = arg$.store, web3t = arg$.web3t;
    fileDescriptions = store.video.uploadingFiles.filter(function(arg$){
      var status;
      status = arg$.status;
      return status === 'uploaded';
    });
    info = getPrimaryInfo(store);
    gotoDetails = function(){
      return navigate(store, web3t, 'videostoragedetails');
    };
    videoStyle = {
      background: 'black'
    };
    videos = fileDescriptions.map(function(desc){
      var gotoDetails, layout, children;
      gotoDetails = function(){
        return location.href = "https://video.velas.com/" + desc.id + "/" + desc.key;
      };
      layout = react.createElement('div', {
        className: 'section'
      }, children = react.createElement('div', {
        onClick: gotoDetails,
        className: 'source'
      }, children = [
        react.createElement('span', {
          className: 'play'
        }, children = icon('TriangleRight', 15)), react.createElement('video', {
          width: '224',
          height: '150',
          controls: 'controls',
          poster: desc.thumbnail + "",
          style: videoStyle
        }, children = react.createElement('source', {
          src: "/" + desc.id + "/" + desc.key,
          type: desc.file.type + "",
          preload: "metadata"
        })), react.createElement('div', {
          className: 'title-video'
        }, children = [
          react.createElement('span', {}, children = react.createElement('img', {
            src: info.branding.logo + "",
            className: 'account'
          })), react.createElement('span', {}, children = [
            react.createElement('div', {
              className: 'header'
            }, ' ' + desc.file.name), react.createElement('ul', {
              className: 'stat'
            }, children = [
              react.createElement('li', {
                key: "views-1212"
              }, children = react.createElement('span', {}, ' 2K views')), react.createElement('li', {
                key: "ago13232"
              }, children = react.createElement('span', {}, ' 5 days ago'))
            ])
          ])
        ])
      ]));
      return layout;
    });
    return videos;
  };
}).call(this);
