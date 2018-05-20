package pl.zb3.customscripts;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ScriptFile {
    
    public static class KV {
        
        public String key;
        public String value;

        public KV(String key, String value) {
            this.key = key;
            this.value = value;
        }
    }

    private static final Pattern WHITESPACE = Pattern.compile("\\s+");
    public File file;
    public ArrayList<KV> directives = new ArrayList<>();
    public String code = null;

    public ScriptFile(File f) {
        file = f;

        //nio methods are not available before api 26
        BufferedReader reader = null;

        /*
        format is:
        // @[key][spaces][value]
        we stop when we encounter userscript end or blank line, but after reading
        at least one directive
         */
        try {
            reader = new BufferedReader(new InputStreamReader(new FileInputStream(f)));
            String line;
            boolean parseDone = false;
            boolean hadDirective = false;

            StringBuilder cb = new StringBuilder();
            
            while ((line = reader.readLine()) != null) {
                if (parseDone) {
                    cb.append(line).append("\n");
                }
                else if ((line.startsWith("// ==/UserScript==")
                        || line.startsWith("//==/UserScript=="))
                        || (hadDirective && line.equals(""))) {
                    parseDone = true;
                }

                if (parseDone) {
                    continue;
                }

                if (line.startsWith("// @")) {
                    hadDirective = true;

                    String key = null;
                    String value = null;

                    Matcher m = WHITESPACE.matcher(line);
                    if (m.find(4)) {
                        key = line.substring(4, m.start());
                        
                        int end = m.end();
                        if (end < line.length())
                            value = line.substring(end);
                    } else {
                        key = line.substring(4);
                    }

                    directives.add(new ScriptFile.KV(key, value));
                }
            }

            code = cb.toString();
        } catch (IOException e) {
            e.printStackTrace();
        //System.out.println("heljaja:");
        } finally {
            try {
                reader.close();
            } catch (Exception e) {
            }
        }

    }
}
