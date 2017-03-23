#!/bin/bash
cfgs=`ls cfgs/origin/*.cfg`
if [ $# -eq 1 ];then
    for cfg in $cfgs;do
	sed -e "s/10.22.1.15/$1/g" cfgs/origin/$cfg > cfgs/workspace/$cfg
    done
else
   echo "usage:set_ip [ip]"
fi 
