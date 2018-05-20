# CustomScripts

This is an attempt at patching mobile chrome to inject scripts into websites. Note the experimental nature of this project, it was built mainly to test if something like that can be possible, and to see how. It works, but it has many limitations, and therefore it can't be considered a tool to run GreaseMonkey scripts for chrome on Android. Also, **it's not an ad blocker** and not a "privacy" related fork of the browser.

It was "tested" against Chrome 66 (but see constraints), and **there's a high chance it won't work with newer versions**.
Hopefully, some parts of this can be reused for other purposes... 

CS can also inject... Service Workers. Service Workers are better at blocking requests, however target origins must be known before injecting (technically, this part could be done outside the app)

## Constraints
* limited capabilities compared to GM:
    * injected scripts/serviceworkers have no additional permissions (CSP applies to them)
    * scripts cannot be injected into frames
    * scripts cannot be injected at `document-start` which makes CS unsuitable for blocking scripts and other page functionality
    * not directly compatible with some userscripts (different url pattern, no GM_ functions)
    * scripts cannot store data (that pages can't access)
* Service Workers can only be injected into origins directly specified, no wildcards possible
* modifying a script currently requires restarting the browser
* requires at least Android L (can be worked around though, problems with multidex and possibly other)
* not tested on Android versions other than M
* tested only on heavily-modified Android
* not guaranteed to work with chrome newer than 65, relies on internal APIs

## How to use

1. Download the original APK
2. Use this repo to produce the patched APK (see building), which can optionally have a different package name
3. Install that
4. Do some magic to produce injectable scripts (see usage)
5. Put them in the approporiate directory (see below)
6. It works (except when it doesn't)

### Requirements

To be able to patch the APK, you'll need (at least) these installed:
  * a shell compatible with bash
  * Python 3
  * Make
  * Java (+jdk for generating keystores)
  * Apache Ant

**But** if your OS is not linux, you'll need to remove the `third_party/build-tools` directory and download a copy for your OS

### Building

```
git clone https://github.com/zb3/chrome-android-customscripts
cd chrome-android-customscripts
```

Unpack the original APK using apktool into chrome folder:
```
./unpack APK_FILE
```

Patch it using the `make` command. There are two variants.   
* For rooted devices
  ```
  make
  ```
  and then CS will look for scripts in the application's internal storage directory, usually `/data/user/0/PACKAGE/files/CustomScripts`.

* Insecure variant for non-rooted devices:
  ```
  make INSECURE=1
  ```
  and then CS will look for scripts in the external storage directory, usually  `/storage/emulated/0/CustomScripts`. This is obviously insecure since other apps can use this to interfere with your browser.

In both cases, you can find where CS looks for scripts using `adb logcat | grep chromemod | grep`
  
Often you'll need to pass another argument to make - `NEWPKG` which let's you change resulting package name. If you don't do this, the app won't install unless you uninstall the previous version (signature mismatch), which is sometimes impossible without root access (system chrome app).
```
make NEWPKG=com.me.chrome
```

There's also `NO_SW=1` - use this to build without service workers support. Maybe this way the resulting APK won't crash all the time
   
   
What `make` does, simplified:
  * compiles java source code using Ant (if modified)
  * disassembles that into smali format
  * patches stuff using `patch.py` which then copies the code to `chrome/smali` and `chrome/smali_classes2` folders
  * repacks the apk using apktool, then zipalign and sign
    
If it somehow succeeds, the APK, **chrome/dist/chrome.apk**, is ready to be installed (or copied directly if the package name matches)

### Using CS
* Injecting scripts

  Every script needs a metadata block with at least one url pattern, then a new line and finally the content. Metadata block has syntax similar to classic userscripts:
  ```
  // @url *://*.domain.com/*
  // @url *://*.domain2.net/*
  // @include *://*.domain3.net/*
  // @exclude *://*.domain3.net/sth
  ```
  URL patterns use "urlRegex" string syntax (see below), which is similar to the classic userscript pattern, but not the same. For example, `?` will not work, use `[?]` instead.

  `@run-at` can be `document-end` (default) or `document-idle`. Other values not supported.

  **Note**: things like `@require`, `@connect` or `GM_*` functions aren't supported.

  Injecting at `document-start` isn't supported. This can be achieved only by injecting a Service Worker, which requires the target origin to be known.
  
* Injecting service workers

  Instead of `@url`, use `@serviceworker`:
  ```
  // @serviceworker https://target.com/
  ```
  Wildcards aren't supported here.
  Also, this is a very low-level interface. To generate a SW that will inject scripts into documents, intercept/block network request, see [swbase](./sw-examples/). You can also get a limited support for cross-origin requests, see [crossfetch](./sw-examples/crossfetch)

To instruct CS to inject files, copy them into the directory CS is looking for scripts :)


## urlRegex
urlRegex can be either a `RegExp` instance or a string. If it's a string, it's converted to `RegExp` with these modifications:
* any `.` not preceded by `(` is escaped (dot is not a special character in most cases)
* any `*` not preceded by `)` or `*` is replaced with `.*` (`*` works as a glob)
* any `@` or `.*` at the begining or preceded by `//` or `(` or `|` is replaced with `(.*\.)?` (this is for matching the domain and its subdomains)
* any `^` at the end or followed by `)` or `|` is replaced with `([?#].*)?` (this is to make `^` match optional query strings or hash parameters)
* the expression is wrapped in `^()$`, or in `^(?!()$)` if it starts with `?!` (which is then stripped). This is to avoid the need for usual ^$ and also it allows us to invert the expression, so `?!abc` matches anything but `abc`

Example:
```
*://*.domain.com/file.js^
```


## Credits
 * [apktool](https://github.com/iBotPeaches/Apktool) is used to unpack & repack the APK
 * [smali](https://github.com/JesusFreke/smali) is used under the hood, and also patches are done at the smali level
 * [leveldb](https://github.com/dain/leveldb) enables CS to inject Service Workers into chrome's internal database
 * android build-tools is used to prepare the APK to be installed
 
 See [third_party](./third_party)
  