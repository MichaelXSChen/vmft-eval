#!/bin/bash
dir=/home/hkucs/my_ubuntu/benchmark/ye_benchmark
environments=(colo) 
pip=202.45.128.163
sip=202.45.128.164
log_ip=hkucs@202.45.128.160
cores=(4 8 16)
ip=10.22.1.15
master_log=latest_master_log
slave_log=latest_slave_log
log=$slave_log
cfgs=`ls cfgs/workspace/*.cfg`
report=/report
for environment in ${environments[@]};do
	echo "evironment: $environment"
	for core in ${cores[@]};do
		pushd $dir/cfgs/origin/
		./set_ip.sh $ip
		popd
		report_dir=en_${environment}_core_$core
		pushd ${dir}/report
		if [ ! -d ${report_dir} ];then
			mkdir ${report_dir}
		fi
		popd
		pushd $dir/cfgs/workspace/
		echo ${report_dir}
		./sed_report ${report}/ ${report}/${report_dir}/
		popd
		echo "core: $core"
		python eval_environment.py -f environment.cfg -m "start" -t ${environment} -cpu ${core} --memory 16348 -primary $pip -secondary $sip
		sleep  40
		sh $dir/back.sh
		sleep 10
		python eval_environment.py -f environment.cfg -m "stop" -t $environment -cpu $core --memory 16348 -primary $pip -secondary $sip
		#rm $dir/cfgs/workspace/*.cfg
	done
#	pip=202.45.128.160
#	sip=202.45.128.166
#	log=$master_log
done		
		
