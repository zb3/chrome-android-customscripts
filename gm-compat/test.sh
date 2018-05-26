python3 url_compat.test.py || exit

python3 -m http.server 4004 &

SRV_PID=$!

# wait till the port is available
until echo | telnet localhost 4004 &>/dev/null; do sleep 0.2; done 

python3 gm-compile.py gm.test.js gm.compiled.js
python3 gm-compile.py http://localhost:4004/gm.test.js gm.compiled.fromurl.js

sed -i 's/data:text\/plain/data:application\/octet-stream/g' gm.compiled.fromurl.js

function run_server {
  if ! cmp -s gm.compiled.js gm.compiled.fromurl.js; then
    echo "Files are different!"
    return
  fi

  echo http://localhost:4004/test.html

  # https://www.vidarholen.net/contents/blog/?p=34
  trap : INT
  sleep infinity
}

run_server

kill $SRV_PID

# chromium test.html