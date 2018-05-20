package pl.zb3.customscripts.sw;

import java.io.File;
import java.io.IOException;
import org.iq80.leveldb.*;
import static org.iq80.leveldb.impl.Iq80DBFactory.*;


public class ListDBContents {
    //class 4 test
    
    public static void main(String[] args) throws IOException {
        File dir = new File(System.getProperty("user.home")+
                "/.config/chromium/Default/Service Worker/Database/");
        SWDatabase.renameLDBFiles(dir);
        
        DB db = factory.open(dir, new Options());
    
        
        try (DBIterator iterator = db.iterator()) {
            for (iterator.seekToFirst(); iterator.hasNext(); iterator.next()) {
                String key = asString(iterator.peekNext().getKey());
                String value = asString(iterator.peekNext().getValue());
                
                System.out.println(key.replaceAll("\u0000", "[SEP]")
                        +" = "+value.replaceAll("\u0000", ".")
                                .replaceAll("\r", "."));
            }
        }
        
        db.close();
    }
}
