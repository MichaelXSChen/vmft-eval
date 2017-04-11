## How to run virtual machine 
Script Location:10.22.1.4:/home/hkucs/my_ubuntu/benchmark/ye_benchmak/eval_environment

Basic command: 
python eval_environment.py -f environment.cfg -mem [memory size] -cpu[vcores] -primary [primarty id] -secondary [secondary ip] -m [mode] -t [fault tolerance]

-f  : specify the cfg file (colo_environment.cfg mc_environment.cfg norep_environment.cfg vmft_enviroment.cfg)

-mem: specify the memory of virtual machine (16384,8192,4096 ...)

-cpu: specify the vcores of virtual machine (16,8,4,2 ...)

-m  : specify the mode of this command (start,stop)

-t  : specify the fault tolerance strategy (mc,colo,norep,vmft)

### Example

#### to run colo:
python eval_environment.py -f environment.cfg -mem 16384 -cpu 4 -primary 202.45.128.163 -secondary 202.45.128.164 -m start -t colo

#### to stop virtual machine:
python eval_environment.py -f environment.cfg -mem 16384 -cpu 4 -primary 202.45.128.163 -secondary 202.45.128.164 -m stop -t colo

### Some suggestions
Suggest every time when you try to run start mode, run stop mode first.

And you might need to change the checkpoint delay under mc_environment.cfg by modifying 'MIGRATE_SET_MC_DELAY=migrate-set-mc-delay 100' of [KVM_MC] section where default checkpoint is 100ms.

You are not recommended to run more than 1 virtual machines in the same time because some mirror files may have the same ip of 10.22.1.15.

You can modify the mirror files under the cfg files.

## How to run benchmark
Script Location:10.22.1.4:/home/hkucs/my_ubuntu/benchmark/ye_benchmak/eval_app.py
Basic command:
python eval_app.py -f [path of cfg files]

### How to generate cfg files
The fundamental cfg files locates in 

/home/hkcus/my_ubuntu/benchmark/ye_benchmark/cfgs/origin/
 
*Please do not modify the files in this directory*

Go to the this directory,and type following command:
./generate_cfg.sh [virtual machine ip] [host user of virtual machine] [app_path]

Take vm_ubuntu.img as instance:

the ip of vm_ubuntu.img is 10.22.1.15,

the user of vm_ubuntu.img is cheng,

the applications is locating in /home/cheng/

Go to /home/hkucs/my_ubuntu/benchmark/ye_benchmark/cfgs/origin/ and type the following command.

./generate_cfg.sh 10.22.1.15 cheng /home/cheng/

*Actually as most of the environment of our mirrors are similar, the parameter are always the same except for the ip*

Then all the .cfg files is well generated in 

/home/hkucs/my_ubuntu/benchmark/workspace/

You can modify the cfg files in this directory to meet your requirement,such as modify the workload.

### Example
#### Benchmark redis in mirror vm_ubuntu
cd /home/hkucs/my_ubuntu/benchmark/ye_benchmark/cfgs/origin/

./generate_cfg.sh 10.22.1.15 cheng /home/cheng/

cd /home/hkucs/my_ubuntu/benchmark/ye_benchmark

python eval_app.py -f /home/cheng/my_ubuntu/benchmark/workspace/redis.cfg

### Collect data
The default report files locate in /home/hkucs/my_ubuntu/benchmark/report/
The most recent report can be found in [application name].rpt,for example, redis.rpt.

The most recent dirty logs of specific application can be found in redis_master.log or redis_slave.log (depends on the environment,for example,colo log the dirty pages in slave, so the result should be in redis_slave.log)

### Some suggestions
You can change the location of report files by making use of sed_report.sh under /home/hkucs/my_ubuntu/benchmark/workspace

for example, if you attempt to benchmark in colo with 4 cpu. Type following command:

./sed_report /report/ /report/en_colo_4/
```
