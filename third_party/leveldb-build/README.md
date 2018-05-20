We build `leveldb.jar` and `leveldb-smali` here.

It's a mess.

We fetch a specific version of `dain/leveldb` and then apply some patches...
See `new-version-experiment` for info about using newer versions.

Note: we can't just build everything using Android SDK, since we want it to work with normal JVM too (to test if we can inject a SW using local chromium installation).
