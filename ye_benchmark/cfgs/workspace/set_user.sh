#!/bin/bash
if [ $# -eq 2 ];then
	cfgs=`ls *.cfg`
	for cfg in $cfgs;do
    	sed -i "1,3{s|SERVER_USER=$1|SERVER_USER=$2|g}" $cfg 
	done
else
	echo "usage: set_user [old_username] [new_username]"
fi
