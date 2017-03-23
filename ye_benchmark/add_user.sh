#!/bin/bash
cfgs=`ls *.cfg`
for cfg in $cfgs;do
    sed -e "2 a SERVER_USER=$1" $cfg > cfgs/colo/$cfg
done
