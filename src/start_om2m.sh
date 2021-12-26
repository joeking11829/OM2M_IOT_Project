#!/bin/bash

# enable IN
cd /root/om2m/in-cse && ./start.sh &

# enalbe MN
cd /root/om2m/mn-cse && ./start.sh &

# enable Node-RED
node-red &
