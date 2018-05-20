// ==UserScript==
// @name        disable stupid app overlay
// @include     https://*.reddit.com/*
// @version     1
// @run-at      document-end
// ==/UserScript==

// this is a React app... in general, we can't just delete the element.. ?

(function(){
  localStorage.optOuts = '{xpromoInterstitial: true}'
  const style = document.createElement('style'); 
  style.appendChild(
    document.createTextNode('.DualPartInterstitial {display: none}'));
  document.head.appendChild(style);
})();
