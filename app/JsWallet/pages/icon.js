// Generated by LiveScript 1.6.0
(function(){
  var octiconsReact, react, Octicon;
  octiconsReact = require('@primer/octicons-react');
  react = require('react');
  Octicon = octiconsReact['default'];
  module.exports = function(name, size){
    var icon;
    size == null && (size = 32);
    icon = octiconsReact[name];
    return react.createElement(Octicon, {
      icon: icon,
      size: size
    });
  };
}).call(this);