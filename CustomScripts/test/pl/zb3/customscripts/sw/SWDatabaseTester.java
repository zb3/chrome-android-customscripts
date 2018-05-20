package pl.zb3.customscripts.sw;

import java.io.File;
import java.io.IOException;

public class SWDatabaseTester {
    public static void main(String[] args) throws IOException {
        SWDatabase swdb
                = new SWDatabase(new File(System.getProperty("user.home")+
                        "/.config/chromium/Default/Service Worker/Database/"));

        //swdb.ensureRegistered("https://tromba.pl/", 123, 644);
        //swdb.deleteForOrigin("https://news.ycombinator.com/");
        /*
        RegistrationParameters rp = swdb.getRegParams("https://www.google.pl/");
        System.out.println(rp.registrationID);
        System.out.println(rp.resourceID);
        System.out.println(rp.versionID);
        System.out.println(rp.wasReused);
        */
        
        swdb.close();
    }
}
