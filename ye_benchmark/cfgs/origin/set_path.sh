#!/bin/bash
cfgs=`ls *.cfg`
origin=/home/cheng/
if [ $# -eq 2 ];then
    for cfg in $cfgs;do
	sed -i "1,10{s|$1|$2|g}" $cfg 
    done
else
    echo "usage: set_path [old path "/home/user/"][new path]"
fi
