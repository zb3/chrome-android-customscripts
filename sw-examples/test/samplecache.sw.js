// https://developers.google.com/web/ilt/pwa/caching-files-with-service-worker
// fetch should do normal caching (HTTP caching). SW cache is another one

const version = 'v1';
const assets = [
  '/cachedfile.js'
];

self.addEventListener('install', function(event) {
  event.waitUntil(initCache());
});

self.addEventListener('fetch', function(event) {
  event.respondWith(handleRequest(event.request));
});

async function initCache() {
  const cache = await caches.open(version);
  await cache.addAll(assets);
  console.log('assets cached');
}

async function handleRequest(request) {
  let response = await caches.match(request);
  if (!response) {
    response = await fetch(request);
  }

  return response;
}