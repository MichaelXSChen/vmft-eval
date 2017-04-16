#!/bin/bash
workspace=/home/hkucs/my_ubuntu/benchmark/workspace/
cfgs=`ls *.cfg`
if [ $# -eq 2 ];then
    for cfg in $cfgs;do
	sed -i "s/$1/$2/g" $cfg
    done
else
   echo "usage:set_ip [old_ip] [new_ip]"
fi 
