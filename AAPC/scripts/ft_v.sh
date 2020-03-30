#!/bin/sh
##################################
## Created by Yang on 4/29/2016 ##
##################################



sudo /usr/local/bin/mu_power_gadget -r 100
sudo /usr/local/bin/mu_power_gadget -p 180

for ((i=0;i<24;i++)) 
do
	echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done

# totoalPower=240
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 105
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_$totoalPower.data.txt
# sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 98
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_$totoalPower.data.txt
# sleep 5
# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 88
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_$totoalPower.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 11.5
# sudo /usr/local/bin/mu_power_gadget -p 78.5
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_$totoalPower.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 11
# sudo /usr/local/bin/mu_power_gadget -p 69
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_$totoalPower.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 10.5
# sudo /usr/local/bin/mu_power_gadget -p 59.5
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_$totoalPower.data.txt
# sleep 5

# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 10.5
# sudo /usr/local/bin/mu_power_gadget -p 59.5
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_$totoalPower.data.txt
# sleep 5

# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 11
# sudo /usr/local/bin/mu_power_gadget -p 49
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 41
# sudo OMP_NUM_THREADS=16 GOMP_CPU_AFFINITY="0-10,12-22" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_$totoalPower.data.txt
# sleep 5
totoalPower=100
sudo /usr/local/bin/mu_power_gadget -r 11
sudo /usr/local/bin/mu_power_gadget -p 39
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=80
sudo /usr/local/bin/mu_power_gadget -r 8
sudo /usr/local/bin/mu_power_gadget -p 32
sudo OMP_NUM_THREADS=8 GOMP_CPU_AFFINITY="0-3,12-15" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_$totoalPower.data.txt
sleep 5
totoalPower=80
sudo /usr/local/bin/mu_power_gadget -r 10
sudo /usr/local/bin/mu_power_gadget -p 30
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=70
sudo /usr/local/bin/mu_power_gadget -0 7.5
sudo /usr/local/bin/mu_power_gadget -1 5
sudo /usr/local/bin/mu_power_gadget -3 34
sudo /usr/local/bin/mu_power_gadget -4 23.5 
sudo OMP_NUM_THREADS=1 GOMP_CPU_AFFINITY="0-4,12-16" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_$totoalPower.data.txt
sleep 5
totoalPower=70
sudo /usr/local/bin/mu_power_gadget -r 10
sudo /usr/local/bin/mu_power_gadget -p 25
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/FT/FT_${totoalPower}_icpp.data.txt
sleep 5
		

