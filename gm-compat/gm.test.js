// ==UserScript==
// @name           gm.test.js
// @author         zb3
// @include        http://nowhere.com/test?yes=no
// @version        0.0.1
// @require        http://localhost:4004/file1.js
// @require        http://localhost:4004/file1.js
// @require        file1.js
// @resource       test http://localhost:4004/file2.js
// @resource       compiler ./gm-compile.py
// ==/UserScript==

GM.log(GM_info);
GM_setValue('abc', '123');
GM_log(GM_getValue('abc'));
GM_log(GM_listValues());
GM_deleteValue('abc');
GM_log(GM_getValue('abc'));
GM_log(GM_getValue('abd', 404));

GM_log('url', GM_getResourceURL('test'));
GM_log('url', GM_getResourceText('test').substr(0, 40));

GM_setClipboard('c0p13d');

GM_registerMenuCommand(GM_unregisterMenuCommand(GM_notification()))

GM.xmlHttpRequest({
  method: "GET",
  url: "https://api.github.com/",
  onload: function(response) {
    GM_log('GH response', response.responseText);
  }
});

GM_addStyle('body {background: #eee}');
GM.addStyle('body {border: 20px solid #aaa}');

GM_log('starting async tests');

// since we can do things like await "notapromise", use .then for testing

GM.setValue('v', '123').then(x => GM.getValue('v'))
  .then(v => (GM_log('got', v),GM.deleteValue('v'))).then(x => GM.listValues())
  .then(v => (GM_log('values', v),GM.getResourceUrl('compiler')))
  .then(v => GM_log('compiler', v));

unsafeWindow.copyText = function() {
  GM_setClipboard('copied');
};

unsafeWindow.openInTab = function() {
  GM.openInTab('https://google.com/');
};

// won't
setTimeout(_ => GM_setClipboard('copied w/o interaction'), 4000);