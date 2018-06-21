// ==UserScript==
// @name        crt.sh links
// @namespace   zb3.crtsh
// @include     https://crt.sh/*
// @version     1.1
// @run-at      document-end
// ==/UserScript==


function makeLinks() {
  for (const dtd of document.querySelectorAll('td.outer > table > tbody > tr > td')) {
    const text = dtd.innerHTML;
    const match = text.match(/^\s*(?:.*\bCN=)?([*][.])?([^<@.]+[.][^<@\s]+)/);
    
    if (match) {
      dtd.innerHTML = '<a href="https://' + match[2] + '">' + text.trim() + '</a>';
    }
  }
}

if (document.readyState === 'loading')
  document.addEventListener('DOMContentLoaded', makeLinks);
else
makeLinks();