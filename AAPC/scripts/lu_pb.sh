#!/bin/sh
##################################
## Created by Yang on 4/29/2016 ##
##################################

socket1=""
socket2=""



/usr/local/bin/mu_power_gadget -r 100
/usr/local/bin/mu_power_gadget -p 180

module load gcc-6.2.0
module load openmpi-2.0.1

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
power=40
# while [ $power -ge 30 ]; do
thNum=24

for ((i=0;i<24;i++)) 
do
	echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done

/usr/local/bin/mu_power_gadget -p $power
while [ $thNum -ge 10 ]; do
	
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"

	for ((i=$((thNum/2));i<12;i++))
	do
	 #sudo bash -c 'echo 1200000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed'
	# sudo bash -c 'echo 1200000 > /sys/devices/system/cpu/cpu$((i+12))/cpufreq/scaling_setspeed'
		echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
		echo 2300000 > /sys/devices/system/cpu/cpu$((i+12))/cpufreq/scaling_setspeed
	done
	
	echo pack1:$GOMP_CPU_AFFINITY
	/usr/local/bin/rapl -c 0,12 -s 0.1 -f /home/pzou/projects/haswell/n02/SP/SP_${GOMP_CPU_AFFINITY}_$power.log 2>&1 1>/dev/null &
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${GOMP_CPU_AFFINITY}_$power.data.txt
	mpirun -np 1 /home/pzou/software/software-benchmark/NPB3.3.1-MZ/NPB3.3-MZ-MPI/bin/lu-mz.C.1	> /home/pzou/projects/haswell/n02/LU/LU_${GOMP_CPU_AFFINITY}_$power.data.txt	
	pkill rapl
	thNum=$(echo $thNum-4|bc)
	if [ $((thNum%2)) -gt 0 ];	 then
		cpu_Num=$((thNum/2+12))
	else 
		cpu_Num=$((thNum/2))
	fi
	# sudo su
	
	# exit
	sleep 10
done
power=$(echo $power-10|bc)
for ((i=0;i<24;i++)) 
do
	echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done
# done