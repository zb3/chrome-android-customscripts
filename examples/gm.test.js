// ==UserScript==
// @name           gm.test.js
// @author         zb3
// @include        http://nowhere.com/test?yes=no
// @version        0.0.1
// @require        http://localhost:4000/evil.js
// @require        http://localhost:4000/evil.js
// @resource       compiler http://localhost:4000/gm-compile.py
// ==/UserScript==

GM_log('url', GM_getResourceURL('compiler'));
GM_log('url', GM_getResourceText('compiler').substr(0, 40));