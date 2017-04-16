#!/bin/bash
cfgs=`ls *.cfg`
if [ $# -eq 2 ];then
    for cfg in $cfgs;do
        sed -i "s|$1|$2|g" $cfg
    done
else
    echo "usage [ origin_path] [ new_path ]"
fi
