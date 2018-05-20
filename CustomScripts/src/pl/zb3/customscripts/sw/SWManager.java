package pl.zb3.customscripts.sw;

import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import org.chromium.base.PathUtils;

import pl.zb3.customscripts.ScriptFile;

class SWInfo {
    public SWInfo(File f) {
        lastModified = f.lastModified();
    }

    String code = "";
    long lastModified;
}

public class SWManager {

    private SWInjector swi = null;
    private final ArrayList<SWInfo> serviceWorkers = new ArrayList<>();
    private final ArrayList<String> serviceWorkerOrigins = new ArrayList<>();

    public SWManager() {
        try {
            String swDir = PathUtils.getDataDirectory()
                    + "/Default/Service Worker";
            Log.d("chromemod-sw", "SW dir " + swDir);
            
            //it didn't work without this, but I don't remember what happend
            System.setProperty("leveldb.mmap", "true"); //#gobacktothis
            
            swi = new SWInjector(new File(swDir));
        } catch (IOException e) {
            Log.e("chromemod-sw", "couldn't start swmanager");
            Log.d("chromemod-sw", e.getMessage());
            Log.d("chromemod-sw", Log.getStackTraceString(new Exception()));
        }
    }

    public void onScriptFile(ScriptFile file) {
        SWInfo sw = new SWInfo(file.file);
        sw.code = file.code;

        for (ScriptFile.KV directive : file.directives) {
            if (directive.key.equals("serviceworker")
                    && directive.value != null) {
                String origin = directive.value.trim();

                Log.d("chromemod-sw", "addin sw for origin "
                        + origin + ", with lastmod: "
                        + sw.lastModified);
                serviceWorkerOrigins.add(origin);
                serviceWorkers.add(sw);
            }
        }
    }

    public void done() {
        if (swi != null) {
            for (int t = 0; t < serviceWorkers.size(); t++) {
                SWInfo sw = serviceWorkers.get(t);
                String origin = serviceWorkerOrigins.get(t);
                try {
                    swi.ensureRegistered(origin, sw.code, sw.lastModified);
                } catch (IOException e) {
                    Log.e("chromemod-sw", "failed to register SW for " + origin);
                    Log.d("chromemod-sw", 
                            Log.getStackTraceString(new Exception()));
                }
            }

            swi.installationDone(); //this should clean up deleted workers
            swi.destroy();
            swi = null;
        }
    }
}
