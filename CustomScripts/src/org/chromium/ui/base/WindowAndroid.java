package org.chromium.ui.base;

import org.chromium.base.annotations.CalledByNative;

public class WindowAndroid {
    public interface PermissionCallback {
        void onRequestPermissionsResult(String[] permissions, int[] grantResults);
    }

    
    @CalledByNative
    public final boolean hasPermission(String permission) {
        return true;
    }

    @CalledByNative
    public final boolean canRequestPermission(String permission) {
        return true;
    }
    
    public final void requestPermissions(String[] permissions,
            PermissionCallback callback) {

    }

}
