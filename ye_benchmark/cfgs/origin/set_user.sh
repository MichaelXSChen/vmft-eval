#!/bin/bash
cfgs=`ls *.cfg`
if [ $# -eq 1 ];then
    for cfg in $cfgs;do
        sed -e "s/SERVER_USER=hkucs/SERVER_USER=$1/g" $cfg > tmp/$cfg
    done
else
    echo "usage: set_user [user]"
fi
