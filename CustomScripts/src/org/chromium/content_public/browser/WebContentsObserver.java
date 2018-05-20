package org.chromium.content_public.browser;

import android.support.annotation.Nullable;

public class WebContentsObserver {

    public WebContentsObserver(WebContents wc) {
    }

    public void documentAvailableInMainFrame() {
    }

    public void documentLoadedInFrame(long frameId, boolean isMainFrame) {
    }

    public void didFinishNavigation(String url, boolean isInMainFrame, boolean isErrorPage,
            boolean hasCommitted, boolean isSameDocument, boolean isFragmentNavigation,
            @Nullable Integer pageTransition, int errorCode, String errorDescription,
            int httpStatusCode) {

    }

}