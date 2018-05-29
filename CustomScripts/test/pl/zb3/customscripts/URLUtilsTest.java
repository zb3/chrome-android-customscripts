package pl.zb3.customscripts;

import java.util.regex.Pattern;
import org.junit.Test;
import static org.junit.Assert.*;


public class URLUtilsTest {
    
    public URLUtilsTest() {
    }

    @Test
    public void testCompileRegex() {
        // more tests are on JS side
        
        //*://*.google.com/*
        //*://@google.com/*
        //https?://test.*.com/somefile.js*
        
        assertEquals("^([^/]+://([^/]*\\.)?google\\.com/.*)$",
                URLUtils.compileRegex("*://*.google.com/*").toString());
        
        assertEquals("^([^/]+://([^/]*\\.)?google\\.com/.*)$",
                URLUtils.compileRegex("*://@google.com/*").toString());
        
        assertEquals("^([^/]+://(([^/]*\\.)?g\\.com|([^/]*\\.)?b\\.com)/.*)$",
                URLUtils.compileRegex("*://(@g.com|@b.com)/*").toString());
        
        assertEquals("^(https?://test\\..*\\.com/some[*]file\\.js.*)$",
                URLUtils.compileRegex(
                        "https?://test.*.com/some[*]file.js*").toString());
        
        assertEquals("^https?://test[.]*[.]com\\/somefile[.]js*$",
                URLUtils.compileRegex(
                    "/^https?://test[.]*[.]com\\/somefile[.]js*$/").toString());
        
        assertEquals("^(https?://test\\..*\\.com/file\\.js([?#].*)?)$",
                URLUtils.compileRegex(
                        "https?://test.*.com/file.js^").toString());
        
    }

    @Test
    public void testEnsureSlashInURL() {
        assertEquals("https://google.com/", 
                URLUtils.ensureSlashInURL("https://google.com"));
        assertEquals("https://google.com/",
                URLUtils.ensureSlashInURL("https://google.com/"));
        assertEquals("https://google.com/x",
                URLUtils.ensureSlashInURL("https://google.com/x"));

    }

    @Test
    public void testEscapePercent() {
        assertEquals("abcd%25efgh", URLUtils.escapePercent("abcd%efgh"));
    }
    
}
