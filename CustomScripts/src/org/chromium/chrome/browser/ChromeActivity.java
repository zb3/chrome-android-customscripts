package org.chromium.chrome.browser;

import org.chromium.chrome.browser.init.AsyncInitializationActivity;
import pl.zb3.customscripts.CustomScriptsManager;

public class ChromeActivity extends AsyncInitializationActivity {
    //not the whole method - append this
    public void initializeCompositor() {
        CustomScriptsManager.init(
                ((AsyncInitializationActivity)this).mWindowAndroid, this);
    }
}
