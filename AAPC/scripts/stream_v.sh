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
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_$totoalPower.data.txt
# sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 19
# sudo /usr/local/bin/mu_power_gadget -p 91
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_$totoalPower.data.txt
# sleep 5

# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 90
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_icpp.data.txt
# sleep 5

# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 19
# sudo /usr/local/bin/mu_power_gadget -p 91
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_$totoalPower.data.txt
# sleep 5

# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 80
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 18
# sudo /usr/local/bin/mu_power_gadget -p 72
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-5,12-17" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_$totoalPower.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 70
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 17
# sudo /usr/local/bin/mu_power_gadget -p 63
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-5,12-17" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_$totoalPower.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 60
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 16
# sudo /usr/local/bin/mu_power_gadget -p 54
# sudo OMP_NUM_THREADS=10 GOMP_CPU_AFFINITY="0-4,12-16" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_$totoalPower.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 50
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 14
# sudo /usr/local/bin/mu_power_gadget -p 46
# sudo OMP_NUM_THREADS=6 GOMP_CPU_AFFINITY="0-2,12-14" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_$totoalPower.data.txt
# sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 40
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 13
# sudo /usr/local/bin/mu_power_gadget -p 37
# sudo OMP_NUM_THREADS=4 GOMP_CPU_AFFINITY="0-1,12-13" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_$totoalPower.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 30
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 28
# sudo OMP_NUM_THREADS=2 GOMP_CPU_AFFINITY="0-0,12-12" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_$totoalPower.data.txt
# sleep 5
# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 20
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_icpp.data.txt
# sleep 5
		
totoalPower=70
sudo /usr/local/bin/mu_power_gadget -0 10
sudo /usr/local/bin/mu_power_gadget -1 5
sudo /usr/local/bin/mu_power_gadget -2 30
sudo /usr/local/bin/mu_power_gadget -3 25
sudo OMP_NUM_THREADS=1 GOMP_CPU_AFFINITY="0-0" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_$totoalPower.data.txt
sleep 5
totoalPower=70
sudo /usr/local/bin/mu_power_gadget -r 20
sudo /usr/local/bin/mu_power_gadget -p 15
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_icpp.data.txt
sleep 5
		
