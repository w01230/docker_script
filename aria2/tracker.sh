#!/bin/bash
config=aria2/aria2.conf
list=`wget -qO-  https://github.com/ngosang/trackerslist/raw/master/trackers_all.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`

if [ -z `grep "bt-tracker" ${config}` ]; then
    sed -i '$a bt-tracker='${list} ${config} 
    echo add...done.
else
    sed -i "s@bt-tracker.*@bt-tracker=$list@g" ${config} 
    echo update...done.
fi
