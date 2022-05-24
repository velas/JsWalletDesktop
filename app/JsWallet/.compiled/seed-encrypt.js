// Generated by LiveScript 1.6.0
(function(){
  var aes, tripledes, rc4, rabbit, ref$, foldl, reverse, split, map, qs, stringify, libsSource, seedPattern, libs, libsOld, libsNew, encryptEach, encrypt, decryptEach, decrypt, decryptOld, encryptNew, out$ = typeof exports != 'undefined' && exports || this;
  aes = require('crypto-js/aes');
  tripledes = require('crypto-js/tripledes');
  rc4 = require('crypto-js/rc4');
  rabbit = require('crypto-js/rabbit');
  ref$ = require('prelude-ls'), foldl = ref$.foldl, reverse = ref$.reverse, split = ref$.split, map = ref$.map;
  qs = require('qs');
  stringify = function(wordArray){
    var words, sigBytes, latin1Chars, i, s, t, bite;
    words = wordArray.words, sigBytes = wordArray.sigBytes;
    latin1Chars = [];
    for (i in (fn$())) {
      s = 24 - (i % 4) * 8;
      t = words[i >>> 2] >>> s;
      bite = t & 0xff;
      latin1Chars.push(String.fromCharCode(bite));
    }
    return decodeURIComponent(escape(latin1Chars.join('')));
    function fn$(){
      var i$, to$, results$ = [];
      for (i$ = 0, to$ = sigBytes - 1; i$ <= to$; ++i$) {
        results$.push(i$);
      }
      return results$;
    }
  };
  libsSource = [aes, tripledes, rc4, rabbit];
  seedPattern = (function(){
    switch (false) {
    case !((typeof window != 'undefined' && window !== null ? window.location.search.indexOf('seedpattern') : void 8) > -1):
      return qs.parse(window.location.search.replace('?', '')).seedpattern;
    default:
      return "01233201";
    }
  }());
  libs = map(function(it){
    return libsSource[+it];
  })(
  split('')(
  seedPattern));
  libsOld = map(function(it){
    return libsSource[+it];
  })(
  split('')(
  "0"));
  libsNew = map(function(it){
    return libsSource[+it];
  })(
  split('')(
  "0"));
  encryptEach = function(key){
    return function(value, lib){
      return lib.encrypt(value, key).toString();
    };
  };
  out$.encrypt = encrypt = function(value, key){
    return foldl(encryptEach(key), value)(
    libs);
  };
  decryptEach = function(key){
    return function(value, lib){
      var e;
      try {
        return lib.decrypt(value, key).toString({
          stringify: stringify
        });
      } catch (e$) {
        e = e$;
        return "";
      }
    };
  };
  out$.decrypt = decrypt = function(value, key){
    return foldl(decryptEach(key), value)(
    reverse(
    libs));
  };
  out$.decryptOld = decryptOld = function(value, key){
    return foldl(decryptEach(key), value)(
    reverse(
    libsOld));
  };
  out$.encryptNew = encryptNew = function(value, key){
    return foldl(encryptEach(key), value)(
    libsNew);
  };
}).call(this);
