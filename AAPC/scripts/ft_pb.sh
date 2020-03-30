#!/bin/sh
##################################
## Created by Yang on 4/29/2016 ##
##################################

socket1=""
socket2=""



/usr/local/bin/mu_power_gadget -r 100
/usr/local/bin/mu_power_gadget -p 180



########################
########################
## 1 thread on 1 core ##
# use pack1 in filename#
########################
########################

###################################
# Evenly distributed on 2 sockets #
###################################
# 2-20 threads

#pkg_power=$(echo $1/2|bc)
# dram_power=$(echo $4/2|bc)
#/usr/local/bin/mu_power_gadget -p $pkg_power
# /usr/local/bin/mu_power_gadget -r $dram_power
power=100
while [ $power -ge 20 ]; do
thNum=24
/usr/local/bin/mu_power_gadget -p $power
while [ $thNum -ge 8 ]; do
	
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"

	
	echo pack1:$GOMP_CPU_AFFINITY
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_${GOMP_CPU_AFFINITY}_$power.data.txt
			
	thNum=$(echo $thNum-4|bc)
	if [ $((thNum%2)) -gt 0 ];	 then
		cpu_Num=$((thNum/2+12))
	else 
		cpu_Num=$((thNum/2))
	fi
	#sudo echo 1200000 > /sys/devices/system/cpu/cpu$cpu_Num/cpufreq/scaling_setspeed
	sleep 10
done
power=$(echo $power-10|bc)
done
