#!/bin/sh

#  starRandomAccess_powerbound.sh
#  
#
#  Created by Yang He on 9/22/15.
#

export OMP_PLACES="{0:20}"
export OMP_NUM_THREADS=20
sleep 2

/usr/local/bin/mu_power_gadget -r -1
/usr/local/bin/mu_power_gadget -p -1

ramlimit=8
powerlimit=$(echo $1/2|bc)
pkgpower=20

rampower=$(echo $powerlimit-$pkgpower|bc)



step=2

cd /home/yhe/software-benchmark/NPB3.3.1/NPB3.3-OMP
if [ -f "EP.C_out.20" ]
then 
	rm "EP.C_out.20"
fi


while [ $(bc <<< "$rampower >= $ramlimit") -eq 1  ]; do
	filename=ep2C$1wPKG$pkgpower
	# Set power for ram and package
	/usr/local/bin/mu_power_gadget -p $pkgpower
	/usr/local/bin/mu_power_gadget -r $rampower
	echo current Package power: $pkgpower
	echo current DRAM power: $rampower
	/opt/power-bench/mclient -H 172.16.10.55 -d /tmp
	/opt/power-bench/mclient -H 172.16.10.55 -l ${filename}.total.txt
	# start rapl
	
	/usr/local/bin/rapl -s 0.1 -c 0,10 -f ~/projects/pzou_test/NPB/results/${filename}.rapl_log.txt 2>&1 1>/dev/null &
	# record the rapl process id
	rapl_pid=$!

	# start NPB
    bin/ep.C.x > EP.C_out.20
	mv EP.C_out.20 /home/yhe/projects/pzou_test/NPB/results/${filename}.data.txt

    /opt/power-bench/mclient -H 172.16.10.55 -e log
	kill ${rapl_pid}
	sleep 2
	scp 172.16.10.55:/tmp/${filename}.total.txt ~/projects/pzou_test/NPB/results
	sleep 1
    rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $powerlimit-$rampower|bc)
done
