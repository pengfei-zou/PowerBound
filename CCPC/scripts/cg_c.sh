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
pkglimit=20
ramlimit=8
powerlimit=$(echo $1/2|bc)
pkgpower=$(echo $powerlimit-$ramlimit|bc)
rampower=$(echo $powerlimit-$pkgpower|bc)


step=2

cd /home/yhe/software-benchmark/NPB3.3.1/NPB3.3-OMP
if [ -f "CG.C_out.20" ]
then 
	rm "CG.C_out.20"
fi


while [ $(bc <<< "$pkgpower >= $pkglimit") -eq 1  ]; do
	filename=cgC$1wPKG$pkgpower
	# Set power for ram and package
	/usr/local/bin/mu_power_gadget -p $pkgpower
	/usr/local/bin/mu_power_gadget -r $rampower
	echo current Package power: $pkgpower
	echo current DRAM power: $rampower
	
	# start rapl
	
	/usr/local/bin/rapl -s 0.1 -c 0,10 -f ~/projects/pzou_test/NPB/results2/${filename}.rapl_log.txt 2>&1 1>/dev/null &
	# record the rapl process id
	rapl_pid=$!

	# start NPB
    bin/cg.C.x > CG.C_out.20
	mv CG.C_out.20 /home/yhe/projects/pzou_test/NPB/results2/${filename}.data.txt
	kill ${rapl_pid}
	sleep 2
	
	sleep 1
    pkgpower=$(echo $pkgpower-$step|bc)
    rampower=$(echo $powerlimit-$pkgpower|bc)
done
