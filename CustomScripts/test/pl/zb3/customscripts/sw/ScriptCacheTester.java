package pl.zb3.customscripts.sw;

//a way to replace a class in test?
/*
This will only work if chromium uses the "simple" backend
*/

import java.io.File;
import java.io.IOException;

public class ScriptCacheTester {
    
    public static void main(String[] args) throws IOException {  
        ScriptCache sc = new ScriptCache(
                new File( System.getProperty("user.home")
                        +"/.cache/chromium/Default/Cache/"));
        
        sc.putEntry("https://google.com/h4x0r3d.js", "h4x!!!");
        
        //chrome://view-http-cache/https://google.com/h4x0r3d.js
    }
}
