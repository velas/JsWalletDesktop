// Generated by LiveScript 1.6.0
(function(){
  var stringify;
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
  module.exports = {
    stringify: stringify
  };
}).call(this);
