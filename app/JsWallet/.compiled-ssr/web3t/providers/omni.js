
// Generated by LiveScript 1.6.0
(function(){
  var bip32, stringify, ref$, filter, map, foldl, each, find, sum, values, plus, minus, times, div, $toHex, get, post, jsonParse, deadline, BitcoinLib, bip39, validate, getBitcoinFullpairByIndex, calcFeePerByte, calcDynamicFee, getCalcFeeFunc, calcFeePrivate, calcFeeInstantx, calcFee, getKeys, extend, getDec, addAmount, extendNum, toHex, getApiUrl, getOutputs, addValue, addOutputs, createTransaction, transformTx, getTransactions, checkDecodedData, pushTx, checkTxStatus, str, getTotalReceived, getUnconfirmedBalance, getData, getBalance, isValidAddress, getMarketHistoryPrices, toString$ = {}.toString, out$ = typeof exports != 'undefined' && exports || this;
  bip32 = require('bip32');
  stringify = require('qs').stringify;
  ref$ = require('prelude-ls'), filter = ref$.filter, map = ref$.map, foldl = ref$.foldl, each = ref$.each, find = ref$.find, sum = ref$.sum, values = ref$.values;
  ref$ = require('../math.js'), plus = ref$.plus, minus = ref$.minus, times = ref$.times, div = ref$.div, $toHex = ref$.$toHex;
  ref$ = require('./superagent.js'), get = ref$.get, post = ref$.post;
  jsonParse = require('../json-parse.js');
  deadline = require('../deadline.js');
  commonProvider = require("./common/provider");
  ref$ = require('./deps.js'), BitcoinLib = ref$.BitcoinLib, bip39 = ref$.bip39;
  validate = require('../embed_modules/bitcoin-address-validation');
  getBitcoinFullpairByIndex = function(mnemonic, index, network){
    var seed, hdnode, address, privateKey, publicKey;
    seed = bip39.mnemonicToSeed(mnemonic);
    hdnode = bip32.fromSeed(seed, network).derive(index);
    address = BitcoinLib.payments.p2pkh({
      pubkey: hdnode.publicKey,
      network: network
    }).address;
    privateKey = hdnode.toWIF();
    publicKey = hdnode.publicKey.toString('hex');
    return {
      address: address,
      privateKey: privateKey,
      publicKey: publicKey
    };
  };
  calcFeePerByte = function(config, cb){
    var network, feeType, account, o, txFee, ref$, amountFee, recipient;
    network = config.network, feeType = config.feeType, account = config.account;
    o = network != null ? network.txFeeOptions : void 8;
    txFee = (ref$ = o != null ? o[feeType] : void 8) != null
      ? ref$
      : (ref$ = network.txFee) != null ? ref$ : 0;
    if (feeType !== 'auto') {
      return cb(null, txFee);
    }
    feeType = 'cheap';
    amountFee = o.cheap;
    recipient = config.account.address;
    return createTransaction((import$({
      feeType: feeType,
      amountFee: amountFee,
      recipient: recipient
    }, config)), function(err, data){
      var bytes, infelicity, calcFee, finalPrice;
      if ((err + "").indexOf("Not Enough Funds (Unspent Outputs)") > -1) {
        return cb(null, o.cheap);
      }
      if (err != null) {
        return cb(err, o.cheap);
      }
      if (toString$.call(data.rawtx).slice(8, -1) !== 'String') {
        return cb("rawtx is expected");
      }
      bytes = data.rawtx.length / 2;
      infelicity = 1;
      calcFee = times(bytes + infelicity, o.feePerByte);
      finalPrice = (function(){
        switch (false) {
        case !(calcFee > +o.cheap):
          return calcFee;
        default:
          return o.cheap;
        }
      }());
      return cb(null, finalPrice);
    });
  };
  calcDynamicFee = function(arg$, cb){
    var network, tx, txType, account, feeType, o, txFee, ref$, networkName, ref1$;
    network = arg$.network, tx = arg$.tx, txType = arg$.txType, account = arg$.account, feeType = arg$.feeType;
    o = network != null ? network.txFeeOptions : void 8;
    txFee = (ref$ = o != null ? o[feeType] : void 8) != null
      ? ref$
      : (ref$ = network.txFee) != null ? ref$ : 0;
    if (feeType !== 'auto') {
      return cb(null, txFee);
    }
    networkName = ((ref$ = global.store) != null ? (ref1$ = ref$.current) != null ? ref1$.network : void 8 : void 8) || 'mainnet';
    return get(getApiUrl(network) + "/fee/6").timeout({
      deadline: deadline
    }).end(function(err, data){
      var vals, exists, ref$, calcedFee;
      if (err != null) {
        return cb(err);
      }
      vals = values(data.body);
      exists = (ref$ = vals[0]) != null
        ? ref$
        : -1;
      calcedFee = (function(){
        switch (false) {
        case vals[0] !== -1:
          return network.txFee;
        default:
          return vals[0];
        }
      }());
      return cb(null, calcedFee);
    });
  };
  getCalcFeeFunc = function(network){
    switch (false) {
    case (network != null ? network.txFeeAutoMode : void 8) !== 'per-byte':
      return calcFeePerByte;
    default:
      return calcDynamicFee;
    }
  };
  calcFeePrivate = function(config, cb){
    var network, tx, txType, account, feeType, ref$, o, calcFee;
    network = config.network, tx = config.tx, txType = config.txType, account = config.account, feeType = config.feeType;
    if (((ref$ = account != null ? account.address : void 8) != null ? ref$ : "") === "") {
      return cb("address cannot be empty");
    }
    o = network != null ? network.txFeeOptions : void 8;
    calcFee = getCalcFeeFunc(network);
    return calcFee(config, function(err, txFee){
      if (err != null) {
        return cb(err);
      }
      return getOutputs({
        network: network,
        address: account.address
      }, function(err, outputs){
        var numberOfInputs, fee;
        if (err != null) {
          return cb(err);
        }
        numberOfInputs = outputs.length > 0 ? outputs.length : 1;
        if (o.privatePerInput == null) {
          return cb("private-per-input is missing");
        }
        fee = plus(times(txFee, 2), times(numberOfInputs, o.privatePerInput));
        return cb(null, fee);
      });
    });
  };
  calcFeeInstantx = function(arg$, cb){
    var network, tx, txType, account, feeType, ref$, o, calcFee;
    network = arg$.network, tx = arg$.tx, txType = arg$.txType, account = arg$.account, feeType = arg$.feeType;
    if (((ref$ = account != null ? account.address : void 8) != null ? ref$ : "") === "") {
      return cb("address cannot be empty");
    }
    o = network != null ? network.txFeeOptions : void 8;
    calcFee = getCalcFeeFunc(network);
    return calcFee({
      network: network,
      tx: tx,
      txType: txType,
      account: account,
      feeType: feeType
    }, function(err, txFee){
      if (err != null) {
        return cb(err);
      }
      return getOutputs({
        network: network,
        address: account.address
      }, function(err, outputs){
        var numberOfInputs, fee;
        if (err != null) {
          return cb(err);
        }
        numberOfInputs = outputs.length > 0 ? outputs.length : 1;
        if (o.instantPerInput == null) {
          return cb("instant-per-input is missing");
        }
        fee = times(numberOfInputs, o.instantPerInput);
        return cb(null, fee);
      });
    });
  };
  out$.calcFee = calcFee = function(config, cb){
    var network, tx, txType, account, calcFee;
    network = config.network, tx = config.tx, txType = config.txType, account = config.account;
    if (txType === 'private') {
      return calcFeePrivate(config, cb);
    }
    if (txType === 'instant') {
      return calcFeeInstantx(config, cb);
    }
    calcFee = getCalcFeeFunc(network);
    return calcFee(config, function(err, fee){
      if (err != null) {
        return cb(err);
      }
      return cb(null, {
        calcedFee: fee
      });
    });
  };
  out$.getKeys = getKeys = function(arg$, cb){
    var network, mnemonic, index, result;
    network = arg$.network, mnemonic = arg$.mnemonic, index = arg$.index;
    result = getBitcoinFullpairByIndex(mnemonic, index, network);
    return cb(null, result);
  };
  extend = curry$(function(add, json){
    return import$(json, add);
  });
  getDec = commonProvider.getDec;
  addAmount = curry$(function(network, it){
    var dec;
    dec = getDec(network);
    return it.amount = (function(){
      switch (false) {
      case it.value == null:
        return div(it.value, dec);
      default:
        return 0;
      }
    }());
  });
  extendNum = function(str, fixed){
    if (str.length >= fixed) {
      return str;
    }
    return extendNum("0" + str, fixed);
  };
  extend = curry$(function(add, json){
    return import$(json, add);
  });
  toHex = function(num, fixed){
    var n;
    n = (+num).toString(16);
    return extendNum(n, fixed);
  };
  getApiUrl = function(network){
    var apiName, ref$, networkName, ref1$;
    apiName = (ref$ = network.api.apiName) != null ? ref$ : 'api';
    networkName = ((ref$ = global.store) != null ? (ref1$ = ref$.current) != null ? ref1$.network : void 8 : void 8) || 'mainnet';
    return network.api.apiUrlBtc + "/" + apiName + "/BTC/" + networkName;
  };
  getOutputs = curry$(function(arg$, cb){
    var network, address, url;
    network = arg$.network, address = arg$.address;
    url = network.api.url;
    return get(getApiUrl(network) + "/address/" + address + "/?unspent=true").timeout({
      deadline: deadline
    }).end(function(err, data){
      var ref$;
      if (err != null) {
        return cb("cannot get outputs - err " + ((ref$ = err.message) != null ? ref$ : err));
      }
      return function(it){
        return cb(null, it);
      }(
      map(extend({
        network: network,
        address: address
      }))(
      filter(function(it){
        return it.value != null;
      })(
      each(addAmount(network))(
      data.body))));
    });
  });
  addValue = curry$(function(network, it){
    var dec;
    dec = getDec(network);
    return it.value = (function(){
      switch (false) {
      case it.satoshis == null:
        return it.satoshis;
      case it.amount == null:
        return times(it.amount, dec);
      default:
        return 0;
      }
    }());
  });
  addOutputs = function(config, cb){
    var txType, total, value, fee, tx, recipient, account, rest;
    txType = config.txType, total = config.total, value = config.value, fee = config.fee, tx = config.tx, recipient = config.recipient, account = config.account;
    if (fee == null || value == null || total == null) {
      return cb("fee, value, total are required");
    }
    if (txType === 'private') {
      return addOutputsPrivate(config, cb);
    }
    rest = minus(minus(total, value), fee);
    tx.addOutput(recipient, +value);
    if (+rest !== 0) {
      tx.addOutput(account.address, +rest);
    }
    return cb(null);
  };
  out$.createTransaction = createTransaction = function(arg$, cb){
    var network, account, recipient, amount, amountFee, feeType, txType, spender;
    network = arg$.network, account = arg$.account, recipient = arg$.recipient, amount = arg$.amount, amountFee = arg$.amountFee, feeType = arg$.feeType, txType = arg$.txType, spender = arg$.spender;
    return getOutputs({
      network: network,
      address: account.address
    }, function(err, outputs){
      var isNoValue, dec, value, fee, dust, total;
      if (err != null) {
        return cb(err);
      }
      if (outputs.length === 0) {
        return cb('Not Enough Funds (Unspent Outputs)');
      }
      isNoValue = find(function(it){
        return it.value == null;
      })(
      outputs);
      if (isNoValue) {
        return cb('Each output should have a value');
      }
      dec = getDec(network);
      value = times(amount, dec);
      fee = times(amountFee, dec);
      dust = 546;
      total = sum(
      map(function(it){
        return it.value;
      })(
      outputs));
      if (isNaN(total)) {
        return cb('Total is NaN');
      }
      if (+minus(total, fee) <= 0) {
        return cb("Balance is not enough to send tx");
      }
      return getBalance({
        network: network,
        address: account.address
      }, function(err, omniBalance){
        var tx, simple_send, data, omniOutput, rest, apply, sign, rawtx;
        if (err != null) {
          return cb(err);
        }
        if (+omniBalance < +amount) {
          return cb("Balance is not enough to send this amount");
        }
        tx = new BitcoinLib.TransactionBuilder(network);
        simple_send = ["6f6d6e69", toHex(0, 4), toHex(network.propertyid, 12), toHex(value, 16)];
        data = Buffer.from(simple_send.join(''), 'hex');
        omniOutput = BitcoinLib.script.compile([BitcoinLib.opcodes.OP_RETURN, data]);
        rest = plus(minus(total, fee), dust);
        tx.addOutput(recipient, dust);
        tx.addOutput(omniOutput, 0);
        if (+rest !== 0) {
          tx.addOutput(account.address, +rest);
        }
        apply = function(output, i){
          return tx.addInput(output.mintTxid, output.mintIndex);
        };
        sign = function(output, i){
          var key;
          key = BitcoinLib.ECPair.fromWIF(account.privateKey, network);
          return tx.sign(i, key);
        };
        outputs.forEach(apply);
        outputs.forEach(sign);
        rawtx = tx.build().toHex();
        return cb(null, {
          rawtx: rawtx
        });
      });
    });
  };
  transformTx = curry$(function(arg$, t){
    var network, address, url, dec, tx, amount, time, fee, from, to;
    network = arg$.network, address = arg$.address;
    url = network.api.url;
    network = 'usdt';
    dec = getDec(network);
    tx = t.txid;
    amount = t.amount;
    time = t.blocktime;
    url = url + "/tx/" + tx;
    fee = t.fee;
    from = t.sendingaddress;
    to = t.referenceaddress;
    return {
      network: network,
      tx: tx,
      amount: amount,
      fee: fee,
      time: time,
      url: url,
      from: from,
      to: to
    };
  });
  out$.getTransactions = getTransactions = function(arg$, cb){
    var network, address, apiUrl, req;
    network = arg$.network, address = arg$.address;
    apiUrl = network.api.apiUrl;
    req = {
      addr: address
    };
    return post(apiUrl + "/v1/address/addr/details/", req).type('form').end(function(err, data){
      var ref$, txs;
      if (err != null) {
        return cb(err);
      }
      if (toString$.call(data).slice(8, -1) !== 'Object') {
        return cb("expected object");
      }
      if (toString$.call((ref$ = data.body) != null ? ref$.transactions : void 8).slice(8, -1) !== 'Array') {
        return cb("expected array");
      }
      txs = map(transformTx({
        network: network,
        address: address
      }))(
      filter(function(it){
        return +it.propertyid === +network.propertyid;
      })(
      data.body.transactions));
      return cb(null, txs);
    });
  };
  out$.checkDecodedData = checkDecodedData = function(decodedData, data){
    return cb(null, '');
  };
  out$.pushTx = pushTx = curry$(function(arg$, cb){
    var network, rawtx;
    network = arg$.network, rawtx = arg$.rawtx;
    return post(getApiUrl(network) + "/tx/send", {
      rawTx: rawtx
    }).end(function(err, res){
      var ref$;
      if (err != null) {
        return cb(err);
      }
      return cb(null, (ref$ = res.body) != null ? ref$.txid : void 8);
    });
  });
  out$.checkTxStatus = checkTxStatus = function(arg$, cb){
    var network, tx;
    network = arg$.network, tx = arg$.tx;
    return cb("Not Implemented");
  };
  str = function(it){
    return (it != null ? it : "").toString();
  };
  out$.getTotalReceived = getTotalReceived = function(arg$, cb){
    var address, network;
    address = arg$.address, network = arg$.network;
    return getTransactions({
      address: address,
      network: network
    }, function(err, txs){
      var total;
      total = foldl(plus, 0)(
      map(function(it){
        return it.amount;
      })(
      filter(function(it){
        return it.to === address;
      })(
      txs)));
      return cb(null, total);
    });
  };
  out$.getUnconfirmedBalance = getUnconfirmedBalance = function(arg$, cb){
    var network, address;
    network = arg$.network, address = arg$.address;
    return cb("Not Implemented");
  };
  getData = function(data, cb){
    var res, err;
    try {
      res = JSON.parse(data.text);
      return cb(null, res);
    } catch (e$) {
      err = e$;
      return cb(err);
    }
  };
  out$.getBalance = getBalance = function(arg$, cb){
    var network, address, apiUrl, req;
    network = arg$.network, address = arg$.address;
    apiUrl = network.api.apiUrl;
    req = {
      addr: address
    };
    return post(apiUrl + "/v1/address/addr/", req).type('form').end(function(err, data){
      if (err != null) {
        return cb(err);
      }
      return getData(data, function(err, body){
        var balance, dec, value;
        if (err != null) {
          return cb(err);
        }
        if (toString$.call(body != null ? body.balance : void 8).slice(8, -1) !== 'Array') {
          return cb("expected balance array. got " + data.text);
        }
        balance = find(function(it){
          return str(it.id) === str(network.propertyid);
        })(
        data.body.balance);
        if (balance == null) {
          return cb(null, 0);
        }
        dec = getDec(network);
        value = div(balance.value, dec);
        return cb(null, value);
      });
    });
  };
  out$.isValidAddress = isValidAddress = function(arg$, cb){
    var address, network, addressIsValid;
    address = arg$.address, network = arg$.network;
    addressIsValid = validate(address);
    if (!addressIsValid) {
      return cb("Address is not valid");
    }
    return cb(null, address);
  };
  out$.getMarketHistoryPrices = getMarketHistoryPrices = function(config, cb){
    var network, coin, market;
    network = config.network, coin = config.coin;
    market = coin.market;
    return get(market).timeout({
      deadline: deadline
    }).end(function(err, resp){
      var ref$;
      if (err != null) {
        return cb("cannot execute query - err " + ((ref$ = err.message) != null ? ref$ : err));
      }
      return jsonParse(resp.text, function(err, result){
        if (err != null) {
          return cb(err);
        }
        return cb(null, result);
      });
    });
  };
  function import$(obj, src){
    var own = {}.hasOwnProperty;
    for (var key in src) if (own.call(src, key)) obj[key] = src[key];
    return obj;
  }
  function curry$(f, bound){
    var context,
    _curry = function(args) {
      return f.length > 1 ? function(){
        var params = args ? args.concat() : [];
        context = bound ? context || this : this;
        return params.push.apply(params, arguments) <
            f.length && arguments.length ?
          _curry.call(context, params) : f.apply(context, params);
      } : f;
    };
    return _curry();
  }
}).call(this);