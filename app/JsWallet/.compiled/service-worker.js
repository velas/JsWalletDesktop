// Generated by LiveScript 1.6.0
(function(){
  var doCache, CACHE_NAME, cb, asCallback, urlsToCache;
  doCache = false;
  CACHE_NAME = 'velas-pwa-cache-v1';
  cb = console.log;
  asCallback = function(p, cb){
    p.then(function(res){
      return cb(null, res);
    });
    return p['catch'](function(err){
      return cb(err);
    });
  };
  urlsToCache = ['./', './main-bundle.css', './main-bundle.js'];
  self.addEventListener('activate', function(event){
    var cacheWhitelist;
    console.log('activate', event.waitUntil);
    cacheWhitelist = [CACHE_NAME];
    event.waitUntil(caches.keys().then(function(keyList){
      console.log('caches', caches);
      Promise.all(keyList.map(function(key){
        if (!cacheWhitelist.includes(key)) {
          console.log('Deleting cache: ' + key);
          return caches['delete'](key);
        }
      }));
    }));
  });
  self.addEventListener('install', function(event){
    event.waitUntil(caches.open(CACHE_NAME).then(function(cache){
      return cache.addAll(urlsToCache);
    }));
  });
  self.addEventListener('fetch', function(event){
    if (doCache) {
      event.respondWith(caches.match(event.request).then(function(response){
        return response || fetch(event.request);
      }));
    }
  });
}).call(this);