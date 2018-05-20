// @serviceworker https://site.com/
// you can specify real SW via "// @real-serviceworker https://site.com/sw.js"

// compile via python compile-swbase.py sample.cfg.js sw.js
// see test/test.cfg.js for more complete example

// urlRegex works here, 'a.b' -> /^a\.b$/
// 'somefile.js' matches somefile.js somewhere inside the url
// path('somefile[.]js') matches only paths for SW origin (anyPath for any origin)
// domain('@loly.com') matches... domains :O (@ means *. or nothing)

urlReplacePatterns = [
  //[path(/intercept[.]me[.]js/i),  'console.log("not doing anything");']
];

// they will 404
urlBlockPatterns = [
  //anyPath('/superminer.js*')];
];

urlSkipPatterns = [
  /* we won't intercept these (but rules above have precedence) */
];

// force same-origin where possible, otherwise requestactions won't
// catch scripts even from SW's origin
fixRequestMode = true;

//[what, method, where, destination, content, args]
//sadly modifying User-Agent won't work (browser limitation)
requestActions = [
  //['addHeader', 'GET', path('/headers'), /^/, 'X-Test', '1'],
  //['removeHeader', 'GET', path('/headers'), /^/, 'X-fail'],
  //['transformHeader', 'GET', path('/headers'), /^/, 'x-ok', ()=>'1'],
  //['transform', 'POST', path('/whatever'), /^/, 
  //    x => x.replace('is_good=false', 'is_good=true')],
  //['redirect', 'GET', path('/oldpage'), /^/, '/newpage']
];

//[what, where, type|destination, content, *args]
responseActions = [
  //['transform', path('/alert.js'), 'application/javascript/,
  //  txt => txt.replace(/alert[(]/g, 'console.log(')]
];


stripCSPHeaders = false;

//this works for documents served from this origin
injectScripts = [];

// uou can also inject scripts from files, and install arbitrary files on
// a given location. See test/test.cfg.js
// unindent lines below to make them working

  // @install file.js /file-on-server.js application/javascript
  // @install file.js /file2-on-server.js application/javascript
  // @inject file.js




