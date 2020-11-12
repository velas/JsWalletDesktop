// Generated by LiveScript 1.6.0
(function(){
  var mainnet, testnet, color, type, enabled, token, image, usdInfo, out$ = typeof exports != 'undefined' && exports || this;
  out$.mainnet = mainnet = {
    privateKey: '...',
    decimals: 0,
    mask: '+30001234567',
    currency: 643,
    api: {
      provider: 'qiwi'
    }
  };
  out$.testnet = testnet = {
    disabled: true
  };
  out$.color = color = '#FF8C00';
  out$.type = type = 'coin';
  out$.enabled = enabled = true;
  out$.token = token = 'qiwi';
  out$.image = image = "data:image/png;base64,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";
  out$.usdInfo = usdInfo = "1/url(https://api.exchangeratesapi.io/latest?base=USD).rates.RUB";
}).call(this);
