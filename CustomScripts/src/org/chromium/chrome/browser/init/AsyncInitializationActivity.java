package org.chromium.chrome.browser.init;

import android.content.Context;
import org.chromium.ui.base.ActivityWindowAndroid;

public class AsyncInitializationActivity extends Context {
    //normally this field is private, but PG inlines it's getter
    public ActivityWindowAndroid mWindowAndroid;
}
