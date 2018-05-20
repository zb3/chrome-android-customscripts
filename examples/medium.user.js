// ==UserScript==
// @name        disable annoying popup on medium.com
// @include     https://medium.com/*
// @version     1
// @run-at      document-end
// ==/UserScript==

// let's NOT make things official

localStorage.setItem('last-seen-prompt-timestamp', Date.now());