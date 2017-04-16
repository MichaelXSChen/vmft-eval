#!/bin/bash
if [ $# -eq 1 ];then
	cfgs=`ls *.cfg`
	for cfg in $cfgs;do
    	sed -i "2 a SERVER_USER=$1" $cfg 
	done
