Does not work. No need to make it work since old version works.

Already done:
* Use `desugar` (this needs `android.jar` from Android SDK)
* Use `24.1-android` version of guava

Needs at least this:
* Change `Long.parseUnsignedLong` to `com.google.common.primitives.UnsignedLongs.parseUnsignedLong`
* Change `Long.toUnsignedString` to `com.google.common.primitives.UnsignedLongs.toString`
* Change `List.sort` to `Collections.sort`

detect more by building with:
```
options.bootstrapClasspath = files(ANDROID_JAR)
```