#!/bin/bash
APP_ROOT=/home/hkucs/my_ubuntu/benchmark/ye_benchmark
LOG_PATH=/home/hkucs/qemu_output/
OUT_PATH=/home/hkucs/my_ubuntu/benchmark/ye_benchmark/report
#python eval_environment.py -m start -t colo -f environment.cfg &
#sleep 30
#ssh hkucs@202.45.128.163 python $APP_ROOT/eval_app.py -f $APP_ROOT/cfgs/colo_redis.cfg 
#sleep 3 
cfgs=`ls cfgs/workspace/*.cfg`
if [ $# -eq 2 ]; then
    for element in $cfgs;do
       cat /dev/null > $2
       echo >> $element
       name=`echo $element | cut -f3 -d "/" `
	echo $name
       python eval_app.py -f $element
	echo "$OUT_PATH/${1}/${name}_Dirty"
       cat $2 > $OUT_PATH/${1}/${name}_Dirty
       sleep 40
#    break
    done
else
    echo "usage:run.sh [ip ] [ log_path ]"
fi
