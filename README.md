# CustomScripts

This project provides a **limited** support for running userscripts in Chrome on Android. This is done by patching the APK by injecting additional code. No recompilation is needed, only the Java part is patched.

This is only an experiment (a fun one), so while this thing works (with many limitations) on Chrome 66, **there's a high chance it won't work with newer versions**. After all, it relies on internal APIs.

CS can also inject... Service Workers. Service Workers are better at blocking requests, however target origins must be known before injecting (technically, this part could be done outside the app).

## Constraints
Unfortunately, some necessary interfaces are not exposed to the java part, that's why CS is barely useful. I wish this list was shorter...

* limited capabilities compared to GM:
    * injected scripts/serviceworkers have no additional permissions (SOP and CSP are enforced)
    * scripts cannot be injected into frames
    * scripts cannot be injected at `document-start` which makes CS unsuitable for blocking scripts and other page functionality
    * scripts cannot store data (that pages can't access)
* currently all scripts are loaded into memory (stored as... utf16?) when the browser starts, this needs to be fixed asap 
* Service Workers can only be injected into origins directly specified, no wildcards possible
* modifying a script currently requires restarting the browser
* not tested on Android versions other than heavily-modified M
* not guaranteed to work with chrome newer than 65, relies on internal APIs

## How to use

1. Download the original APK
2. Use this tool to produce the patched APK (see below)
a) Delete the original app, or:
b) Specify a new package name when patching
3. Install that
4. Do some magic to produce injectable scripts (in most cases you need to transform them first, see usage)
5. Put them in the approporiate directory (see below, depends on whether the device is rooted)
6. Restart the browser
7. It works (except when it doesn't)

Note that if your device is not rooted, you will need to pass an additional `INSECURE=1` option explained below.


### Patching the APK


<details open>
<summary><b>Using docker</b></summary>

The container needs access to the input APK, and writes the patched one into `/app/apk/patched.apk`.

General usage of the image is:
```
docker run --rm -v HOST_OUTPUT_DIR:/app/apk/ -v INPUT_DIR:/anywhere/ zb3pl/chrome-android-customscripts CONTAINER_APK_PATH [MAKE_OPTIONS]
```
You can also start a shell by passing `-it` to `docker run`.

For example, if you want to patch `/home/h4x0r/chrome.apk` and write the output into `/tmp/`, this should do it:
```
docker run --rm -v /tmp/:/app/apk/ -v /home/h4x0r/:/chrome/ zb3pl/chrome-android-customscripts /chrome/chrome.apk [MAKE_OPTIONS]
```
This should create `/tmp/patched.apk`

</details>




<details>
<summary><b>Directly on linux</b></summary>

### Requirements

You'll need (at least) these installed:
  * Python 3
  * Make
  * Java 7 or 8 (+jdk for generating keystores)
  * Apache Ant


```
git clone https://github.com/zb3/chrome-android-customscripts
cd chrome-android-customscripts
```

Unpack the original APK using apktool into the `chrome` folder:
```
./unpack APK_FILE
```

Patch it using the `make` command:
```
make MAKE_OPTIONS
```

What `make` does, simplified:
  * compiles java source code using Ant (if modified)
  * disassembles that into smali format
  * patches stuff using `patch.py` which then copies the code to `chrome/smali` and `chrome/smali_classes2` folders
  * repacks the apk using apktool, then zipalign and sign
    
If it somehow succeeds, the APK, **apk/patched.apk**, is ready to be installed (or copied directly if the package name matches)

</details>


### Patch options (`MAKE_OPTIONS`)

Separate them by spaces.

* `INSECURE=1` - make CS read from external storage that is accessible to other apps. Currently needed for non-rooted devices
* `NEWPKG=new.package.name` - this makes the patched APK install under different package name. Since the patched APK has a different signature, you must use this if you don't want to uninstall the original app (well, unless you modify `packages.xml`)
* `ENABLE_SW=1` - enable support for injecting Service Workers.

### Where to put scripts

* Rooted: (without `INSECURE=1`)
`CustomScripts` in application's internal storage directory, usually `/data/user/0/PACKAGE/files/CustomScripts`.

* With `INSECURE=1`:
`CustomScripts` in external storage directory, usually  `/storage/emulated/0/CustomScripts`. This is obviously... insecure since other apps can use this to interfere with your browser.

You can always find where CS really looks for scripts using `adb logcat | grep chromemod | grep looking` before starting the app.



### Using CS
* Injecting scripts

  **Note**: if you just want to inject an userscript, see [Injecting userscripts](#injecting-userscripts)

  Every script needs a metadata block with at least one url pattern, then a new line and finally the content. Metadata block has syntax similar to classic userscripts:
  ```
  // @url *://*.domain.com/*
  // @url *://*.domain2.net/*
  // @include *://*.domain3.net/*
  // @exclude *://*.domain3.net/sth
  ```
  URL patterns use "urlRegex" string syntax (see below), which is similar to the classic userscript pattern, but not the same. For example, `?` will not work, use `[?]` instead.

  `@run-at` can be `document-end` (default) or `document-idle`. Other values not supported.

  Injecting at `document-start` isn't supported. This can be achieved only by injecting a Service Worker, which requires the target origin to be known.
  
* Injecting service workers

  **Note:** this requires `ENABLE_SW=1` option set.

  Instead of `@url`, use `@serviceworker`:
  ```
  // @serviceworker https://target.com/
  ```
  Wildcards aren't supported here.
  Also, this is a very low-level interface. To generate a SW that will inject scripts into documents, intercept/block network request, see [swbase](./sw-examples/). You can also get a limited support for cross-origin requests, see [crossfetch](./sw-examples/crossfetch)
* <a id="injecting-userscripts"></a> **Injecting userscripts**

  To inject scripts that use `@require`, `@resource` or some GM apis, you need to transform them first using `gm-compat/gm-compile.py`, like this:
  ```
  python3 gm-compat/gm-compile.py INPUT_FILE_OR_URL OUTPUT_FILE
  ```
  Then try injecting the output file.

  However, this isn't magic. This just downloads and inlines all dependencies, and polyfills **some** GM specific functions (like `GM_addStyle`). Scripts gain no new privileges this way, so for instance cross-origin XHR won't work and `GM_setValue` is per-domain. See [gm-compat](./gm-compat)

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
  