package pl.zb3.customscripts;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.regex.Pattern;

public class URLUtils {
    //TODO: add possessive quantifiers
    
    private static final Pattern PERCENT_SIGN = Pattern.compile("%");
    private static final Pattern URL_FIX_DOT = Pattern.compile("([^(])\\.");
    private static final Pattern URL_FIX_STAR = Pattern.compile("(^|[^)*])\\*");
    
    private static final Pattern URL_DGLOB = 
            Pattern.compile("(^|[(|]|//)(@|\\.\\*\\\\\\.)");
    private static final Pattern URL_FILE_PARAMS = 
            Pattern.compile("\\^($|\\)|\\|)");
    

    public static Pattern compileRegex(String str) {
        if (str.charAt(0) == '/' && str.charAt(str.length()-1) == '/') {
            return Pattern.compile(str.substring(1, str.length()-1));
        }
        
        boolean invert = false;
        
        if (str.charAt(0) == '?' && str.length() > 1 && str.charAt(1) == '!') {
            invert = true;
            str = str.substring(2);
        }
            
        str = URL_FIX_DOT.matcher(str).replaceAll("$1\\\\.");
        str = URL_FIX_STAR.matcher(str).replaceAll("$1.*");
        
        str = URL_DGLOB.matcher(str).replaceAll("$1(.*\\\\.)?");
        str = URL_FILE_PARAMS.matcher(str).replaceAll("([?#].*)?$1");
        
        if (invert)
            str = "^(?!(" + str + ")$)";
        else
            str = "^(" + str + ")$";
  
        return Pattern.compile(str);
    }
    
    public static String ensureSlashInURL(String url) {
        int cnt = 0;

        for (int x = url.length() - 1; x >= 0 && cnt < 3; x--) {
            if (url.charAt(x) == '/') {
                cnt++;
            }
        }

        if (cnt < 3) {
            return url + "/";
        }

        return url;
    }
    
    public static String escapePercent(String str) {
        return PERCENT_SIGN.matcher(str).replaceAll("%25");
    }
    
    public static String fullyEscape(String url) {
        // Java strikes again.. this should be a RUNTIME exception
        try {
            return URLEncoder.encode(url, "UTF-8");
        } catch(UnsupportedEncodingException e) {
            return "UnsupportedEncodingException should be a RUNTIME exception";
        }
    }
}
