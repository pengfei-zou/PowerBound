#!/bin/sh

#  stream_powerbound.sh
#  
#
#  Created by Pengfei Zou on 2/10/16.
#

cd /home/yhe/software-benchmark/hpcc-steam

if [ -f "hpccoutf.txt" ]
then 
	rm "hpccoutf.txt"
fi

/usr/local/bin/mu_power_gadget -r -1
/usr/local/bin/mu_power_gadget -p -1
powerlimit=$(echo $1/2|bc)
pkglimit=20
pkgpower=$pkglimit
rampower=$(echo $powerlimit-$pkgpower|bc)
ramlimit=8
step=1

while [ $(bc <<< "$rampower >= $ramlimit") -eq 1  ]; do


	filename=stream$1wDram$rampower
	# Set power for ram and package
	/usr/local/bin/mu_power_gadget -r $rampower
	/usr/local/bin/mu_power_gadget -p $pkgpower
	echo current Package power: $pkgpower
	echo current DRAM power: $rampower
	/opt/power-bench/mclient -H 172.16.10.55 -d /tmp
	/opt/power-bench/mclient -H 172.16.10.55 -l ${filename}.total.txt
	# start rapl
	/usr/local/bin/rapl -s 0.1 -c 0,10 -f ~/projects/pzou_test/stream_powerbound/results/${filename}.rapl_log.txt 2>&1 1>/dev/null &
	# record the rapl process id
	rapl_pid=$!

	# start hpcc
	/usr/lib64/openmpi/bin/mpiexec -np 20 ./hpcc

	/opt/power-bench/mclient -H 172.16.10.55 -e log
	kill ${rapl_pid}
	sleep 2
	mv hpccoutf.txt ~/projects/pzou_test/stream_powerbound/results/${filename}.data.txt
	scp 172.16.10.55:/tmp/${filename}.total.txt ~/projects/pzou_test/stream_powerbound/results/
	sleep 1
    pkgpower=$(echo $pkgpower+$step|bc)
    rampower=$(echo $powerlimit-$pkgpower|bc)
done
