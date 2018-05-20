package pl.zb3.customscripts.sw;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import org.iq80.leveldb.*;
import java.util.HashSet;

import static org.iq80.leveldb.impl.Iq80DBFactory.*;
import static pl.zb3.customscripts.sw.SWData.ServiceWorkerRegistrationData;
import static pl.zb3.customscripts.sw.SWData.ServiceWorkerResourceRecord;

/*
We introduce some new per-path keys here:

CS_LAST_MOD - so we know which one is registered by us, AND when to update (our) SW
CS_VERSION_ID - so we're sure that if we just bump modtime, it's our SW

This supports multiple scopes per origin:
/
/other/

But if a page registers /another/ and we don't, that SW is removed (otherwise 
we wouldn't be able to control pages under /another/ scope).
*/
public class SWDatabase {

    private final DB db;

    public SWDatabase(File directory) throws IOException {
        directory.mkdirs();

        renameLDBFiles(directory);

        db = factory.open(directory, new Options());
        if (db.get(bytes("INITDATA_DB_VERSION")) == null) {
            db.put(bytes("INITDATA_DB_VERSION"), bytes("2"));
        }
    }

    public void close() {
        try {
            db.close();
        } catch (IOException ex) {
            System.err.println("Can't close the DB");
        }
    }

    public static void renameLDBFiles(File directory) {
        for (File file : directory.listFiles()) {
            if (file.getName().endsWith(".ldb")) {
                file.renameTo(new File(directory,
                        file.getName().replaceAll("ldb$", "sst")));
            }
        }
    }

    private ServiceWorkerRegistrationData findRegistration(String path,
            String origin) throws IOException {

        ServiceWorkerRegistrationData registration = null;

        String originStart = "REG:" + origin + "\u0000";
        byte[] originStartBytes = bytes(originStart);
        DBIterator iterator = db.iterator();
        try {
            for (iterator.seek(originStartBytes); iterator.hasNext();
                    iterator.next()) {

                String key = asString(iterator.peekNext().getKey());

                if (!key.startsWith(originStart)) {
                    break;
                }

                ServiceWorkerRegistrationData rd
                        = ServiceWorkerRegistrationData.parseFrom(
                                iterator.peekNext().getValue());

                if (rd.scopeUrl.equals(path)) {
                    registration = rd;
                    break;
                }

            }
        } finally {
            iterator.close();
        }

        return registration;
    }

    private long findResourceForScriptURL(long versionId, String scriptUrl)
            throws IOException {

        long resourceId = -1;
        DBIterator iterator = db.iterator();
        try {
            for (iterator.seek(bytes("RES:")); iterator.hasNext();
                    iterator.next()) {
                String key = asString(iterator.peekNext().getKey());

                if (!key.startsWith("RES:")) {
                    break;
                }

                SWData.ServiceWorkerResourceRecord rr
                        = SWData.ServiceWorkerResourceRecord
                                .parseFrom(iterator.peekNext().getValue());
                if (rr.url.equals(scriptUrl)) {
                    resourceId = rr.resourceId;
                    break;
                }
            }
        } finally {
            iterator.close();
        }

        return resourceId;
    }

    private void deleteRegistration(ServiceWorkerRegistrationData reg, 
            String origin, ArrayList<String> resourceIds) throws IOException {
        db.delete(bytes("REGID_TO_ORIGIN:" + reg.registrationId));
        db.delete(bytes("REG:" + origin + "\u0000" + reg.registrationId));
        deleteResourceRecords(reg.versionId, resourceIds);
        deleteUserData(reg.registrationId);

        // those might not exist
        db.delete(bytes("CS_LAST_MOD:" + reg.scopeUrl));
        db.delete(bytes("CS_VERSION_ID:" + reg.scopeUrl));
    }

    private void deleteUserData(long registrationID) throws IOException {
        String keyPrefix = "REG_USER_DATA:" + registrationID + "\u0000";

        DBIterator iterator = db.iterator();
        try {
            for (iterator.seek(bytes(keyPrefix)); iterator.hasNext();
                    iterator.next()) {
                String key = asString(iterator.peekNext().getKey());

                if (!key.startsWith(keyPrefix)) {
                    break;
                }

                db.delete(iterator.peekNext().getKey());

                String name = key.substring(keyPrefix.length());
                db.delete(bytes("REG_HAS_USER_DATA:" + name
                        + "\u0000" + registrationID));
            }
        } finally {
            iterator.close();
        }
    }

    protected void deleteResourceRecords(long versionID,
            ArrayList<String> deletedResourceKeys) throws IOException {
        //of course we don't remove those from cache - that's not our job
        String keyPrefix = "RES:" + versionID + "\u0000";

        DBIterator iterator = db.iterator();
        try {
            for (iterator.seek(bytes(keyPrefix)); iterator.hasNext();
                    iterator.next()) {
                String key = asString(iterator.peekNext().getKey());

                if (!key.startsWith(keyPrefix)) {
                    break;
                }

                if (deletedResourceKeys != null) {
                    deletedResourceKeys.add(key.substring(
                            key.indexOf("\u0000") + 1));
                }

                db.delete(iterator.peekNext().getKey());
            }
        } finally {
            iterator.close();
        }
    }

    private RegistrationParameters getRegParams(
            ServiceWorkerRegistrationData reg) throws IOException {
        RegistrationParameters rp = new RegistrationParameters();

        if (reg != null) {
            rp.wasReused = true;
            rp.registrationID = reg.registrationId;
            rp.versionID = reg.versionId;

            /*
            we return resourceID of the script coz we don't want to 
            overwrite other res in case we've found our script...
             */
            rp.resourceID = findResourceForScriptURL(reg.versionId,
                    reg.scriptUrl);
        } else {
            rp.wasReused = false;

            byte[] buf;

            buf = db.get(bytes("INITDATA_NEXT_REGISTRATION_ID"));
            rp.registrationID = buf != null ?
                    Integer.parseInt(asString(buf)) : 0;

            buf = db.get(bytes("INITDATA_NEXT_RESOURCE_ID"));
            rp.resourceID = buf != null ? Long.parseLong(asString(buf)) : 0;

            buf = db.get(bytes("INITDATA_NEXT_VERSION_ID"));
            rp.versionID = buf != null ? Long.parseLong(asString(buf)) : 0;
        }

        return rp;
    }

    //called in every case except simple update check time bump
    private void addRegistration(RegistrationParameters rp, String path,
            String origin, int resourceSize, long lastModifiedTime,
            String scriptUrl) {
        ServiceWorkerRegistrationData rd = new ServiceWorkerRegistrationData();
        rd.registrationId = rp.registrationID;
        rd.isActive = true;
        rd.lastUpdateCheckTime = Util.time();
        rd.hasFetchHandler = true; //note: since we should auto-add one
        rd.resourcesTotalSizeBytes = resourceSize;
        rd.scopeUrl = path;
        rd.scriptUrl = scriptUrl;
        rd.versionId = rp.versionID;

        //necessary, otherwise SW's are never updated from cache
        rd.updateViaCache = ServiceWorkerRegistrationData.ALL;
        
        db.put(bytes("INITDATA_UNIQUE_ORIGIN:" + origin), bytes(""));

        db.put(bytes("REG:" + origin + "\u0000" + rd.registrationId),
                ServiceWorkerRegistrationData.toByteArray(rd));

        db.put(bytes("REGID_TO_ORIGIN:" + rd.registrationId), bytes(origin));

        ServiceWorkerResourceRecord rr = new ServiceWorkerResourceRecord();
        rr.resourceId = rp.resourceID;
        rr.url = scriptUrl;
        rr.sizeBytes = resourceSize;

        db.put(bytes("RES:" + rd.versionId + "\u0000" + rr.resourceId),
                ServiceWorkerResourceRecord.toByteArray(rr));

        db.put(bytes("CS_LAST_MOD:" + path),
                bytes(Long.toString(lastModifiedTime)));

        db.put(bytes("CS_VERSION_ID:" + path),
                bytes(Long.toString(rp.versionID)));
    }

    private void bumpCheckTime(ServiceWorkerRegistrationData reg, String origin)
            throws IOException {
        byte[] regKey = bytes("REG:" + origin + "\u0000" + reg.registrationId);
        reg.lastUpdateCheckTime = Util.time();
        db.put(regKey, ServiceWorkerRegistrationData.toByteArray(reg));
    }

    private void postRegister(RegistrationParameters rp) throws IOException {
        if (!rp.wasReused) {
            db.put(bytes("INITDATA_NEXT_REGISTRATION_ID"),
                    bytes(Long.toString(rp.registrationID + 1)));
            db.put(bytes("INITDATA_NEXT_RESOURCE_ID"),
                    bytes(Long.toString(rp.resourceID + 1)));
            db.put(bytes("INITDATA_NEXT_VERSION_ID"),
                    bytes(Long.toString(rp.versionID + 1)));
        }
    }

    //what if chromium'd override our worker for instance coz we didn't block
    //registerSW? then lastModified might not be enough..
    public RegistrationParameters ensureRegistered(String path, String origin,
            int dataLength, long lastModified) throws IOException {
        ServiceWorkerRegistrationData pathRegistration
                = findRegistration(path, origin);

        RegistrationParameters rp = getRegParams(pathRegistration);

        String scriptUrl = path + "cs-sw.js"; //todo: unguessable name?
        byte[] dbLastModBytes = db.get(bytes("CS_LAST_MOD:" + path));
        byte[] dbVersionBytes = db.get(bytes("CS_VERSION_ID:" + path));

        long dbLastModified = dbLastModBytes == null
                ? 0 : Long.parseLong(asString(dbLastModBytes));
        long dbVersion = dbVersionBytes == null
                ? 0 : Long.parseLong(asString(dbVersionBytes));

        if (pathRegistration != null && dbLastModified == lastModified
                && rp.versionID == dbVersion) {
            bumpCheckTime(pathRegistration, origin);
            //System.out.println("bumping");
        } else {
            addRegistration(rp, path, origin,
                    dataLength, lastModified, scriptUrl);
            rp.wasModified = true;
        }

        postRegister(rp);

        return rp;
    }

    public void deleteForPath(String path, String origin, 
            ArrayList<String> resourceIds) throws IOException {
        ServiceWorkerRegistrationData reg = findRegistration(path, origin);
        deleteRegistration(reg, origin, resourceIds);
    }

    public void cleanOriginsExcept(HashSet<String> goodOrigins) 
            throws IOException {
        String keyPrefix = "INITDATA_UNIQUE_ORIGIN:";

        DBIterator iterator = db.iterator();
        try {
            for (iterator.seek(bytes(keyPrefix)); iterator.hasNext();
                    iterator.next()) {
                String key = asString(iterator.peekNext().getKey());

                if (!key.startsWith(keyPrefix)) {
                    break;
                }

                String origin = key.substring(key.indexOf(":") + 1);

                if (!goodOrigins.contains(origin)) {
                    db.delete(iterator.peekNext().getKey());
                }
            }
        } finally {
            iterator.close();
        }
    }

    //todo refactor this...
    //this deletes all registrations for a CS origin other than active ones
    //if / is registered, but /1/ is not, /1/ is removed so / is always active
    public void deleteConflictingCSRegistrations(HashSet<String> csOrigins, 
            HashSet<String> csPaths, ArrayList<String> resourceIds)
            throws IOException {
        String keyPrefix = "REG:";

        HashSet<String> presentOrigins = new HashSet<>();

        DBIterator iterator = db.iterator();
        try {
            for (iterator.seek(bytes(keyPrefix)); iterator.hasNext();
                    iterator.next()) {
                String key = asString(iterator.peekNext().getKey());

                if (!key.startsWith(keyPrefix)) {
                    break;
                }

                String origin = key.substring(key.indexOf(":") + 1,
                        key.indexOf("\u0000"));
                boolean deleted = false;
                
                if (csOrigins.contains(origin)) {
                    ServiceWorkerRegistrationData reg
                            = ServiceWorkerRegistrationData.parseFrom(
                                    iterator.peekNext().getValue());

                    if (!csPaths.contains(reg.scopeUrl)) {
                        db.delete(iterator.peekNext().getKey());

                        deleteRegistration(reg, origin, resourceIds);
                        deleted = true;
                    }
                }
                
                if (!deleted)
                    presentOrigins.add(origin);
            }
        } finally {
            iterator.close();
        }

        cleanOriginsExcept(presentOrigins);
    }

    /**
     * Returns paths of SWs registered by us.
     *
     * @return
     * @throws IOException
     */
    public HashSet<String> getAllCSPaths()
            throws IOException {
        String keyPrefix = "CS_LAST_MOD:";
        HashSet<String> path = new HashSet<>();

        DBIterator iterator = db.iterator();
        try {
            for (iterator.seek(bytes(keyPrefix)); iterator.hasNext(); 
                    iterator.next()) {
                String key = asString(iterator.peekNext().getKey());

                if (!key.startsWith(keyPrefix)) {
                    break;
                }

                path.add(key.substring(keyPrefix.length()));
            }
        } finally {
            iterator.close();
        }

        return path;
    }

}
