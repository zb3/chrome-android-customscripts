package org.chromium.content.browser.webcontents;

import org.chromium.base.annotations.CalledByNative;
import org.chromium.content_public.browser.JavaScriptCallback;
import org.chromium.content_public.browser.NavigationController;
import org.chromium.content_public.browser.WebContents;
import org.chromium.content_public.browser.WebContentsObserver;
import pl.zb3.customscripts.CustomScriptsManager;

public class WebContentsImpl implements WebContents {

    public long mNativeWebContentsAndroid;
    private WebContentsObserverProxy mObserverProxy;

    private WebContentsImpl(
            long nativeWebContentsAndroid,
            NavigationController navigationController) {

    }
    
    @Override
    public NavigationController getNavigationController() {
        return null;
    }

    private String nativeGetVisibleURL(long nativeWebContentsAndroid) {
        return "http://some.url.com/";
    }

    private void nativeEvaluateJavaScriptForTests(long nativeWebContentsAndroid,
            String script, JavaScriptCallback callback) {
    }
 
    @Override
    public String getVisibleUrl() {
        return nativeGetVisibleURL(mNativeWebContentsAndroid);
    }

    public void addObserver(WebContentsObserver observer) {
        assert mNativeWebContentsAndroid != 0;
        if (mObserverProxy == null) {
            mObserverProxy = new WebContentsObserverProxy(this);
        }
        mObserverProxy.addObserver(observer);
    }

    //overrides
    @CalledByNative
    private static WebContentsImpl create(long nativeWebContentsAndroid,
            NavigationController navigationController) {
        WebContentsImpl wc = new WebContentsImpl(nativeWebContentsAndroid,
                navigationController);

        wc.addObserver(CustomScriptsManager.instance().createObserver(wc));

        return wc;
    }
    
    @CalledByNative
    private static void onEvaluateJavaScriptResult(
            String jsonResult, JavaScriptCallback callback) {
        /*
        We override this because this method has probably been optimized out
        and emptied. Fortunately JNI bindings are still there.
        */
        callback.handleJavaScriptResult(jsonResult);
    }
    
    public void executeJS(String code, JavaScriptCallback cb) {
        nativeEvaluateJavaScriptForTests(mNativeWebContentsAndroid, code, cb);
    }
}