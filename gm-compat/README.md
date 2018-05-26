
# gm-compat

```
python gm-compile.py source_file_or_url destination_file
```

* Wraps script in an anonymous function to prevent scope pollution
* Downloads and inlines dependencies specified by `@require` and `@resource` (but doesn't execute the latter)
* Polyfills `unsafeWindow` and most of the GM APIs
* Compiles url patterns into regex form

Supported APIs: (`GM_sth` implies `GM.sth` support)
* `unsafeWindow` is just `window`, but it's the real one
* `GM_info` - `script` property is supported
* `GM_addStyle`
* `GM_getValue`/`GM_setValue`/`GM_deleteValue`/`GM_listValues` use localStorage, which is obviously per-origin and readable by pages, polyfill from https://gist.github.com/arantius/3123124
* `GM_xmlhttpRequest` can't make cross-origin requests (except those allowed by CORS), polyfill from https://gist.github.com/arantius/3123124
* `GM_openInTab` is just `window.open`
* `GM_getResourceURL`/`GM_getResourceText` - resources inlined via `gm-compile.py`. In order to make resource URLs fetchable, they are replaced with base64 encoded data URIs.
* `GM_setClipboard` only supports copying text and uses `document.execCommand`, so it requires user interaction.

These are defined but do nothing:
* `GM_registerMenuCommand`/`GM_unregisterMenuCommand`
* `GM_notification`

`GM_download` can be polyfiled by including `https://gist.github.com/ccloli/832a8350b822f3ff5094`, but in most cases it won't work because  cross-origin requests aren't supported. It's better to just show a link...


