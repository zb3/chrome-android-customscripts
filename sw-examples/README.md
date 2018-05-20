# swbase

CS can inject Service Workers, which can block/replace/intercept requests. But that requires some boilerplate code in the SW to get it working, and also `navigator.serwiceWorker` must be blocked so that a page can't reinstall the original SW. `swbase` tries to provide that boilerplate...

1. Specify what you want your SW do to / what to inject in a config file, described here
2. Run `python swbase-compile.py [config file] [output]` which will produce a ready-to-inject SW file, that should do what was specified.
3. Instruct CS to inject that file as a SW by copying it


## Config file
See `sample.cfg.js` and `test/test.cfg.js` for examples.

Target origin(s) need to be first, these directives are preserved by the compiler:
```
// @serviceworker https://target.com/
```
If `target.com` already had a SW, there's a limited support for including original SWs (they must be specified at compile time) via the `real-serviceworker` directive:
```
// @real-serviceworker https://target.com/sw.js
```

Now we can define what our SW should do.

### Block URLs
via `urlBlockPatterns` array of `<urlPattern>`:
```
urlBlockPatterns = [domain('pagead2.googlesyndication.com')]
```
This doesn't block requests made by WebSockets and WebRTC.

### Inject a script 
via `injectScripts` array:
```
injectScripts = ['console.log(/ok/);']
```
This is injected into all documents (not scripts) served from the origin in a `<script>` tag, just after `DOCTYPE`. If CSP headers are set, swbase adds a nonce to the headers and this tag, so it should work.

### Inject a script from file
via `inject` directive:
```
// @inject file_present_on_disk.js
```
Compiler reads that file and appends its contents to the `injectScripts` array.

### Modify the response
via `responseActions` array.
To modify the response text:
```
['transform', <urlPattern>, mimePattern|type, (responseText, request) => newText|Promise]
```
To modify response headers:
```
['addHeader', <urlPattern>, mimePattern|type, key, value]
['removeHeader', <urlPattern>, mimePattern|type, key]
['transformHeader', <urlPattern>, mimePattern|type, key, (value, key)=>newValue]
```
Of course this works only for responses that have the origin this SW controls.
Note: `type` here corresponds to `Request.destination`
```
responseActions = [
    ['transform', /./, 'application/javascript',
    txt => txt.replace(/alert[(]/g, 'console.log(')]
]
```



### Modify the request
via `requestActions` array. To modify the request body text (not for binary requests):
```
['transform', methodPattern, <urlPattern>, mimePattern|type, (requestText, request) => newText|Promise],
```
To redirect: (same origin required)
```
['redirect', methodPattern, <urlPattern>, mimePattern|type, newLocationRelativeToPrevious]
```

To change request readers (kinda): 
```
['addHeader', methodPattern, <urlPattern>, mimePattern|type, key, value]
['removeHeader', methodPattern, <urlPattern>, mimePattern|type, key]
['transformHeader', methodPattern, <urlPattern>, mimePattern|type, (value, key)=>newValue]
```
Unfortunately it's not currently possible to change the `User-Agent` header.
```
requestActions = [
  // path('/*') means everything served from the origin controlled by the SW
  ['addHeader', /^/, path('/*'), /^/, 'X-Access-OK', '1'],
  ['transform', 'POST', path('/add_stuff'), /^/, 
      x => x.replace('is_good=false', 'is_good=true')]
];
```


### Serve a file on a given path
via `install` directive:
```
// @install file-on-disk.js /file-on-server.js application/javascript
```
In this case the origin must match. But you can do:
```
// @install file-on-disk.js https://abc.com/abc.js application/javascript
```
or
```
// @install file-on-disk.js #*://test.*.com/file[0-9].js# application/javascript
```
In all cases, the compiler will read the (possibly binary) file, embed it in the resulting SW, and return this with a `200` status when requested.

## SRI note
swbase doesn't deal with Subresource Integrity when intercepting responses. You'll need to transform the response which contains SRI attributes and/or inject scripts preventing dynamic use of SRI.

## Specifying urls

`<urlPattern>` can be:
* `<pattern>` - to match the whole URL
* `path(<pattern>)` - to match by path, only for SWs origin
* `anyPath(<pattern>)` - to match by path
* `domain(<pattern>)` - to match by..... hmm... by domain names?

While `<pattern>` is the same as `urlRegex` as described in the main doc (a RegExp or a string)

### Everything else
Edit `swbase.src.js` :)

## Technical notes

* "real" SW is loaded via `importScripts` (that's why it must be known at compile time - can't use async APIs), but swbase also needs to redispatch fetch events (spoofing `respondWith`) so that fetch events can work (in some cases)
* `navigator.serviceWorker`'s `register`/`update`/`unregister` are replaced with empty functions to prevent the page from interfering with our SW. This is done via `injectScripts`





