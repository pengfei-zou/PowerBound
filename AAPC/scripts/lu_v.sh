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
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 100
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_$totoalPower.data.txt
# sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 95
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_$totoalPower.data.txt
# sleep 5
# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 85
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_$totoalPower.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 78
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_$totoalPower.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 11
# sudo /usr/local/bin/mu_power_gadget -p 69
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_$totoalPower.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 10
# sudo /usr/local/bin/mu_power_gadget -p 60
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_$totoalPower.data.txt
# sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 51
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_$totoalPower.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 41
# sudo OMP_NUM_THREADS=20 GOMP_CPU_AFFINITY="0-9,12-21" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_$totoalPower.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 41
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_${totoalPower}_icpp.data.txt
# sleep 5
totoalPower=70
sudo /usr/local/bin/mu_power_gadget -r 7
sudo /usr/local/bin/mu_power_gadget -p 28
sudo OMP_NUM_THREADS=4 GOMP_CPU_AFFINITY="0-1,12-12" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_$totoalPower.data.txt
sleep 5
# totoalPower=70
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 26
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/LU/LU_${totoalPower}_icpp.data.txt
# sleep 5
		

