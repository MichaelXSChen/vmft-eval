#!/bin/bash
cfgs=`ls *.cfg`
for cfg in $cfgs;do
	sed -i "1,10{s|$1|$2|g}" $cfg
done
