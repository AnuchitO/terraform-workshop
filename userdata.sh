#!/bin/bash

ip="$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')"
echo "hello AnuchitO" > index.html
echo $ip >> index.html

python -m SimpleHTTPServer 8000  > /dev/null 2>&1 &
