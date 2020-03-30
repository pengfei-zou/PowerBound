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
# sudo /usr/local/bin/mu_power_gadget -r 24
# sudo /usr/local/bin/mu_power_gadget -p 96
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_$totoalPower.data.txt
# sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 19
# sudo /usr/local/bin/mu_power_gadget -p 91
# sudo OMP_NUM_THREADS=22 GOMP_CPU_AFFINITY="0-10,12-22" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_$totoalPower.data.txt
# sleep 5
totoalPower=220
sudo /usr/local/bin/mu_power_gadget -0 26
sudo /usr/local/bin/mu_power_gadget -1 24
sudo /usr/local/bin/mu_power_gadget -2 88
sudo /usr/local/bin/mu_power_gadget -3 82
sudo OMP_NUM_THREADS=22 GOMP_CPU_AFFINITY="0-11,12-21" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_u.data.txt
sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 22
# sudo /usr/local/bin/mu_power_gadget -p 86
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 18.5
# sudo /usr/local/bin/mu_power_gadget -p 81.5
# sudo OMP_NUM_THREADS=20 GOMP_CPU_AFFINITY="0-9,12-21" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_$totoalPower.data.txt
# sleep 5

totoalPower=200
sudo /usr/local/bin/mu_power_gadget -0 26
sudo /usr/local/bin/mu_power_gadget -1 20
sudo /usr/local/bin/mu_power_gadget -2 84
sudo /usr/local/bin/mu_power_gadget -3 70
sudo OMP_NUM_THREADS=20 GOMP_CPU_AFFINITY="0-11,12-19" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_u.data.txt
sleep 5

# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 80
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 18
# sudo /usr/local/bin/mu_power_gadget -p 72
# sudo OMP_NUM_THREADS=18 GOMP_CPU_AFFINITY="0-8,12-20" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_$totoalPower.data.txt
# sleep 5
totoalPower=180
sudo /usr/local/bin/mu_power_gadget -0 26
sudo /usr/local/bin/mu_power_gadget -1 18
sudo /usr/local/bin/mu_power_gadget -2 80
sudo /usr/local/bin/mu_power_gadget -3 56
sudo OMP_NUM_THREADS=18 GOMP_CPU_AFFINITY="0-11,12-17" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_u.data.txt
sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 70
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 16
# sudo /usr/local/bin/mu_power_gadget -p 64
# sudo OMP_NUM_THREADS=14 GOMP_CPU_AFFINITY="0-6,12-18" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}.data.txt
# sleep 5
totoalPower=160
sudo /usr/local/bin/mu_power_gadget -0 26
sudo /usr/local/bin/mu_power_gadget -1 14
sudo /usr/local/bin/mu_power_gadget -2 80
sudo /usr/local/bin/mu_power_gadget -3 40
sudo OMP_NUM_THREADS=14 GOMP_CPU_AFFINITY="0-11,12-13" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_u.data.txt
sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 60
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 58
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-5,12-17" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_$totoalPower.data.txt
# sleep 5
totoalPower=140
sudo /usr/local/bin/mu_power_gadget -0 24
sudo /usr/local/bin/mu_power_gadget -1 10
sudo /usr/local/bin/mu_power_gadget -2 76
sudo /usr/local/bin/mu_power_gadget -3 30
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_u.data.txt
sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 50
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 9.5
# sudo /usr/local/bin/mu_power_gadget -p 50.5
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-5,12-17" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_$totoalPower.data.txt
# sleep 5
totoalPower=120
sudo /usr/local/bin/mu_power_gadget -0 18
sudo /usr/local/bin/mu_power_gadget -1 9
sudo /usr/local/bin/mu_power_gadget -2 63
sudo /usr/local/bin/mu_power_gadget -3 30
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_u.data.txt
sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 9.5
# sudo /usr/local/bin/mu_power_gadget -p 50.5
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 11
# sudo /usr/local/bin/mu_power_gadget -p 39
# sudo OMP_NUM_THREADS=10 GOMP_CPU_AFFINITY="0-4,12-16" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_$totoalPower.data.txt
# sleep 5
totoalPower=100
sudo /usr/local/bin/mu_power_gadget -0 16
sudo /usr/local/bin/mu_power_gadget -1 8
sudo /usr/local/bin/mu_power_gadget -2 48
sudo /usr/local/bin/mu_power_gadget -3 28
sudo OMP_NUM_THREADS=10 GOMP_CPU_AFFINITY="0-9" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_u.data.txt
sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 30
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 31
# sudo OMP_NUM_THREADS=6 GOMP_CPU_AFFINITY="0-2,12-14" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_$totoalPower.data.txt
# sleep 5
totoalPower=80
sudo /usr/local/bin/mu_power_gadget -0 10
sudo /usr/local/bin/mu_power_gadget -1 7
sudo /usr/local/bin/mu_power_gadget -2 37
sudo /usr/local/bin/mu_power_gadget -3 26
sudo OMP_NUM_THREADS=6 GOMP_CPU_AFFINITY="0-5" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_u.data.txt
sleep 5
# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 31
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_icpp.data.txt
# sleep 5
		
# totoalPower=70
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 31
# sudo OMP_NUM_THREADS=2 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}.data.txt
# sleep 5

totoalPower=70
sudo /usr/local/bin/mu_power_gadget -0 8
sudo /usr/local/bin/mu_power_gadget -1 6
sudo /usr/local/bin/mu_power_gadget -2 30
sudo /usr/local/bin/mu_power_gadget -3 26
sudo OMP_NUM_THREADS=2 GOMP_CPU_AFFINITY="0-1" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_u.data.txt
sleep 5		
		
# totoalPower=70
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 26
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_icpp.data.txt
# sleep 5