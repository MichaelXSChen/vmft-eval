#!/bin/bash
APP_ROOT=/home/hkucs/my_ubuntu/benchmark/ye_benchmark
#python eval_environment.py -m start -t colo -f environment.cfg &
#sleep 30
#ssh hkucs@202.45.128.163 python $APP_ROOT/eval_app.py -f $APP_ROOT/cfgs/colo_redis.cfg 
#sleep 3 
cfgs=`ls cfgs/colo/*.cfg`
for element in $cfgs;do
    echo $cfg > $1
    python eval_app.py -f $element
    sleep 20
#    break
done

