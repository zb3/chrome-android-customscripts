package pl.zb3.customscripts.sw;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.zip.CRC32;

public class Util {

    //we treat String as bytes
    private final static char[] HEX_ARRAY = "0123456789abcdef".toCharArray();

    public static byte[] getBytes(String data) {
        int len = data.length();
        byte[] bytes = new byte[len];
        for (int t = 0; t < len; t++) {
            bytes[t] = (byte) (data.charAt(t) & 0xff);
        }
        return bytes;
    }

    public static int crc32(String data) {
        return crc32(getBytes(data));
    }

    public static int crc32(byte[] data) {
        return crc32(data, 0, data.length);
    }
    
    public static int crc32(byte[] data, int off, int len) {
        CRC32 sum = new CRC32();
        sum.update(data, off, len);
        return (int) sum.getValue();
    }

    public static void putIntLE(byte[] arr, int offset, int val) {
        arr[offset] = (byte) (val & 0xff);
        arr[offset + 1] = (byte) ((val >>> 8) & 0xff);
        arr[offset + 2] = (byte) ((val >>> 16) & 0xff);
        arr[offset + 3] = (byte) ((val >>> 24) & 0xff);
    }
    
    public static byte[] sha1(String data) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            return md.digest(getBytes(data));
        } catch (NoSuchAlgorithmException ex) {
            return null; //NSA is a RUNTIME exception you stupid Java!
        }
    }

    public static byte[] sha256(String data) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            return md.digest(getBytes(data));
        } catch (NoSuchAlgorithmException ex) {
            return null; //NSA is a RUNTIME exception you stupid Java!
        }
    }

    public static String bytesToHex(byte[] bytes, int offset, int len) {
        char[] hexChars = new char[len * 2];
        for (int j = offset; j < offset+len; j++) {
            int v = bytes[j] & 0xFF;
            hexChars[j * 2] = HEX_ARRAY[v >>> 4];
            hexChars[j * 2 + 1] = HEX_ARRAY[v & 0x0F];
        }
        return new String(hexChars);
    }
    
    public static String bytesToHex(byte[] bytes) {
        return bytesToHex(bytes, 0, bytes.length);
    }
    
    public static long time() {
        return time(System.currentTimeMillis());
    }
    
    public static long time(long millis) {
        return millis*1000 + 11644473600000000L;
    }
}
