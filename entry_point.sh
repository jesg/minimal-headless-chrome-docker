#!/bin/bash

function shutdown {
  kill -s SIGTERM $PROXY_PID
  wait $PROXY_PID
}

cd /opt/proxy
nodejs /opt/proxy/proxy.js &
PROXY_PID=$!
cd -

 chromedriver --verbose --url-base=/wd/hub --port=4445  &
CHROMEDRIVER_PID=$!

trap shutdown SIGTERM SIGINT
wait $CHROMEDRIVER_PID
