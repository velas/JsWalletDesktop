// Generated by LiveScript 1.6.0
(function(){
  var insight, calcFee, getBitcoinFullpairByIndex, getKeys, createTransaction, pushTx, getTotalReceived, getUnconfirmedBalance, getBalance, checkTxStatus, getTransactions, out$ = typeof exports != 'undefined' && exports || this;
  insight = require('./insight.ls');
  out$.calcFee = calcFee = insight.calcFee;
  getBitcoinFullpairByIndex = function(mnemonic, index, network){
    var seed, hdnode, address, privateKey, publicKey;
    seed = bip39.mnemonicToSeedHex(mnemonic);
    hdnode = BitcoinLib.HDNode.fromSeedHex(seed, network).derive(index);
    address = hdnode.getAddress();
    privateKey = hdnode.keyPair.toWIF();
    publicKey = hdnode.getPublicKeyBuffer().toString('hex');
    return {
      address: address,
      privateKey: privateKey,
      publicKey: publicKey
    };
  };
  out$.getKeys = getKeys = function(arg$, cb){
    var network, mnemonic, index, result, address, ref$;
    network = arg$.network, mnemonic = arg$.mnemonic, index = arg$.index;
    result = getBitcoinFullpairByIndex(mnemonic, index, network);
    console.log('here');
    address = BitcoinLib.payments.p2sh({
      redeem: bitcoin.payments.p2wpkh({
        pubkey: publicKey
      })
    }).address;
    return cb(null, (ref$ = {}, import$(ref$, result), ref$.address = address, ref$));
  };
  out$.createTransaction = createTransaction = insight.createTransaction;
  out$.pushTx = pushTx = insight.pushTx;
  out$.getTotalReceived = getTotalReceived = insight.getTotalReceived;
  out$.getUnconfirmedBalance = getUnconfirmedBalance = insight.getUnconfirmedBalance;
  out$.getBalance = getBalance = insight.getBalance;
  out$.checkTxStatus = checkTxStatus = insight.checkTxStatus;
  out$.getTransactions = getTransactions = insight.getTransactions;
  function import$(obj, src){
    var own = {}.hasOwnProperty;
    for (var key in src) if (own.call(src, key)) obj[key] = src[key];
    return obj;
  }
}).call(this);
