package pl.zb3.customscripts;

import android.util.Log;
import java.util.ArrayList;
import java.util.regex.Pattern;

public final class CustomScript {

    static class NoPatternsException extends Exception {
    }

    public enum RunLocation {
        UNSPECIFIED, // actually this is not the default one
        DOCUMENT_END,
        DOCUMENT_IDLE
    }

    ArrayList<Pattern> includePatterns = new ArrayList<>();
    ArrayList<Pattern> excludePatterns = new ArrayList<>();
    RunLocation runLocation = RunLocation.DOCUMENT_END;

    public String code = null;

    CustomScript() {

    }

    public CustomScript(ScriptFile file) throws NoPatternsException {
        boolean hasPatterns = false;

        for (ScriptFile.KV directive : file.directives) {
            if (directive.value == null) {
                continue;
            }

            if (!directive.key.equals("match") && !directive.key.equals("url")
                    && !directive.key.equals("include")
                    && !directive.key.equals("exclude")) {
                continue;
            }

            Pattern p = URLUtils.compileRegex(directive.value.trim());
            if (!directive.key.equals("exclude")) {
                includePatterns.add(p);
                hasPatterns = true;
            } else {
                excludePatterns.add(p);
            }
        }

        if (!hasPatterns) {
            throw new NoPatternsException();
        }

        code = file.code;

        for (ScriptFile.KV directive : file.directives) {
            if (!directive.key.equals("run-at")) {
                continue;
            }

            if (directive.value.equals("document-end")) {
                runLocation = RunLocation.DOCUMENT_END;
            } else if (directive.value.equals("document-idle")) {
                runLocation = RunLocation.DOCUMENT_IDLE;
            } else {
                runLocation = RunLocation.UNSPECIFIED;
            }
        }

        if (runLocation == RunLocation.DOCUMENT_END) {
            code = "this['cs-code'] = function(){\n" + code
                    + "\n}; if (document.readyState === 'loading') "
                    + "document.addEventListener('DOMContentLoaded', "
                    + "this['cs-code']); else this['cs-code']();";
            Log.d("chromemod", "run@document-end @ " + file.file.getName());
        } else if (runLocation == RunLocation.DOCUMENT_IDLE) {
            code = "this['cs-code'] = function(){\n" + code
                    + "\n}; if (document.readyState !== 'complete') "
                    + "window.addEventListener('load', this['cs-code']); "
                    + "else this['cs-code']();";
            Log.d("chromemod", "run@document-idle @ " + file.file.getName());
        }
    }

    public boolean matchesURL(String url) {
        boolean matched = false;

        for (Pattern p : includePatterns) {
            if (p.matcher(url).matches()) {
                matched = true;
                break;
            }
        }

        if (!matched) {
            return false;
        }

        for (Pattern p : excludePatterns) {
            if (p.matcher(url).matches()) {
                return false;
            }
        }

        return true;
    }

}
