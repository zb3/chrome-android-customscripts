## crossfetch

CS injects scripts with no additional permissions, so crossorigin fetch won't work..

But if the target origin is known, you can inject a SW there, and then use an iframe and communicate via `postMessage`.


Here's an example of how this can work, but we don't inject anything via SW, we just assume files are already there. To use it with CS, first ya'd need to inject `agent/cs-fetch-agent.html` via `swbase` 

Run:
```
python serve.py
```