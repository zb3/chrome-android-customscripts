Scripts ending with `.user.js` can be copied to CS folder directly. Note that URL pattern syntax is _mostly_ compatible with original userscript syntax, but is not the same.

# generic-blocker.js

CS can (kinda) inject things into webpages, either normally or via SW (see swbase). If you just want to (try to) block elements by selectors or block some network requests, generic-blocker.js can help - it allows you to block elements by selectors and filter some network requests. Note that generic-blocker.js doesn't try to win any fights with scripts that would want to bypass it. The solution is to block such scripts before they can act.

GB can:
* filter elements by selectors
* filter inline scripts by their source
* filter (some) network requests by domain/url

## Usage

1. Edit the `config` variable at the top of the script, it's self-explanatory. 
2. Configure how you'd want to inject it @document-start (in CS this can be done only via SW).
3. Instruct CS to do so via copying the file.

GB doesn't support any lists at this point. List support is out of scope, you'd need something to compile those lists into GB's config format...

## GB vs Uponit
Since GB can be easily bypassed, in some cases we need to block specific scripts. But we can't always do this via config, because sometimes we don't  know whether we should block a script until it's partially executed (static analysis is insufficient). This mandates custom logic that will detect bad behaviour of a script while it's executed. Then, to stop that script, we could overwrite some method and throw, but adversaries know that and use `try/catch` blocks, so that's not effective. 

That's why there's a little mechanism to mark currently executed script as blocked - we disable some network/timer/DOM insertion functions for  currently executed script, so that even though it continues, we'll prevent it from doing what we don't want it to do. Of course this isn't flawless, but works in one particular case seen in the wild... see "custom logic for uponit" at the end of the file.

  
