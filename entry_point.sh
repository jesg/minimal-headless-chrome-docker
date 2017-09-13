#!/bin/bash

function shutdown {
  kill -s SIGTERM $SELENIUM_PID
  wait $SELENIUM_PID
}

chromedriver --verbose --url-base=/wd/hub --port=4444 &
CHROMEDRIVER_PID=$!

trap shutdown SIGTERM SIGINT
wait $CHROMEDRIVER_PID
