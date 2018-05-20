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

public class ScriptFileTest {
    @Rule
    public TemporaryFolder testFolder = new TemporaryFolder();
    
    public ScriptFileTest() {
    }

    @Test
    public void test1() throws IOException {
              //set up some files
        File f = testFolder.newFile("test.js");
        
        String fileCode = "// @key1 value1\n"+
                "// @key2        value2\n"+
                "// @key3\n"+
                "// @key4    \n"+
                "\n"+
                "// @notakey notavalue\n"+
                "somecode\n";
        
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
              new FileOutputStream(f), "utf-8"));
        writer.write(fileCode);
        writer.close();

        ScriptFile s = new ScriptFile(f);
        
        assertEquals(4, s.directives.size());
        assertEquals("key1", s.directives.get(0).key);
        assertEquals("value1", s.directives.get(0).value);
        assertEquals("key2", s.directives.get(1).key);
        assertEquals("value2", s.directives.get(1).value);
        assertEquals("key3", s.directives.get(2).key);
        assertNull(s.directives.get(2).value);
        assertEquals("key4",s.directives.get(3).key);
        assertNull(s.directives.get(3).value);
        
        assertEquals("// @notakey notavalue\n"+
                    "somecode\n", s.code);
    }
    
    @Test
    public void test2() throws IOException {
              //set up some files
        File f = testFolder.newFile("test.js");
        
        String fileCode = "// @k v\n"+
                "// ==/UserScript==\n"+
                "// @k2 v2\n"+
                "nonewline";
        
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
              new FileOutputStream(f), "utf-8"));
        writer.write(fileCode);
        writer.close();

        ScriptFile s = new ScriptFile(f);
        
        assertEquals(1, s.directives.size());
        assertEquals("// @k2 v2\n"
                +"nonewline\n", s.code);
    }
}
