// ==UserScript==
// @name        crt.sh links
// @namespace   zb3.crtsh
// @include     https://crt.sh/*
// @version     1
// @run-at      document-end
// ==/UserScript==


function makeLinks() {
  for (const dtd of document.querySelectorAll('td.outer > table > tbody > tr > td')) {
    if (/^[^<@.]+[.][^@<]+$/.test(dtd.innerHTML)) {
      const url = dtd.innerHTML.trim();
      dtd.innerHTML = '<a href="https://' + url + '">' + url + '</a>';
    }
  }
}

if (document.readyState === 'loading')
  document.addEventListener('DOMContentLoaded', makeLinks);
else
  makeLinks();