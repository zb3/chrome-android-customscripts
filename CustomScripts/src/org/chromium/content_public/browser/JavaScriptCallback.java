package org.chromium.content_public.browser;

/*
This interface is overridden by us because apparently it's method is optimized
out.
*/
public interface JavaScriptCallback {
    /**
     * Called from native in response to evaluateJavaScript().
     * @param jsonResult json result curresponds to JS execution
     */
    void handleJavaScriptResult(String jsonResult);
}

