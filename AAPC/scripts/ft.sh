#!/bin/sh
##################################
## Created by Yang on 4/29/2016 ##
##################################

socket1=""
socket2=""



/usr/local/bin/mu_power_gadget -r 100
/usr/local/bin/mu_power_gadget -p 180

freq=$1
for ((i=0;i<24;i++)) 
do
	echo $freq > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done

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
thNum=24
while [ $thNum -ge 2 ]; do
	
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"

	
	echo pack1:$GOMP_CPU_AFFINITY
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_${GOMP_CPU_AFFINITY}_$freq.data.txt
			
	thNum=$(echo $thNum-1|bc)
	if [ $((thNum%2)) -gt 0 ];	 then
		cpu_Num=$((thNum/2+12))
	else 
		cpu_Num=$((thNum/2))
	fi
	echo 1200000 > /sys/devices/system/cpu/cpu$cpu_Num/cpufreq/scaling_setspeed
	sleep 10
done

####################################
# Single socket 1 thread on 1 core #
####################################
# 2-20 threads
for ((i=0;i<24;i++)) 
do
	echo $freq > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done

thNum=22
while [ $thNum -ge 1 ]; do


	if [ $thNum -le 12 ]; then
		 #pkg_power1=$(echo $1-20|bc)
		 # dram_power1=$(echo $4-12|bc)
	     # /usr/local/bin/mu_power_gadget -2 $pkg_power1
		 # /usr/local/bin/mu_power_gadget -3 20
		 # /usr/local/bin/mu_power_gadget -0 $dram_power
		 # /usr/local/bin/mu_power_gadget -1 $dram_power
		socket1="0-$((thNum-1))"
		socket2=""
		#export KMP_AFFINITY="granularity=fine,compact,proclist=[$socket1]"
		export OMP_NUM_THREADS=$thNum
		export GOMP_CPU_AFFINITY="$socket1"
		
	else
		# pkg_power1=$(echo $1-40|bc)
		 # pkg_power1=$(echo $pkg_power1/$thNum|bc -l)
		 # pkg_power1=$(echo $pkg_power1*10|bc -l)
		 # pkg_power1=$(echo $pkg_power1+20|bc -l)
		 # pkg_power2=$(echo $1-$pkg_power1|bc -l)
		
		# dram_power1=$(echo $4-22|bc)
		# dram_power1=$(echo $dram_power1/$thNum|bc -l)
		# dram_power1=$(echo $dram_power1*10|bc -l)
		# dram_power1=$(echo $dram_power1+11|bc -l)
		# dram_power2=$(echo $4-$dram_power1|bc -l)
		# /usr/local/bin/mu_power_gadget -2 $pkg_power1
		# /usr/local/bin/mu_power_gadget -3 $pkg_power2
		# /usr/local/bin/mu_power_gadget -0 $dram_power
		 # /usr/local/bin/mu_power_gadget -1 $dram_power
		socket1="0-11"
		socket2="12-$((thNum-1))"
		export OMP_NUM_THREADS=$thNum
		export GOMP_CPU_AFFINITY="$socket1,$socket2"
	fi
	echo pack1:$GOMP_CPU_AFFINITY
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_${GOMP_CPU_AFFINITY}_$freq.data.txt
	thNum=$(echo $thNum-1|bc)
	echo 1200000 > /sys/devices/system/cpu/cpu$thNum/cpufreq/scaling_setspeed
	sleep 10
done

