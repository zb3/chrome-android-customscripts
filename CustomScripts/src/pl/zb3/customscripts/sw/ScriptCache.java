package pl.zb3.customscripts.sw;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/*
This partially implements the "simple" cache backed, which is used on android
*/

class ZeroInputStream extends InputStream {
    @Override
    public int read() {
        return 0;
    }
}

public class ScriptCache {
    private static final long MAGIC = 0xfcfb6d1ba7725c30L;
    private static final long EOF_MAGIC = 0xf4fa6f45970d41d8L;
    private static final long IDX_MAGIC = 0x656e74657220796fL;
    private static final int IDX_VERSION = 8;
    
    private final File directory;

    public ScriptCache(File dir) throws IOException {
        directory = dir;
        if (!dir.exists())
            createCache();
    }

    public final void createCache() throws IOException {
        directory.mkdirs();
        
        new File(directory, "index-dir").mkdirs();
        
        File dummyIndex = new File(directory, "index");
        dummyIndex.createNewFile();
        
        FileOutputStream fos = new FileOutputStream(dummyIndex);
        PickleWriter pw = new PickleWriter(fos);
        pw.writeLong(MAGIC);
        pw.writeInt(IDX_VERSION);
        pw.writeLong(0);
        pw.writeInt(0);
        fos.close();
    }
    
    private String getFileName(String key, int index) {
        byte[] sha1 = Util.sha1(key);
        byte[] hashPart = new byte[8];
        for (int t = 0; t < 8; t++) {
            hashPart[t] = sha1[7 - t];
        }

        return Util.bytesToHex(hashPart) + "_" + index;
    }

    public void removeEntryFiles(String key) {
        File f0 = new File(directory, getFileName(key, 0));
        f0.delete();

        File f1 = new File(directory, getFileName(key, 1));
        f1.delete();
    }

    public int writeEntryFile(String key, String dataStr) throws IOException {
        byte[] data = dataStr.getBytes("UTF-8");

        File f = new File(directory, getFileName(key, 0));
        f.createNewFile();
        FileOutputStream fos = new FileOutputStream(f);
        PickleWriter pw = new PickleWriter(fos);

        //header
        pw.writeLong(MAGIC);
        pw.writeInt(5); //version
        pw.writeInt(key.length());
        pw.writeInt(SuperFastHash.hash(key));
        pw.writeInt(0); //pad

        //key+data
        pw.writeBytes(key);
        pw.write(data);

        //eof
        pw.writeLong(EOF_MAGIC);
        pw.writeInt(1); //flags for crc32
        pw.writeInt(Util.crc32(data));
        pw.writeInt(data.length); //size for stream 0
        pw.writeInt(0); //pad

        
        //write httpinfo
        //we can't just do pickle in pickle, because in the begining we need
        //payload length
        ByteArrayOutputStream hiStream = new ByteArrayOutputStream();
        PickleWriter hi = new PickleWriter(hiStream);
        hi.writeInt(0); //length, we'll write it later

        hi.writeInt(3); //no optional fields here, only version

        //hi.writeLong(13157387631859682L);
        //hi.writeLong(13157387631983596L);
        hi.writeLong(Util.time());
        hi.writeLong(Util.time() + 20);

        //now headers, these are http/1.1 ones, check if it works for http2
        hi.writeString("HTTP/1.1 200 OK\u0000"
                + "Accept-Ranges: bytes\u0000"
                + "Content-Length: " + data.length + "\u0000"
                + "Content-Type: application/javascript; charset=utf8\u0000\u0000");
        hi.align32();

        hi.writeString("0.0.0.0");
        hi.align32();
        hi.writeShort(443);
        hi.align32();

        byte[] hiBytes = hiStream.toByteArray();
        Util.putIntLE(hiBytes, 0, hiBytes.length - 4);

        pw.write(hiBytes);

        //sha256 of... the key
        pw.write(Util.sha256(key));

        //eof
        pw.writeLong(0xf4fa6f45970d41d8L);
        pw.writeInt(3); //flags for crc32 + sha256
        pw.writeInt(Util.crc32(hiBytes));
        pw.writeInt(hiBytes.length); //size for stream 1
        pw.writeInt(0); //pad

        fos.close();

        return pw.size();
    }

    private static long getKeyHash(String key) {
        byte[] sha1 = Util.sha1(key);
        long keyHash = 0;

        for (int t = 0; t < 8; t++) {
            keyHash |= ((long) sha1[t] & 0xff) << (t * 8);
        }

        return keyHash;
    }

    private File getIndexFile() {
        return new File(directory, "index-dir/the-real-index");
    }

    //entrySize == 0 means removal
    void updateIndex(String key, long entrySize) throws IOException {
        long keyHash = getKeyHash(key);

        File f = getIndexFile();
        
        InputStream is;

        if (f.exists()) {
            is = new FileInputStream(f);
        } else {
            is = new ZeroInputStream();
        }
        
        PickleReader pr = new PickleReader(is);
        
        byte[] outBytes = null;

        try {
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            PickleWriter pw = new PickleWriter(outStream);

            //pickle header(size) + crc32 of payload
            pw.writeLong(0); //we'll fill these later
            pw.writeLong(IDX_MAGIC); //header magic
            pw.writeInt(IDX_VERSION); //version
          
            pr.skip(20);
            
            long entryCount = pr.readLong();
            long cacheSize = pr.readLong();
            
            //entryCount and size - we'll fill this later
            pw.writeLong(0);
            pw.writeLong(0);
            
            pw.writeInt(pr.readInt()); //reason

            long newLastUsedTime = Util.time();
            long newSizeInfo = (entrySize + 255) & 0xffffffffffffff00L;

            long oldEntryCount = entryCount;
            for (int t = 0; t < oldEntryCount; t++) {
                long hashKey = pr.readLong();
                long lastUsedTime = pr.readLong();
                long sizeInfo = pr.readLong();

                if (hashKey == keyHash) {
                    entryCount--;
                    cacheSize -= sizeInfo & 0xffffffffffffff00L;
                    continue;
                }

                pw.writeLong(hashKey);
                pw.writeLong(lastUsedTime);
                pw.writeLong(sizeInfo);
            }

            if (entrySize != 0) {
                pw.writeLong(keyHash);
                pw.writeLong(newLastUsedTime);
                pw.writeLong(newSizeInfo);

                entryCount++;
                cacheSize += newSizeInfo & 0xffffffffffffff00L;
            }
            
            pw.writeLong(pr.readLong()); //lastmodified, we leave it intact

            outBytes = outStream.toByteArray();
            ByteBuffer outBuf = ByteBuffer.wrap(outBytes);
            outBuf.order(ByteOrder.LITTLE_ENDIAN);

            //0 - header, 4 - crc, 16 - count, 32 - cacheSize
            outBuf.position(20);
            outBuf.putLong(entryCount);
            outBuf.putLong(cacheSize);

            outBuf.position(0);
            outBuf.putInt(outBytes.length - 8);
            outBuf.putInt(Util.crc32(outBytes, 8, outBytes.length - 8));

        } finally {
            is.close();
        }

        if (outBytes != null) {
            try (FileOutputStream fos = new FileOutputStream(f)) {
                fos.write(outBytes);
            }
        }

    }
    
    public void putEntry(String key, String dataStr) throws IOException {
        long fileSize = writeEntryFile(key, dataStr);
        updateIndex(key, fileSize);
    }
    
    public void deleteEntry(String key) throws IOException {
        removeEntryFiles(key);
        updateIndex(key, 0);
    }
}
