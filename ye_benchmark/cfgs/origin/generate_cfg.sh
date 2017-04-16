#!/bin/bash
workspace=/home/hkucs/my_ubuntu/benchmark/workspace/
if [ $# -eq 3 ];then
	sh set_ip.sh $1
	sh ${workspace}set_user.sh cheng $2
	sh ${workspace}set_path.sh $3
else
	echo "usage: generate_cfg [virtual machine ip] [host_user] [app_path]"	
fi
