#!/bin/bash
cfgs=`ls *.cfg`
origin=/home/cheng/
if [ $# -eq 1 ];then
    for cfg in $cfgs;do
	sed -i "1,10{s|$origin|$1|g}" $cfg
    done
else
    echo "usage: set_path [new path]"
fi
