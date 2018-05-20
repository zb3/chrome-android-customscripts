package pl.zb3.customscripts;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Rule;
import org.junit.rules.TemporaryFolder;

public class CustomScriptsManagerTest {
    @Rule
    public TemporaryFolder testFolder = new TemporaryFolder();
    
    public CustomScriptsManagerTest() {
    }

    
    @Test
    public void testGeneral() throws IOException {
        /*
        
        */
        File csf = testFolder.newFolder("CustomScripts");
        
        CustomScriptsManager csm = new CustomScriptsManager();

        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
            new FileOutputStream(new File(csf, "test.js")), "utf-8"));
        writer.write("// @url https?://*.zb3.com/*\n"+
                "// @url https?://notzb3.com/*\n"+
                "// @run-at unsupported\n"+
                "\n"+
                "code1();\n");
        writer.close();
                
        writer = new BufferedWriter(new OutputStreamWriter(
            new FileOutputStream(new File(csf, "test2.js")), "utf-8"));
        writer.write("// @url https?://*.zb3.com/*\n"+
                "// @run-at unsupported\n"+
                "\n"+
                "code2();\n");
        writer.close();
        
        CustomScriptsManager.HAS_SW = false;
        csm.loadScripts(testFolder.getRoot());

        assertEquals(2, csm.customScripts.size());
        
        assertNull(csm.codeForURL("http://nonono.com/"));
        
        String code = csm.codeForURL("https://test.zb3.com");
        assertTrue(code.equals("code1();\n\ncode2();\n") || 
                code.equals("code2();\n\ncode1();\n"));
            }
    /*
    @Test
    public void testCodeForURL() {
        System.out.println("onRequestPermissionsResult");
        String[] permissions = null;
        int[] grantResults = null;
        CustomScriptsManager instance = null;
        instance.onRequestPermissionsResult(permissions, grantResults);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    @Test
    public void testxInjectScriptForURL() {
        System.out.println("instance");
        CustomScriptsManager expResult = null;
        CustomScriptsManager result = CustomScriptsManager.instance();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    */
}
