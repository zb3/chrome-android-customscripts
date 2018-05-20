// ==UserScript==
// @name        quora without registration
// @include     https://*.quora.com/*
// @version     1
// @run-at      document-end
// ==/UserScript==

document.body.classList.remove('signup_wall_prevent_scroll');
document.querySelector('.BaseSignupForm').parentElement.remove();