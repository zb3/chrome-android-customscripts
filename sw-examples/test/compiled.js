// @serviceworker http://localhost:4000/

(function(){ //avoid scope conflicts
//todo: uncomment out anon func + root scope check

/*
so this version doesn't auto-intercept SWs but requires them to be manually imported via importScripts
(coz it's more sync and cached, which couldn't be achieved otherwise)

real SW support (manual), done this way:
- we reinject event (with spoofed respondWith)
- (that causes network fetch but only when there's a handler that does it)
- instead of doing fetch, we await promise that some handler returned in rW


lateron:
 -to make it more functional, if java injector could support multiple same origin workers, we could practically nearly fully emulate them if we mirror scopes properly


*/

//note: MagicFetchEvent isn't "secure", since attacker can do 
//FetchEvent.prototype.respondWith, which shouldn't work. TODO: check it
/*
NANA!!!
forget about "class MagicFetchEvent extends FetchEvent", that won't work since
super() returns new a object, trashing our proto change

what can be done? wat if we save prototype and forcibly setprototypeof
that's slow... ?

must check if error can be subclassed normally, and check in FF
maybe file a bug, this is annoying

#revisitthis

*/
/*
class MagicFetchEvent extends FetchEvent{
  constructor(arg, init) {
    if (init)
      super(arg, init);
    else
      super(arg.type, arg);
    
    this.response = null;
    this.extensions = [];
  }

  respondWith(what) {
    this.stopImmediatePropagation();
    this.response = what;
  }

  waitUntil(what) {
    this.extensions.push(what);
  }

  forwardExtensions(target) {
    for (const ext of this.extensions) {
      target.waitUntil(ext);
    }
  }
}
*/

{
  // I wish I could write this normally, using "extends", but not possible...
  
  const respondWith = function(what) {
    this.stopImmediatePropagation();
    this.response = what;
  };

  const waitUntil = function(what) {
    this.extensions.push(what);
  };

  const forwardExtensions = function(what) {
    for (const ext of this.extensions) {
      target.waitUntil(ext);
    }
  };

  function createMagicFetchEvent(arg, init) {
    let obj;

    if (init)
      obj = new FetchEvent(arg, init);
    else
      obj = new FetchEvent(arg.type, arg);

    obj.respondWith = respondWith;
    obj.waitUntil = waitUntil;
    obj.forwardExtensions = forwardExtensions;
    obj.response = null;
    obj.extensions = [];
    obj.isMagic = true; //making it easy for our enemies to bypass us >_<

    return obj;
  }
}

var urlReplacePatterns = [];
var urlBlockPatterns = [];
var urlSkipPatterns = [/* we won't intercept these (but rules above have precedence) */];

// force same-origin where possible, otherwise customintercept won't
// catch scripts even from SW's origin
var customInterceptScripts = true;

var customIntercept = [];
var requestIntercept = [];
var stripCSPHeaders = false;
var injectScripts = [];

const scopeURL = new URL(registration.scope);


////////////////////////

// urlRegex works here, 'a.b' -> /^a\.b$/
// 'somefile.js' matches somefile.js somewhere inside the url
// path('somefile[.]js') matches only paths for SW origin (anyPath for any origin)
// domain('@loly.com') matches... domains :O (@ means *. or nothing)

//t0d0: maybe don't expose this
urlReplacePatterns = [
  [path(/intercept[.]me[.]js/i),  'console.log("not doing anything");']
];

urlBlockPatterns = [anyPath('/superminer.js*')]; //will 404
urlSkipPatterns = [
  /* we won't intercept these (but rules above have precedence) */
];

// force same-origin where possible, otherwise customintercept won't
// catch scripts even from SW's origin
customInterceptScripts = true;

//[what, where, type|destination, content, *args]
customIntercept = [
  ['append', /./, 'text/html', '<hr>ok'],
  ['prepend', /./, 'application/javascript', 'console.log("prepend");'],
  ['transform', path('/alert.js'), 'application/javascript',
    txt => txt.replace(/alert[(]/g, 'console.log(')]
];

//[what, method, where, destination, content, args]
//sadly modifying User-Agent won't work (browser limitation)
requestIntercept = [
  ['addHeader', 'GET', path('/headers'), /^/, 'X-CS', '1'],
  ['addHeader', 'POST', path('/whatever'), /^/, 'X-CS', '2'],
  ['removeHeader', 'GET', path('/headers'), /^/, 'x-fail'],
  ['transformHeader', 'GET', path('/headers'), /^/, 'x-ok', ()=>'1'],
  ['transform', 'POST', path('/whatever'), /^/, 
      x => x.replace('is_good=false', 'is_good=true')],
  ['redirect', 'GET', path('/oldpage'), /^/, '/newpage']
];

stripCSPHeaders = false;

//this works for documents served from this origin
injectScripts = [];


/*
  ==== \\  those comments below aren't comments... those are directives :)
  ==== //  injected scripts run at document-start    
    
  // @install [localfile] [path] [mime_type]
  
    [path] = path || #path_pattern#flags
  
    if path(_pattern)?.startswith(/):
      it's matched by pathname for current origin
    else:
      this is matched by url
  
  
  // @inject [localfile]
  
    localfile.encoding === 'utf8'
    injected @ the begining, always
*/




{
const __files = {};__files["file.js"] = base64ToBuffer("Y29uc29sZS5sb2coJ2luamVjdGVkIGZpbGUnKTs=");urlReplacePatterns.push([path(new RegExp("/file-on-server.js", )), __files["file.js"], "application/javascript"]);urlReplacePatterns.push([path(new RegExp("/file2-on-server.js", )), __files["file.js"], "application/javascript"]);injectScripts.push("console.log('injected file');");
}
////////////////////////


function makePattern(pattern, type = 'href', sameOrigin = false) {
  if (pattern instanceof RegExp)
    return { type, pattern, sameOrigin };
  else if (typeof pattern === 'string')
    return { type, pattern: urlRegex(pattern), sameOrigin };

  return pattern;
}

function path(pattern) { return makePattern(pattern, 'pathname', true); }
function anyPath(pattern) { return makePattern(pattern, 'pathname'); }
function domain(pattern) { return makePattern(pattern, 'hostname'); }

function urlRegex(pattern) {
  pattern = pattern.replace(/([^(])\./g, '$1\\.');
  pattern = pattern.replace(/(^|[^)*])\*/g, '$1.*');
  pattern = pattern.replace(/(\/\/)\.\*\\\.|(^|[^(])@/g, '$1$2(.*\\.)?');

  if (pattern.startsWith('?!'))
    return new RegExp('^(?!(' + pattern.slice(2) + ')$)');
  else
    return new RegExp('^(' + pattern + ')$');
}

function matchPattern(pat, url) {
  //note: url here is an URL object, not a string

  return (!pat.sameOrigin || url.origin === scopeURL.origin) && pat.pattern.test(url[pat.type]);
}

//
// now we want to convert bare patterns to object form
//

for (const p of urlReplacePatterns)
  p[0] = makePattern(p[0]);

for (let t = 0; t < urlBlockPatterns.length; t++)
  urlBlockPatterns[t] = makePattern(urlBlockPatterns[t]);

for (let t = 0; t < urlSkipPatterns.length; t++)
  urlSkipPatterns[t] = makePattern(urlSkipPatterns[t]);

// refactor asap...

for (const entry of customIntercept) {
  entry[1] = makePattern(entry[1]);
  entry[2] = (typeof entry[2] === 'string') ? urlRegex(entry[2]) : entry[2];
}

for (const entry of requestIntercept) {
  entry[1] = (typeof entry[1] === 'string') ? urlRegex(entry[1]) : entry[1];
  entry[2] = makePattern(entry[2]);
  entry[3] = (typeof entry[3] === 'string') ? urlRegex(entry[3]) : entry[3];
}
  


const clientFunctions = [], clientRunFunctions = [];

function base64ToBuffer(str) {
  const bstr = atob(str);
  const len = bstr.length;

  const ret = new Uint8Array(len);
  for (let t = 0; t < len; ++t)
    ret[t] = bstr.charCodeAt(t);

  return ret;
}

this.addEventListener('fetch', function (event) {
  if (event.isMagic) //(event instanceof MagicFetchEvent)
    return;

  //console.log(event.request, event.request.url);
  const url = new URL(event.request.url);

  for (const pat of urlBlockPatterns) if (matchPattern(pat, url)) {
    event.respondWith(new Response('', { status: 404, statusText: 'Not Found' }));
    return;
  }

  for (const [pat, content, mime] of urlReplacePatterns) if (matchPattern(pat, url)) {
    const response = new Response(content);

    if (mime)
      response.headers.append('content-type', mime)

    event.respondWith(response);
    return;
  }

  for (const pat of urlSkipPatterns) if (matchPattern(pat, url))
    return;

  // we don't compare by reference, since just chaging mode should mandate
  // manual handling 
  const {requestChanged, request} = requestToHandle(event.request);

  // if the request is a promise or if it was meaningfully changed, we must
  // call respondWith. if we don't need to handle the response, response
  // from other listener is ok

  const response = request instanceof Promise ? 
      processRequestPromise(event, request) 
      : processRequest(event, request, requestChanged);

  if (response)
    event.respondWith(response);
});

async function processRequestPromise(event, request) {
  return processRequest(event, await request, true);
}

function processRequest(event, request, mustRespond=false) {
  const shouldHandle = shouldProcessResponse(request);
  if (!mustRespond && !shouldHandle)
    return;

  const magicEvent = createMagicFetchEvent(event.type, {...event, request});
  self.dispatchEvent(magicEvent);

  magicEvent.forwardExtensions(event);

  if (shouldHandle || (mustRespond && !magicEvent.response)) {
    return handleRequest(request, magicEvent.response);
  } else if (magicEvent.response) {
    return magicEvent.response;
  }
}

async function handleRequest(request, response) {
  if (response)
    response = await response;
  else
    response = await fetch(request);

  var ctype = response.headers.get('content-type');
  if (ctype) ctype = ctype.split(';')[0];

  const url = new URL(response.url || event.request.url);

  //waith, what happens with url?

  const init = { status: response.status, statusText: response.statusText, headers: [] };

  const interceptors = [], addHeaders = [], removeHeaders = [], transformHeaders = {};

  //currently typePat works for mime and .destination... maybe it should only work for destination?

  for (const [mode, urlPat, typePat, content, ...args] of customIntercept)
    if (matchPattern(urlPat, url) && (typePat.test(ctype) ||
      request.destination && typePat.test(request.destination))) {
      if (mode.endsWith('Header')) {
        const header = content.toLowerCase();

        if (mode === 'addHeader')
          addHeaders.push([header, args[0]]);
        else if (mode === 'removeHeader')
          removeHeaders.push(header);
        else
          transformHeaders[header] = args[0];
      }
      else interceptors.push([mode, content]);
    }

  if (stripCSPHeaders)
    removeHeaders.push('content-security-policy');

  let nonce;

  for (const hk of response.headers.keys()) {
    if (removeHeaders.includes(hk))
      continue;

    let val = response.headers.get(hk);

    if (transformHeaders[hk])
      val = transformHeaders[hk](val, hk);

    if (val === null)
      continue;

    init.headers.push([hk, val]);
  }

  for (const header of addHeaders)
    init.headers.push(header);

  for (const header of init.headers) {
    if (header[0] === 'content-security-policy') {
      //we must inject our directives for every CSP header - next headers can restrict things previously allowed
      //note that we assume our inline script will execute before any meta tag could disallow this via csp
      if (!nonce)
        nonce = btoa(String.fromCharCode.apply(null, crypto.getRandomValues(new Uint8Array(10))));

      header[1] = allowNonces(header[1], nonce);
    }
  }

  var prepend = '', append = '', injectedCode = '';
  var responseText = null;

  for (const [mode, content] of interceptors) {
    if (mode === 'prepend') prepend += content + '\n';
    else if (mode === 'append') append += content + '\n';
    else if (mode === 'respond') return new Response(content);
    else if (mode === 'transform') {
      if (responseText === null) responseText = await response.text();
      responseText = await content(responseText, request);
    }
  }

  //we're not intercepting/injecting client funcs into scripts (including workers) - just parsed documents
  const isDocument = request.mode === 'navigate' && ctype === 'text/html';

  if (!prepend && !append && !isDocument && responseText === null) //we wouldn't do anything
    return response;

  if (isDocument) {
    injectedCode = '(function(){';

    for (const f of clientFunctions)
      injectedCode += f.toString() + '\n';

    for (const f of clientRunFunctions)
      injectedCode += f.name + '();\n';

    injectedCode += '})();\n';

    for (const script of injectScripts)
      injectedCode += script + '\n';

    //HACK: maybe find a better solution for dealing with end script tags
    injectedCode = '<script' + (nonce ? ' nonce="' + nonce + '"' : '') + '>' + injectedCode.replace(/<[/]script/g, '<\\/script') + '</script>';
  }

  if (responseText === null) //if not previously read
    responseText = await response.text();

  const doctype = isDocument && responseText.match(/^\s*<!DOCTYPE\s+[^<>]+>/i);
  if (doctype) {
    responseText = doctype[0] + '\n' + prepend + injectedCode +
      responseText.substr(doctype[0].length) + append;
  } else {
    responseText = prepend + injectedCode + responseText + append;
  }

  return new Response(responseText, init);
}


function addToClient(f) { clientFunctions.push(f); return f; }
function runOnClient(f) { addToClient(f); clientRunFunctions.push(f); return f; }


function shouldProcessResponse(request) {
  if (request.mode === 'no-cors')
    return false;

  if (request.mode === 'navigate') //may be document
    return true;

  /*
  todo: this is not exact... we match by request.url here, but in pR we match
  by response url...
  */

  for (const [, urlPat] of customIntercept)
    if (matchPattern(urlPat, request.url))
      return true;

  return false;
}

function requestToHandle(request) {
  let newUrl = null
  let newHeaders = null
  let newBody = false
  let newMode
  
  let url = new URL(request.url);
  
  //caller should compare via reference
  //edit: no
  
  
  const transforms = [], transformHeaders = {};

  
//hat tricks = no newheaders, no removeheaders, headers object not array 
  for (const [mode, methodPat, urlPat, destPat, content, ...args]
        of requestIntercept)
    if (methodPat.test(request.method) && matchPattern(urlPat, url) &&
        destPat.test(request.destination || '')) {
      if (mode.endsWith('Header')) {
        const header = content.toLowerCase();
        if (!newHeaders)
          newHeaders = new Headers();

        if (mode === 'addHeader')
          newHeaders.append(header, args[0]);
        else if (mode === 'removeHeader')
          transformHeaders[header] = null;
        else
          transformHeaders[header] = args[0];
      } else if (mode === 'redirect') {
        url = new URL(content, url.href);
        newUrl = url.href;
      }
      else {
        transforms.push(content);
        newBody = true;
      }
    }
    
    if (customInterceptScripts && request.mode === 'no-cors' && 
        url.origin === new URL(registration.scope).origin)
      newMode = 'same-origin';
      
    if (!newUrl && !newMode && !newHeaders && !newBody)
      return {requestChanged: false, request};
    
    const override = {}
    if (newMode)
      override.mode = newMode;
    
    if (newUrl)
      override.url = newUrl;
    
    if (newHeaders) {
      override.headers = newHeaders;
    
      for (const [key, value] of request.headers) {
        if (transformHeaders[key])
          newHeaders.append(key, transformHeaders[key](value, key))
        else if (transformHeaders[key] !== null)
          newHeaders.append(key, value)
      }
    }
    
    if (newBody) {
      // async arrow functions... clearly a JS overdose...
      
      return {requestChanged: true, request: new Promise(async resolve => {
        let text = await request.text();
        for (const transform of transforms) {
          text = transform(text, request);
        }

        override.body = text;

        resolve(cloneRequest(request, override));
      })};
    } else {
      const newRequest = cloneRequest(request, override);
      //const newRequest = new Request(request, override);

      return {requestChanged: newUrl || newHeaders, request: newRequest};
    }
}

// may return a Promise...
function cloneRequest(base, override) {
  // mayor annoyance: we can't use the constructor to override urls... WHY???
  // mayor annoyance #2: can't clone a request with bodyUsed EVEN IF there's a
  //                     .body in the requestinit object. WTH is that?
  // another annoyance: chrome doesn't yet support streams for request bodies
  
  if (override.url || (base.bodyUsed && override.body)) {
    const config = {};

    // we assume streams don't work, in the future, do it via copying stream ref

    for (const k of Object.keys(Request.prototype))
      if (!override.hasOwnProperty(k) && k !== 'bodyUsed' && k !== 'body' &&
          typeof base[k] !== 'function')
        override[k] = base[k];

    if (override.mode === 'navigate')
      override.mode = 'same-origin';

    if (base.method !== 'GET' &&
        base.method !== 'HEAD' && !override.body) { // we assume !bodyUsed
      // if (!override.body)
      //   override.body = base.body;
      // return new Request(override.url, override);

      return base.arrayBuffer().then(buff => {
        override.body = buff;
        return new Request(override.url, override);
      });
    } else {
      return new Request(override.url, override);
    }
  } else {
    return new Request(base, override);
  }
}

function allowNonces(csp, ...nonces) {
  const newDirs = [];
  let toAppend = '';

  for (const nonce of nonces) {
    toAppend += " 'nonce-" + nonce + "'";
  }

  let hasDefaut = false, scriptSrcDone = false;
  for (let dir of csp.split(';').map(Function.prototype.call, String.prototype.trim)) {
    if (dir.startsWith('script-src')) {
      dir += toAppend;
      scriptSrcDone = true;
    }
    else if (dir.startsWith('default-src'))
      hasDefault = true;

    newDirs.push(dir);
  }

  if (hasDefault && !scriptSrcDone)
    newDirs.push('script-src' + toAppend);

  return newDirs.join('; ');
}


// this version simply disables registering / updating /deleting SWs
// by making navigator.serviceWorker undefined

runOnClient(function interceptSW() {
  Object.defineProperty(Navigator.prototype, 'serviceWorker', { get: () => { } });
});


/*
This version assumes we manually add the proper worker via importScripts, so that client page can't change it.

runOnClient(function interceptSW()
{
 ServiceWorkerContainer.prototype.register = () => navigator.serviceWorker.getRegistration();
 ServiceWorkerRegistration.prototype.update = () => {};
 ServiceWorkerRegistration.prototype.unregister = () => {};
});

*/

ServiceWorkerRegistration.prototype.update = () => { };
ServiceWorkerRegistration.prototype.unregister = () => { };

})();

//and now import real serviceworkers via importScripts
/* IMPORTS HERE */