# CustomScripts Internals

This chaotic document tries to describe how CustomScripts works. Here I also try to pretend that I know more than nothing about the Chromium source code. 

CustomScripts doesn't modify the native part at all, only the java part is patched. However, most of the chromium source code is written C++, so our capabilities are very limited. Another problem is that more and more code is being moved away from Java (which is reasonable), so the situation gets worse.

## Patching
* We try to write our code in separate classes instead of patching existing ones when possible.
* Classes are compiled with standard JDK, source version 1.7 (this makes them testable on the host w/o additional tools)
* Needed Chromium/Android classes are stubbed, but of course those stubs aren't copied to the target

Our code is compiled and then disassembled into the smali format (java -> dx -> baksmali). smali files for original classes are patched using `patch.py`, and our classes are copied into the `smali_classes2` folder so that they end up in `classes2.dex` (this is to speed up consecutive builds when `classes.dex` aren't modified).
The APK is built using apktool, but since in some configurations the `crazy.libchrome.so` file is stored uncompressed within the APK, the file must be zipaligned. And of course, the APK must be signed



## Injecting scripts:
1. One time init hook before pages can be loaded.

    This is done in `ChromeActivity.initializeCompositor` which is when `ReaderModeManager` is initialized (it also injects scripts, but it uses native methods exported specifically for that purpose)

2. Detecting when a new page is loaded
    * `WebContentsObserver` is used for that purpose. Java version has just a few methods compared to the native one, but others wouldn't be useful anyway.
    * The observer requires a `WebContents` instance, so of course we need to observe every instance created.
    * Since every `WebContents` object is created by the `WebContentsImpl.create` method called by native code, we override it, grab the instance and register the observer there. (but maybe we should use `TabModelSelectorTabObserver`, like `ReaderModeManager` does)
    * In our observer, we override the `documentAvailableInMainFrame` method, which provides the URL currently loaded. Other methods exist, but we can only inject into the main frame anyway.
3. Executing a script in that context 
    * WebContents has those two methods: `evaluateJavaScript` and `evaluateJavaScriptForTests`. The former requires a global set, which the java part can't set, so **we use the latter**. Bad news is that the name suggests this method shouldn't even be there.
    * Those methods execute scripts in the main world, so they have no additional privileges, and globals are shared.
    * Those methods can execute scripts in the main frame only, because there are no separate `WebContents` instances for other frames
    * Those methods are asynchronous, so scripts aren't instantly executed (async IPC is involved under the hood). This makes it impossible to support execution at `document-start` - there's no mechanism to suspend a page until we're done. (Hopefully I am wrong)
 
There's another way to inject scripts into `WebContents` - navigate to a `javascript:` URL. `WebContents` has a `NavigationController` instance. `NavigationController.loadUrl` can load an arbitrary URL (we can even do a POST request!), so it can also deal with `javascript:`. However, Java code can't specify a frame id, and this navigation isn't synchronous either. It's even worse, since the URL size can't exceed 2MB (number not exact).

## Privileged scripts? Nope
Technically there's an interface called `JavascriptInjector`, which also operates on `WebContents`. It doesn't inject any code, but instead it injects globally visible objects which act as interfaces that allow JS code to do things it wouldn't normally be able to. In theory it's possible to use it to make scripts able to use a shared storage and make cross-origin requests (albeit without credentials). **But**, as the name suggests, this is unsafe if the page is not trusted. Of course, web pages aren't :) Our scripts are, but they run in the same "world". 


## Injecting Service Workers
This is done by modifying the LevelDB database and cache files (the "simple backend" only) directly. Theoretically this could be done outside the app / by a separate app as long as it can access chrome's internal storage directory.

For modifying LevelDB files, we use a specific patched version of [this](https://github.com/dain/leveldb) library, which is written entirely in Java. Newer versions / forks aren't compatible though, because they use Java 8+ language features, which require desugaring, but more manual patches are also needed.

"Simple" (not really) cache backed is implemented directly.

Relevant classes in CS:
* `SWDatabase` deals with the database
* `ScriptCache` partially implements the "simple" backend

## Problems

### Memory inefficient
All scripts are loaded into memory at init time. Content is stored in Strings, so a file of size `X` bytes will cause no less than `2X` bytes occupied in RAM, even if it's never used.

One solution is to do "lazy loading", but then what about unloading those files? If files won't ever be unloaded, there's no advantage unless the browser is restarted after some pages are visited.. And is it possible to unload a String from memory? Seems like only the GC can do that.

Still, could be doable:
* `ScriptFile` would have a separate loadCode method
* `CustomScript` would have an use counter and a possibly null code property
* Each WCO would store an usedScripts array, then on URL change, if the new one would no longer use the script, it could decrease the use counter

Maybe another solution would be to `mmap` script files. However in order to inject the code, Strings are needed. So everytime we'd want to inject the code, it'd need to be converted back to a String instance. Does it make any sense?

