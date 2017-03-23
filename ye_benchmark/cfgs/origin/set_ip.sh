#!/bin/bash
workspace=/home/hkucs/my_ubuntu/benchmark/workspace/
cfgs=`ls *.cfg`
if [ $# -eq 1 ];then
    for cfg in $cfgs;do
	sed -e "s/10.22.1.15/$1/g" $cfg > ${workspace}${cfg}
    done
else
   echo "usage:set_ip [ip]"
fi 
