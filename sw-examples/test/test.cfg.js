// @serviceworker http://localhost:4000/
// @real-serviceworker http://localhost:4000/samplecache.sw.js

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

// force same-origin where possible, otherwise requestactions won't
// catch scripts even from SW's origin
fixRequestMode = true;

//[what, method, where, destination, content, args]
//sadly modifying User-Agent won't work (browser limitation)
requestActions = [
  ['addHeader', 'GET', path('/headers'), /^/, 'X-CS', '1'],
  ['addHeader', 'POST', path('/whatever'), /^/, 'X-CS', '2'],
  ['removeHeader', 'GET', path('/headers'), /^/, 'x-fail'],
  ['transformHeader', 'GET', path('/headers'), /^/, 'x-ok', ()=>'1'],
  ['transform', 'POST', path('/whatever'), /^/, 
      x => x.replace('is_good=false', 'is_good=true')],
  ['redirect', 'GET', path('/oldpage'), /^/, '/newpage']
];

//[what, where, type|destination, content, *args]
responseActions = [
  ['transform', /./, 'application/javascript', 
    txt => 'console.log("prepend");' + txt],
  ['transform', /./, 'text/html', txt => txt + '<hr>ok'],
  ['transform', path('/alert.js'), 'application/javascript',
    txt => txt.replace(/alert[(]/g, 'console.log(')]
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


// @install file.js /file-on-server.js application/javascript
// @install file.js /file2-on-server.js application/javascript
// @inject file.js

