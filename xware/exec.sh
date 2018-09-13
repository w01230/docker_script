#!/bin/bash
set -e

while true; 
do
    pid=`ps -ef|grep ETMDaemon|grep -v grep|awk '{print $2}'`
    if [ -z "$pid" ]; then
	echo "restarting..."
        portal
    else
        sleep 10
    fi
done

