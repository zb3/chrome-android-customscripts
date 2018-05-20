package org.chromium.base;

import org.chromium.base.annotations.CalledByNative;

public abstract class PathUtils {
    @CalledByNative
    public static String getDataDirectory() {
       return "/dummy/dir";
    }
}