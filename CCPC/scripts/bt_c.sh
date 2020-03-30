#!/bin/sh

#  bt_c.sh
#  
#  Created by Yang He on 3/20/16.
#


sudo /usr/local/bin/mu_power_gadget -r -1
sudo /usr/local/bin/mu_power_gadget -p -1
powerlimit=$(echo $1/2|bc)
pkglimit=16
pkgpower=$pkglimit
rampower=$(echo $powerlimit-$pkgpower|bc)
ramlimit=8
step=2
ram1power=5
pkg1power=23

cd /home/yhe/software-benchmark/NPB3.3.1/NPB3.3-OMP
if [ -f "BT.C_out" ]
then 
	rm "BT.C_out"
fi

while [ $(bc <<< "$rampower >= $ramlimit") -eq 1  ]; do


	thNum=12
	export GOMP_CPU_AFFINITY="0-11"
	export OMP_NUM_THREADS=$thNum
	echo current thread number: $thNum
	ram0power=$(echo $rampower+$rampower-$ram1power|bc)
	sudo /usr/local/bin/mu_power_gadget -0 $ram0power
	sudo /usr/local/bin/mu_power_gadget -1 $ram1power
	pkg0power=$(echo $pkgpower+$pkgpower-$pkg1power|bc)
	sudo /usr/local/bin/mu_power_gadget -2 $pkg0power
	sudo /usr/local/bin/mu_power_gadget -3 $pkg1power

        #sudo /usr/local/bin/mu_power_gadget -r $rampower
        #sudo /usr/local/bin/mu_power_gadget -p $pkgpower

	filename=BT.C.$1wDram${rampower}thNum$thNum

	/usr/local/bin/rapl -s 0.1 -c 0,12 -f /home/yhe/projects/ivy/npb_threads/results/${filename}.rapl_log.txt 2>&1 1>/dev/null &
	# record the rapl process id
	rapl_pid=$!

	# start NPB
	results=$(~/software-benchmark/NPB3.3.1/NPB3.3-OMP/bin/bt.C.x)
	echo -e $result >> ~/projects/ivy/npb_threads/results/${filename}.data.txt
	kill ${rapl_pid}
	sleep 1 
    	
	pkgpower=$(echo $pkgpower+$step|bc)
	rampower=$(echo $powerlimit-$pkgpower|bc)
done
