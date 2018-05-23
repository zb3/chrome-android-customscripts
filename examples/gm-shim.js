var GM = {};
var GM_info = {
  script: /#ATTRS#/
};

var __GM_RESOURCE_MAP = /#RESOURCES#/;
var GM_log = console.log;

function GM_addStyle(css) {
  'use strict';
  let head = document.getElementsByTagName('head')[0];
  if (head) {
    let style = document.createElement('style');
    style.setAttribute('type', 'text/css');
    style.textContent = css;
    head.appendChild(style);
    return style;
  }
  return null;
}

function GM_registerMenuCommand() {
  //unsupported
}


// XHR + get/setValue shim taken from https://gist.github.com/arantius/3123124
// #region

/*
The MIT License (MIT)

Copyright (c) 2014 Anthony Lieuallen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

// This naive implementation will simply fail to do cross-domain requests,
// just like any javascript in any page would.
function GM_xmlhttpRequest(aOpts) {
  'use strict';
  let req = new XMLHttpRequest();

  __setupRequestEvent(aOpts, req, 'abort');
  __setupRequestEvent(aOpts, req, 'error');
  __setupRequestEvent(aOpts, req, 'load');
  __setupRequestEvent(aOpts, req, 'progress');
  __setupRequestEvent(aOpts, req, 'readystatechange');

  req.open(aOpts.method, aOpts.url, !aOpts.synchronous,
      aOpts.user || '', aOpts.password || '');
  if (aOpts.overrideMimeType) {
    req.overrideMimeType(aOpts.overrideMimeType);
  }
  if (aOpts.headers) {
    for (let prop in aOpts.headers) {
      if (Object.prototype.hasOwnProperty.call(aOpts.headers, prop)) {
        req.setRequestHeader(prop, aOpts.headers[prop]);
      }
    }
  }
  let body = aOpts.data ? aOpts.data : null;
  if (aOpts.binary) {
    return req.sendAsBinary(body);
  } else {
    return req.send(body);
  }
}

function __setupRequestEvent(aOpts, aReq, aEventName) {
  'use strict';
  if (!aOpts['on' + aEventName]) return;

  aReq.addEventListener(aEventName, function(aEvent) {
    let responseState = {
      responseText: aReq.responseText,
      responseXML: aReq.responseXML,
      readyState: aReq.readyState,
      responseHeaders: null,
      status: null,
      statusText: null,
      finalUrl: null
    };
    switch (aEventName) {
      case "progress":
        responseState.lengthComputable = aEvent.lengthComputable;
        responseState.loaded = aEvent.loaded;
        responseState.total = aEvent.total;
        break;
      case "error":
        break;
      default:
        if (4 != aReq.readyState) break;
        responseState.responseHeaders = aReq.getAllResponseHeaders();
        responseState.status = aReq.status;
        responseState.statusText = aReq.statusText;
        break;
    }
    aOpts['on' + aEventName](responseState);
  });
}

const __GM_STORAGE_PREFIX = [
    '', GM_info.script.namespace, GM_info.script.name, ''].join('***');

// All of the GM_*Value methods rely on DOM Storage's localStorage facility.
// They work like always, but the values are scoped to a domain, unlike the
// original functions.  The content page's scripts can access, set, and
// remove these values.  A
function GM_deleteValue(aKey) {
  'use strict';
  localStorage.removeItem(__GM_STORAGE_PREFIX + aKey);
}

function GM_getValue(aKey, aDefault) {
  'use strict';
  let val = localStorage.getItem(__GM_STORAGE_PREFIX + aKey)
  if (null === val && 'undefined' != typeof aDefault) return aDefault;
  return val;
}

function GM_listValues() {
  'use strict';
  let prefixLen = __GM_STORAGE_PREFIX.length;
  let values = [];
  let i = 0;
  for (let i = 0; i < localStorage.length; i++) {
    let k = localStorage.key(i);
    if (k.substr(0, prefixLen) === __GM_STORAGE_PREFIX) {
      values.push(k.substr(prefixLen));
    }
  }
  return values;
}

function GM_setValue(aKey, aVal) {
  'use strict';
  localStorage.setItem(__GM_STORAGE_PREFIX + aKey, aVal);
}

// #endregion


function GM_openInTab(url) {
  return window.open(url);
}

function GM_getResourceURL(name) {
  return __GM_RESOURCE_MAP[name] && __GM_RESOURCE_MAP[name].url;
}

function GM_getResourceText(name) {
  return __GM_RESOURCE_MAP[name] && atob(__GM_RESOURCE_MAP[name].content);
}

GM.info = GM_info;
GM.addStyle = GM_addStyle;
GM.getValue = GM_getValue;
GM.setValue = GM_setValue;
GM.xmlhttpRequest = GM_xmlhttpRequest;
GM.openInTab = GM_openInTab;
GM.registerMenuCommand = GM_registerMenuCommand;
GM.getResourceURL = GM_getResourceURL;
GM.getResourceText = GM_getResourceText;
