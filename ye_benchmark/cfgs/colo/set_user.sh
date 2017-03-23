#!/bin/bash
cfgs=`ls *.cfg`
for cfg in $cfgs;do
    sed -e "s/SERVER_USER=hkucs/SERVER_USER=$1/g" $cfg > tmp/$cfg
done
