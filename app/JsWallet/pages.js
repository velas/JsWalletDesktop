// Generated by LiveScript 1.6.0
(function(){
  var wallets, reviewwords, restorewords, history, send, receive, locked, sent, loading, loading2, invoice, terms, terms2, privacy, filestorage, settings, chooseinit, newseedrestore, verifyseed, staking, resources, search, resources2, choosestaker, videostorage, videostoragedetails, info, faq, claim, soundstorage, monitor, notification, offlinewallets, vote, util, isInIframe, out$ = typeof exports != 'undefined' && exports || this;
  wallets = require('./pages/wallets.ls');
  reviewwords = require('./pages/reviewwords.ls');
  restorewords = require('./pages/restorewords.ls');
  history = require('./pages/history.ls');
  send = require('./pages/send.ls');
  receive = require('./pages/receive.ls');
  locked = require('./pages/locked.ls');
  sent = require('./pages/sent.ls');
  loading = require('./pages/loading.ls');
  loading2 = require('./pages/loading2.ls');
  invoice = require('./pages/invoice.ls');
  terms = require('./pages/terms.ls');
  terms2 = require('./pages/terms2.ls');
  privacy = require('./pages/privacy.ls');
  filestorage = require('./pages/filestorage.ls');
  settings = require('./pages/settings.ls');
  chooseinit = require('./pages/chooseinit.ls');
  newseedrestore = require('./pages/newseedrestore.ls');
  verifyseed = require('./pages/verifyseed.ls');
  staking = require('./pages/staking.ls');
  resources = require('./pages/resources.ls');
  search = require('./pages/search.ls');
  resources2 = require('./pages/resources2.ls');
  choosestaker = require('./pages/choosestaker.ls');
  videostorage = require('./pages/videostorage.ls');
  videostoragedetails = require('./pages/videostoragedetails.ls');
  info = require('./pages/info.ls');
  faq = require('./pages/faq.ls');
  claim = require('./pages/claim.ls');
  soundstorage = require('./pages/soundstorage.ls');
  monitor = require('./pages/monitor.ls');
  notification = require('./pages/notification.ls');
  offlinewallets = require('./pages/offlinewallets.ls');
  vote = require('./pages/vote.ls');
  util = require('./pages/util.ls');
  isInIframe = window !== window.parent;
  if (isInIframe) {
    out$.verifyseed = verifyseed;
    out$.loading = loading;
    out$.loading2 = loading2;
    out$.wallets = wallets;
    out$.history = history;
    out$.send = send;
    out$.locked = locked;
    out$.sent = sent;
    out$.terms = terms;
    out$.terms2 = terms2;
    out$.privacy = privacy;
    out$.chooseinit = chooseinit;
    out$.newseedrestore = newseedrestore;
    out$.restorewords = restorewords;
    out$.reviewwords = reviewwords;
  } else {
    out$.offlinewallets = offlinewallets;
    out$.monitor = monitor;
    out$.resources = resources;
    out$.staking = staking;
    out$.verifyseed = verifyseed;
    out$.loading = loading;
    out$.loading2 = loading2;
    out$.wallets = wallets;
    out$.history = history;
    out$.send = send;
    out$.receive = receive;
    out$.locked = locked;
    out$.sent = sent;
    out$.invoice = invoice;
    out$.terms = terms;
    out$.terms2 = terms2;
    out$.privacy = privacy;
    out$.filestorage = filestorage;
    out$.settings = settings;
    out$.chooseinit = chooseinit;
    out$.newseedrestore = newseedrestore;
    out$.search = search;
    out$.resources2 = resources2;
    out$.choosestaker = choosestaker;
    out$.videostorage = videostorage;
    out$.videostoragedetails = videostoragedetails;
    out$.info = info;
    out$.faq = faq;
    out$.claim = claim;
    out$.soundstorage = soundstorage;
    out$.notification = notification;
    out$.restorewords = restorewords;
    out$.reviewwords = reviewwords;
    out$.vote = vote;
    out$.util = util;
  }
}).call(this);