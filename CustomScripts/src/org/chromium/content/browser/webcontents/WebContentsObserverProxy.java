package org.chromium.content.browser.webcontents;

import org.chromium.content_public.browser.WebContents;
import org.chromium.content_public.browser.WebContentsObserver;

public class WebContentsObserverProxy extends WebContentsObserver {

    public WebContentsObserverProxy(WebContents wc) {
        super(wc);
    }

    void addObserver(WebContentsObserver observer) {
    }
}
