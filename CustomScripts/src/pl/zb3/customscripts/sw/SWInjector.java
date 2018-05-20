package pl.zb3.customscripts.sw;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;

public class SWInjector {

    private final SWDatabase swdb;
    private final ScriptCache sc;
    private final HashSet<String> ourOrigins = new HashSet<>();
    private final HashSet<String> ourPaths = new HashSet<>();

    public SWInjector(File directory) throws IOException {
        directory.mkdirs();

        swdb = new SWDatabase(new File(directory, "Database"));
        sc = new ScriptCache(new File(directory, "ScriptCache"));
    }

    public void resetOrigins() {
        ourOrigins.clear();
    }

    public void destroy() {
        swdb.close();
    }

    public void installationDone() {
        HashSet<String> toRemove;

        try {
            toRemove = swdb.getAllCSPaths();
            toRemove.removeAll(ourPaths);

            ArrayList<String> resourcesToDelete = new ArrayList<>();

            for (String path : toRemove) {
                swdb.deleteForPath(path, getOrigin(path), resourcesToDelete);
            }

            swdb.deleteConflictingCSRegistrations(ourOrigins, ourPaths,
                    resourcesToDelete);

            for (String resourceId : resourcesToDelete) {
                sc.deleteEntry(resourceId);
            }

        } catch (IOException e) {
        }

        resetOrigins();
    }

    public void ensureRegistered(String path, String dataStr,
            long lastModified) throws IOException {
        String origin = getOrigin(path);

        RegistrationParameters rp = swdb.ensureRegistered(path, origin,
                dataStr.length(), lastModified);

        if (rp.wasModified) {
            sc.putEntry(Long.toString(rp.resourceID), dataStr);
        }

        ourOrigins.add(origin);
        ourPaths.add(path);
    }

    public String getOrigin(String path) throws IOException {
        URL pathURL = new URL(path);

        return pathURL.getProtocol() + "://" + pathURL.getAuthority() + "/";
    }

}
