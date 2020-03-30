#!/bin/sh
##################################
## Created by Yang on 4/29/2016 ##
##################################


thNum=24

for ((i=0;i<24;i++)) 
do
	#bash -c 'echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed'
	#echo "2300000" > /sys/devices/system/cpu/cpu/cpufreq/scaling_setspeed
	 echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
	#touch SP/$i.txt
	#echo 2300000 > SP/$i.txt
done
