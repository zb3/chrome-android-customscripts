package pl.zb3.customscripts;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Rule;
import org.junit.rules.TemporaryFolder;

public class CustomScriptTest {
    @Rule
    public TemporaryFolder testFolder = new TemporaryFolder();
    
    public CustomScriptTest() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }
    
    @Test
    public void testInvalid() throws IOException {
        String fileCode = "whatever\n";

        File f = testFolder.newFile("test.js");
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
            new FileOutputStream(f), "utf-8"));
        writer.write(fileCode);
        writer.close();
       
        CustomScript cs = null;
        try {
            cs = new CustomScript(new ScriptFile(f));
        } catch(CustomScript.NoPatternsException e) {
            
        }
       
        assertNull(cs);
    }

    @Test
    public void testBasic() throws IOException, 
            CustomScript.NoPatternsException {
        String fileCode = "// @url https?://*.google.com/\n"+
                "// @match https?://zb3.*/*\n"+
                "// @exclude http://zb3.com/admin\n"+
                "\n"+
                "whatever\n";

        File f = testFolder.newFile("test.js");
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
            new FileOutputStream(f), "utf-8"));
        writer.write(fileCode);
        writer.close();
       
        CustomScript cs = new CustomScript(new ScriptFile(f));
        
        assertEquals(2, cs.includePatterns.size());
        assertEquals(1, cs.excludePatterns.size());
        assertNotNull(cs.includePatterns.get(0));
        assertNotNull(cs.includePatterns.get(1));
        assertNotNull(cs.excludePatterns.get(0));
        
        assertTrue(cs.code.contains("whatever\n"));
        assertTrue(cs.code.contains("addEventListener"));
        assertEquals(CustomScript.RunLocation.DOCUMENT_END, cs.runLocation);
        
        assertTrue(cs.matchesURL("http://test.google.com/"));
        assertTrue(cs.matchesURL("https://zb3.com/admin"));
        assertFalse(cs.matchesURL("http://zb3.com/admin"));
        
    }
    
    @Test
    public void testRunLoc() throws IOException, 
            CustomScript.NoPatternsException {
        
        File f = testFolder.newFile("test.js");
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
            new FileOutputStream(f), "utf-8"));
        writer.write("// @url https?://*.google.com/\n"+
                "// @run-at document-end\n"+
                "\n"+
                "whatever\n");
        writer.close();
       
        CustomScript cs = new CustomScript(new ScriptFile(f));
        assertEquals(CustomScript.RunLocation.DOCUMENT_END, cs.runLocation);
        
        assertTrue(cs.code.contains("DOMContentLoaded"));
        
        // idle
        
        writer = new BufferedWriter(new OutputStreamWriter(
            new FileOutputStream(f), "utf-8"));
        writer.write("// @url https?://*.google.com/\n"+
                "// @run-at document-idle\n"+
                "\n"+
                "whatever\n");
        writer.close();
       
        cs = new CustomScript(new ScriptFile(f));
        assertEquals(CustomScript.RunLocation.DOCUMENT_IDLE, cs.runLocation);
        assertTrue(cs.code.contains("complete"));
        
        // default
        writer = new BufferedWriter(new OutputStreamWriter(
            new FileOutputStream(f), "utf-8"));
        writer.write("// @url https?://*.google.com/\n"+
                "\n"+
                "whatever\n");
        writer.close();
       
        cs = new CustomScript(new ScriptFile(f));
        assertEquals(CustomScript.RunLocation.DOCUMENT_END, cs.runLocation);

        
        // start        
        writer = new BufferedWriter(new OutputStreamWriter(
            new FileOutputStream(f), "utf-8"));
        writer.write("// @url https?://*.google.com/\n"+
                "// @run-at document-start\n"+
                "\n"+
                "whatever\n");
        writer.close();
       
        cs = new CustomScript(new ScriptFile(f));
        assertEquals(CustomScript.RunLocation.UNSPECIFIED, cs.runLocation);
        assertFalse(cs.code.contains("addEventListener"));

    }
    
}
