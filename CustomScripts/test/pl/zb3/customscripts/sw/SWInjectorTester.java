package pl.zb3.customscripts.sw;

import java.io.File;
import java.io.IOException;

public class SWInjectorTester {
    public static void main(String[] args) throws IOException {
        SWInjector swm = new SWInjector(
                new File(System.getProperty("user.home")+"/.config/chromium/"
                        + "Default/Service Worker"));
        
        
        swm.ensureRegistered("https://cat.kl/", 
                "onfetch=function(event){"
                + "event.respondWith(new Response('works :>'));"
                + "}", 4);
        
        swm.ensureRegistered("https://cat.kl/oga", 
                "onfetch=function(event){"
                + "event.respondWith(new Response('works2 :>'));"
                + "}", 4);
        
        swm.ensureRegistered("https://other.kl/oga/", 
                "onfetch=function(event){"
                + "event.respondWith(new Response('works3 :>'));"
                + "}", 4);
        
        swm.installationDone();
        
        //*/
        /*
        
        swm.ensureRegistered("https://other.kl/", 
                "onfetch=function(event){"
                + "event.respondWith(new Response('works2 :>'));"
                + "}", 4);
        
        swm.ensureRegistered("https://other.kl/oga2/", 
                "onfetch=function(event){"
                + "event.respondWith(new Response('works3 :>'));"
                + "}", 4);

        swm.installationDone();
        
        
        //*/
        swm.destroy();
    }
}
