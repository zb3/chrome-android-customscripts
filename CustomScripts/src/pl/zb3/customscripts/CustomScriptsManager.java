package pl.zb3.customscripts;

import android.content.Context;
import android.os.Environment;
import android.util.Log;
import java.io.File;
import java.util.ArrayList;
import org.chromium.content.browser.webcontents.WebContentsImpl;
import org.chromium.content_public.browser.WebContents;
import org.chromium.content_public.browser.WebContentsObserver;
import org.chromium.ui.base.WindowAndroid;

import org.chromium.base.PathUtils;
import org.chromium.content_public.browser.LoadUrlParams;

import pl.zb3.customscripts.sw.SWManager;

public final class CustomScriptsManager implements WindowAndroid.PermissionCallback {

    // begin flags - these are set when patching
    static boolean HAS_SW = true;
    static boolean INSECURE = false;
    // end flags

    final ArrayList<CustomScript> customScripts = new ArrayList<>();

    static volatile CustomScriptsManager instance = null;

    public static void init(WindowAndroid wa, Context ctx) {
        if (instance == null) {
            synchronized (CustomScriptsManager.class) {
                if (instance == null) {
                    instance = new CustomScriptsManager(wa, ctx);
                }
            }
        }
    }

    private CustomScriptsManager(WindowAndroid wa, Context ctx) {
        if (!INSECURE) {
            loadScripts(ctx.getFilesDir());
        } else {
            checkPermissionsAndLoad(wa);
        }
    }

    CustomScriptsManager() {

    }

    private void checkPermissionsAndLoad(WindowAndroid wa) {
        if (wa.hasPermission("android.permission.READ_EXTERNAL_STORAGE")) {
            loadScripts();
        } else if (wa.canRequestPermission("android.permission.READ_EXTERNAL_STORAGE")) {
            Log.d("chromemod", "gonna request permission");
            wa.requestPermissions(new String[]{"android.permission.READ_EXTERNAL_STORAGE"}, this);
        } else {
            Log.d("chromemod", "can't even request this permission");
        }
    }

    @Override
    public void onRequestPermissionsResult(String[] permissions, int[] grantResults) {
        Log.d("chromemod", "got permission response " + grantResults.length);
        if (grantResults.length > 0) {
            Log.d("chromemod", "grant result " + grantResults[0]);
        }
        if (grantResults.length == 1 && grantResults[0] == 0) {
            loadScripts();
        }
    }

    void loadScripts() {
        File dir = Environment.getExternalStorageDirectory();
        loadScripts(dir);
    }

    void loadScripts(File dir) {
        dir = new File(dir, "CustomScripts");
        Log.d("chromemod", "looking for scripts in " + dir);
        loadScriptsFromFolder(dir);
    }

    void loadScriptsFromFolder(File dir) {
        Object swm = null;

        if (HAS_SW) {
            swm = new SWManager();
        }

        dir.mkdirs();

        File[] files = dir.listFiles();

        if (files == null) {
            return;
        }

        for (File inFile : files) {
            String fileName = inFile.getName();
            if (fileName.endsWith(".js")) {
                Log.d("chromemod", "adding from " + fileName);
                ScriptFile file = new ScriptFile(inFile);
                if (file.code != null) {
                    try {
                        customScripts.add(new CustomScript(file));
                    } catch (CustomScript.NoPatternsException e) {
                        Log.d("chromemod", "no patterns found in " + fileName);
                    }

                    if (HAS_SW) {
                        ((SWManager) swm).onScriptFile(file);
                    }
                }
            }
        }

        if (HAS_SW) {
            ((SWManager) swm).done();
        }
    }

    public static CustomScriptsManager instance() {
        return instance;
    }

    public static void executeJS(WebContents wc, String js) {
        if (js == null) {
            return;
        }

        //first method - uses evaluatejavascriptfortests
        ((WebContentsImpl) wc).executeJS(js, null);

        //second backup method - use javascript:, doesn't support callbacks
        //unsure if "\n" or ";" works inside, will check it
        /*
        -script size is limited, total url limit is typically 2MB
        -% must be escaped to %25
        -last statement may not return a non-empty string (so we wrap it
        anonymous function, with newlines to support inline comments)
        
        TODO: we should transform string @ init time
         */

 /*
        wc.getNavigationController().loadUrl(
                new LoadUrlParams("javascript:(function(){\n"+
                        URLUtils.escapePercent(js)+"\n})();"));
         */
    }

    public WebContentsObserver createObserver(final WebContents wc) {
        //note that we don't detach the observer because it's automatically
        //detached on wc destruction, but this will probably change...

        Log.d("chromemod", "creating new observer");

        return new WebContentsObserver(wc) {
            @Override
            public void documentAvailableInMainFrame() {
                String url = URLUtils.ensureSlashInURL(wc.getVisibleUrl());

                for (CustomScript cs : customScripts) {
                    if (cs.matchesURL(url)) {
                        CustomScriptsManager.executeJS(wc, cs.code);
                    }
                }
            }

            // too early
            public void didStartNavigation(String url, boolean isInMainFrame,
                    boolean isSameDocument, boolean isErrorPage) {

                if (!isInMainFrame || isErrorPage) {
                    return;
                }

                //Log.d("chromemod", "DSN: starting loop for "+url);
            }

            /*
            public void navigationEntryCommitted() {
                ((WebContentsImpl) wc).executeJS(
                        "window.txt = (window.txt||'')+'<nec>';", null);
            }*/
 /*
            @Override
            public void didFinishNavigation(String url, boolean isInMainFrame, boolean isErrorPage,
                    boolean hasCommitted, boolean isSameDocument, boolean isFragmentNavigation,
                    @Nullable Integer pageTransition, int errorCode, String errorDescription,
                    int httpStatusCode) {
                if (isInMainFrame && hasCommitted && !isErrorPage && !isSameDocument) {
                    String cs = CustomScriptsManager.this.codeForURL(url);

                    if (cs != null) {
                        ((WebContentsImpl) wc).executeJS(
                                "window.txt = (window.txt||'')+'<dfn>';", null);
                    }
                }
            }
             */
        };
    }

    public void dummy() {
        Log.d("chromebugrpst", Log.getStackTraceString(new Exception()));

    }
}
