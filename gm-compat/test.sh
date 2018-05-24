python3 -m http.server 4004 &

SRV_PID=$!

# wait till the port is available
until echo | telnet localhost 4004 &>/dev/null; do sleep 0.2; done 

python3 gm-compile.py gm.test.js gm.compiled.js

kill $SRV_PID

# chromium test.html