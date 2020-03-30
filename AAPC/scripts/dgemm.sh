#!/bin/sh
##################################
## Created by Yang on 4/29/2016 ##
##################################

socket1=""
socket2=""



sudo /usr/local/bin/mu_power_gadget -r 100
sudo /usr/local/bin/mu_power_gadget -p 180

for ((i=0;i<24;i++)) 
do
	echo $2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done

# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 90
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_$totoalPower.data.txt
# sleep 5
# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 85
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_$totoalPower.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 11
# sudo /usr/local/bin/mu_power_gadget -p 79
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_$totoalPower.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 10.5
# sudo /usr/local/bin/mu_power_gadget -p 69;5
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_$totoalPower.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 10
# sudo /usr/local/bin/mu_power_gadget -p 60
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_$totoalPower.data.txt
# sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 9.5
# sudo /usr/local/bin/mu_power_gadget -p 50.5
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_$totoalPower.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 41
# sudo OMP_NUM_THREADS=22 GOMP_CPU_AFFINITY="0-10,12-22" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_$totoalPower.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 41
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_icpp.data.txt
# sleep 5
totoalPower=80
sudo /usr/local/bin/mu_power_gadget -r 7.5
sudo /usr/local/bin/mu_power_gadget -p 32.5
sudo OMP_NUM_THREADS=10 GOMP_CPU_AFFINITY="0-4,12-16" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_$totoalPower.data.txt
sleep 5
# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 31
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_icpp.data.txt
# sleep 5
		

