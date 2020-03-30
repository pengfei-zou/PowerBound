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
freq=2500000
freqlimit=1200000
step=100000

cd /home/yhe/software-benchmark/NPB3.3.1/NPB3.3-OMP
if [ -f "BT.C_out.20" ]
then 
	rm "BT.C_out.20"
fi


while [ $(bc <<< "$freq >= $freqlimit") -eq 1  ]; do
	filename=btCFreq$freq
	# Set power for ram and package
	sudo sh /home/yhe/projects/pzou_test/set_cpu_freq.sh $freq
	/usr/local/bin/rapl -s 0.1 -c 0,10 -f ~/projects/pzou_test/NPB/results/${filename}.rapl_log.txt 2>&1 1>/dev/null &
	# record the rapl process id
	rapl_pid=$!

	# start NPB
    bin/bt.C.x > BT.C_out.20
	mv BT.C_out.20 /home/yhe/projects/pzou_test/NPB/results/${filename}.data.txt
	kill ${rapl_pid}
	sleep 2

    freq=$(echo $freq-$step|bc)

done


/usr/local/bin/mu_power_gadget -r -1
/usr/local/bin/mu_power_gadget -p -1