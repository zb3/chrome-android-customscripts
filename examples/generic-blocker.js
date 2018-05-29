// copying this file to the CustomScripts directory will have no effect!
// must be injected by a SW. injecting this normally won't work, 
// it'll be too late to block stuff


(function() {

/*
- currenly we don't observe attribute or content changes 
- inline script blocking is something that shouldn't work, but actually works,
  possibly as a result of some race condition....

- blocking whole scripts works much better than blocking their actions
- blocking connections should be done via SW when possible, we don't block all
  kinds of connections here
- we don't support iframes here at all.
  The only thing we can do is to block them

- this can be bypassed - we use functions that may be overwritten at runtime,
  but we don't want a complete fight here, since the code would look horrible
- this can be easily bypassed - evil scripts may use original APIs via
  iframe.name + srcdoc trick and MANY MORE tricks

- philosophy here is to block all scripts that would want to bypass us
  BEFORE they do. This is possible but may cause pages to stop working.
*/


//what or [what, where]
//patterns except selectors use urlRegex syntax

const config = {
  dontRun: [
    //'banking.site.com',
    //'@mysite.com'
  ],

  // css selectors - other filters are not
  filterElements: [
    //'#whole-page-useless-spamletter-overlay',
    //'header > .annoying-animated-element',
    //'marquee',
    //['img', wholeUrl('*://(*.)?site.com/noimgs/*')]
  ],

  // this filters scripts by content
  // watch out for <iframe srcdoc="..."> though
  filterInlineScripts: [
    // /function[(]i,s,o,g,r,a,m[)]/,
    //
  ],

  //this is for <script> sources
  filterSources: [
    'pagead2.googlesyndication.com',
    'www.googletagmanager.com',
    '@google-analytics.com',
    'connect.facebook.net',
    'static.criteo.net',
  ],

  // not so reliable, but can block WebSockets and WebRTC too
  filterConnectSources: [
    //[wholeUrl('(stun|turn):*'), '?!webrtcok.here.com'],
    //wholeUrl('turn:turn.evilsite.com'),
  ],

  // this is for matching functions executed inside timers by
  // their source as string
  // TODO: use this for DCL/onload ?
  filterTimers: [],

  // set this to true if this is not injected at the document start
  // script blocking won't work, but element filtering should (not instantly)
  lateStart: false
};


//########################################

// if this was included as a non-inline script with data-blocker-config set,
// merge config from the script tag content
if (this['document'] && document.currentScript 
    && document.currentScript.dataset.blockerConfig) {
  Object.assign(config, eval(document.currentScript.text));
}

const currentScript = Object.getOwnPropertyDescriptor(
    Document.prototype, 'currentScript').get.bind(document);

let blockedCurrentScript = null;

makePatterns(config.filterElements, x => x);
makePatterns(config.filterInlineScripts, textPattern);
makePatterns(config.filterTimers, textPattern);
makePatterns(config.filterSources, urlPattern);
makePatterns(config.filterConnectSources, urlPattern);


for (const pattern of config.dontRun) {
  if (checkLocation(urlPattern(pattern)))
    return;
}

function wholeUrl(pattern) {
  return {type: 'href', pattern};
}

function path(pattern) {
  return {type: 'pathname', pattern};
}

function urlRegex(pattern) {
  const invert = pattern.startsWith('?!');
  if (invert)
    pattern = pattern.slice(2);

  pattern = pattern.replace(/([^(])\./g, '$1\\.');
  pattern = pattern.replace(/(^|[^)*[])\*/g, '$1.*');
  pattern = pattern.replace(/\.\*:\/\//g, '[^/]+://');
  pattern = pattern.replace(/(^|[(|]|\/\/)(@|\.\*\\\.)/g, '$1([^/]*\\.)?');
  pattern = pattern.replace(/\^($|\)|\|)/g, '([?#].*)?$1');

  if (invert)
    return new RegExp('^(?!(' + pattern + ')$)');
  else
    return new RegExp('^(' + pattern + ')$');
}

function textPattern(pattern) {
  const type = typeof pattern;
    
  if (type === 'string')
    return urlRegex(pattern);
  else if (type === 'function')
    return {test: patterns[f]};
    
  return pattern;
}


function urlPattern(pattern) {
  if (typeof pattern !== 'object' || pattern instanceof RegExp)
    pattern = {type: 'hostname', pattern};
    
  pattern.pattern = textPattern(pattern.pattern); //pattern pattern pattern
  return pattern;
}

function makePatterns(patterns, func) {
  for (let f=0; f<patterns.length; f++) {
    if (Array.isArray(patterns[f])) {
      let [what, where] = patterns[f];
      patterns[f] = {what: func ? func(what) : what,
                     where: urlPattern(where)};
    }
    else
      patterns[f] = {what: func ? func(patterns[f]) : patterns[f],
                     where: null};
  }
}

function checkPatterns(patterns, str, asUrl=false) {
  var url;

  if (asUrl) {
    try {
      url = new URL(str, location);
    } catch (e) {
      return false; //false?
    }  
  }
  for (const {what, where} of patterns) {
    if (checkLocation(where) && (!asUrl && what.test(str) || 
        asUrl && what.pattern.test(url[what.type])))
          return true;
  }
    
  return false;
}

function checkLocation(loc) {
  return (!loc || loc.pattern.test(location[loc.type]))
}

function connectBlocked(url) {
  return checkPatterns(config.filterConnectSources, url, true);
}

const setBlockedScript = () => { blockedCurrentScript = currentScript() }; 

//what triggers setBlockedScript? your code :)
//this is a mechanism to block particular scripts before they can fight with us
//note that attackers can wrap their function in async/promise callbacks
//and bypass this (todo maybe catch load/DCL event and filter by source?)

const checkBlockedScript = () => {
  if (blockedCurrentScript && currentScript() === blockedCurrentScript)
    return true;
  else if (blockedCurrentScript)
    blockedCurrentScript = null;
  
  return false;  
};

function shouldRemoveElement(el, skipSelectors = false) {
  if (!skipSelectors) for (const { what, where } of config.filterElements)
    if (checkLocation(where) && el.matches(what))
      return true;

  if (el.tagName === 'SCRIPT' &&
      checkPatterns(config.filterInlineScripts, el.innerHTML))
    return true;

  if (el.src && checkPatterns(config.filterSources, el.src, true))
    return true;

  return false;
}

const mo = new MutationObserver((() => {
  let lastNextElement = null;
  let lastNewElement = null;
  
  const nextElement = (el, skipChildren=false, parentBound=null) => {
    if (!skipChildren && el.childElementCount)
      return el.children[0];
    
    while(el.nextElementSibling === null && 
          el.parentNode && el !== parentBound)
      el = el.parentNode;
  
    if (el === parentBound)
      return null;
  
    return el.nextElementSibling;
  };
  
 
  const elementNode = Node.ELEMENT_NODE;
 
  return (records) => {
    for (const record of records) {

      for (const node of record.addedNodes) {
        if (node.nodeType !== elementNode)
          continue;
          
        let el = node;
        let stopElement = nextElement(el, true);
        let shouldDescend = el !== lastNextElement;
        let thisLastElement;
                
        if (shouldDescend)
          lastNewElement = el;
                
        // we don't even visit this element if exactly the same element 
        // was seen and visited before
        
        while(shouldDescend && el !== stopElement) {
          let removed = false;
          
          removed = shouldRemoveElement(el);

          if (removed) {
            const thatEl = el;
            
            // if this was removed, there's no point in visiting children
            el = nextElement(el, true);
            
            thatEl.remove();
          } else {
            el = nextElement(el);
          }
        }
        
        //node, not el
        lastNextElement = nextElement(node, false, lastNewElement);
      }
    }
  };
})());

mo.observe(document.documentElement, {
  childList: true,
  subtree: true
});

if (config.lateStart) {
  // too late to remove scripts, they will execute anyway

  for (const { what, where } of config.filterElements) {
    if (!checkLocation(where))
      continue;

    for (const el of document.querySelectorAll(what))
      el.remove();
  }
}

const patchedForBlockedScripts = (orig, returnObj=false) => function() {
  if (checkBlockedScript())
    return returnObj ? {} : undefined;

  return orig.apply(this, arguments);
};

const patchGSForBlockedScripts = (obj, name) => {
  const desc = Object.getOwnPropertyDescriptor(obj, name);
  const oGet = desc.get, oSet = desc.set;
  
  desc.get = function() {
    if (checkBlockedScript())
      return;
      
    return oGet.apply(this, arguments);
  };

  desc.set = function() {
    if (checkBlockedScript())
      return;
      
    return oSet.apply(this, arguments);
  };

  Object.defineProperty(obj, name, desc);
};


{
  // scripts added via appendChild / insertBefore can't be removed by MO 
  // (too late), so we need to remove them here. of course this can easily
  // be bypassed, so a script trying to do that should be blocked first
  
  const oAC = Node.prototype.appendChild, oIB = Node.prototype.insertBefore;
  const shadow = (orig) => function(el) {
    if (checkBlockedScript() || shouldRemoveElement(el, true))
      return {};
     
    return orig.apply(this, arguments);
  };

  Node.prototype.appendChild = shadow(oAC);
  Node.prototype.insertBefore = shadow(oIB);
}

//sample static patches for blocked scripts
Document.prototype.createElement =
        patchedForBlockedScripts(Document.prototype.createElement, true);
patchGSForBlockedScripts(Element.prototype, 'innerHTML');
//+ replaceChild, insertBefore, insertAdjacentElement and so on

//end


{
  const oST = setTimeout, oSI = setInterval, oRAF = requestAnimationFrame;

  const shadowTimer = (orig) => function (arg) {
    if (checkBlockedScript())
      return -1;

    if (config.filterTimers.length) {
      const source = typeof arg === 'string' ?
        arg : Function.prototype.toString.call(arg);
      if (checkPatterns(config.filterTimers, source))
        return;
    }

    return orig.apply(this, arguments);
  };

  setTimeout = shadowTimer(oST);
  setInterval = shadowTimer(oSI);
  requestAnimationFrame = shadowTimer(oRAF);
}


{
  const open = XMLHttpRequest.prototype.open;
  const newOpen = function (_, url) {
    if (!checkBlockedScript() && !connectBlocked(url))
      open.apply(this, arguments);
  };

  XMLHttpRequest.prototype.open = newOpen;
}

{
  const oFetch = fetch;

  fetch = function (a) {
    if (!checkBlockedScript() && (typeof a === 'string' && !connectBlocked(a) ||
        typeof a === 'object' && a && !connectBlocked(a.url)))
      return oFetch.apply(this, arguments);

    return new Promise(() => { });
  };
}

{
  const oWebSocket = WebSocket;
  const newWebSocket = function (url) {
    if (!checkBlockedScript() && !connectBlocked(url))
      return Reflect.construct(oWebSocket, arguments);
  }
  newWebSocket.prototype = oWebSocket.prototype;
  newWebSocket.prototype.constructor = newWebSocket;

  window.WebSocket = newWebSocket;
}

{
  const oEventSource = EventSource;
  const newEventSource = function (url) {
    if (!checkBlockedScript() && !connectBlocked(url))
      return Reflect.construct(oEventSource, arguments);
  }
  newEventSource.prototype = oEventSource.prototype;
  newEventSource.prototype.constructor = newEventSource;

  window.EventSource = newEventSource;
}

{
  const srcDesc = Object.getOwnPropertyDescriptor(Image.prototype, 'src');
  const srcSetter = srcDesc.set;

  srcDesc.set = function (v) {
    if (!checkBlockedScript() && !connectBlocked(v))
      srcSetter.apply(this, arguments);
  };

  Object.defineProperty(Image.prototype, 'src', srcDesc);
}

{
 const RTCCfgOk = (cfg) => {
   if (!config || !config.servers)
     return true;
  
   if (srv.url && connectBlocked(srv.url))
     return false;
  
   if (srv.urls && !Array.isArray(srv.urls) && connectBlocked(srv.urls))
     return false;
     
   if (srv.urls) for (const url of srv.urls)
     if (connectBlocked(url))
       return false;
  
   return true;
 };
  
 const oCreateOffer = RTCPeerConnection.prototype.createOffer;
 const oCreateAnswer = RTCPeerConnection.prototype.createAnswer;
 
 const createShadow = (orig) => function() {
   const config = this.getConfiguration();
   
   if (!checkBlockedScript() && RTCCfgOk(config))
     return orig.apply(this, arguments);
 
   return new Promise(()=>{});
 };
 
 RTCPeerConnection.prototype.createOffer = createShadow(oCreateOffer);
 RTCPeerConnection.prototype.createAnswer = createShadow(oCreateAnswer);
} 


///
/// custom logic for uponit
///

{
  const desc = Object.getOwnPropertyDescriptor(
    HTMLIFrameElement.prototype, 'name');
  const oSet = desc.set;

  desc.set = function () {
    if (this.srcdoc === 'a' && this.style.display === 'none') {
      setBlockedScript();
      throw new Error('nope');
    }

    return oSet.apply(this, arguments);
  };

  Object.defineProperty(HTMLIFrameElement.prototype, 'name', desc);
}


})();
