package android.util;

public class Log {
    public static String getStackTraceString(Throwable tr) {
        return "";
    }
    public static int e(String tag, String msg) {
        System.out.println(tag + ": " + msg);
        return 0;
    }
    public static int d(String tag, String msg) {
        System.out.println(tag + ": " + msg);
        return 0;
    }
}
