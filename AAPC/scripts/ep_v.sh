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
	echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done

# totoalPower=240
# sudo /usr/local/bin/mu_power_gadget -r 25
# sudo /usr/local/bin/mu_power_gadget -p 95
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_$totoalPower.data.txt
# sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 90
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_$totoalPower.data.txt
# sleep 5
# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 85
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_$totoalPower.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 75
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_$totoalPower.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 10
# sudo /usr/local/bin/mu_power_gadget -p 70
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_$totoalPower.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 5.5
# sudo /usr/local/bin/mu_power_gadget -p 64.5
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_$totoalPower.data.txt
# sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 5.5
# sudo /usr/local/bin/mu_power_gadget -p 54.5
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_$totoalPower.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 5.5
# sudo /usr/local/bin/mu_power_gadget -p 44.5
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-12,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_$totoalPower.data.txt
# sleep 5
# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -r 5.5
# sudo /usr/local/bin/mu_power_gadget -p 34.5
# sudo OMP_NUM_THREADS=18 GOMP_CPU_AFFINITY="0-8,12-20" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_$totoalPower.data.txt
# sleep 5
# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -r 5.5
# sudo /usr/local/bin/mu_power_gadget -p 34.5
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=60
# sudo /usr/local/bin/mu_power_gadget -r 5
# sudo /usr/local/bin/mu_power_gadget -p 25
# sudo OMP_NUM_THREADS=2 GOMP_CPU_AFFINITY="0-0,12-12" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_$totoalPower.data.txt
# sleep 5
totoalPower=70
sudo /usr/local/bin/mu_power_gadget -r 5.5
sudo /usr/local/bin/mu_power_gadget -p 29.5
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_icpp.data.txt
sleep 5

totoalPower=70
sudo /usr/local/bin/mu_power_gadget -r 5.5
sudo /usr/local/bin/mu_power_gadget -p 29.5
sudo OMP_NUM_THREADS=10 GOMP_CPU_AFFINITY="0-4,12-16" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}.data.txt
sleep 5
