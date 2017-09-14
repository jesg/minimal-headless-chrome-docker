#!/bin/bash

#function shutdown {
#  kill -s SIGTERM $PROXY_PID
#  wait $PROXY_PID
#}
#
#cd /opt/proxy
#nodejs /opt/proxy/proxy.js &
#PROXY_PID=$!
#cd -


echo DOCKER HOST: $DOCKER_HOST

chromedriver --verbose --url-base=/wd/hub --port=4444 --whitelisted-ips=$DOCKER_HOST &
CHROMEDRIVER_PID=$!

trap shutdown SIGTERM SIGINT
wait $CHROMEDRIVER_PID
