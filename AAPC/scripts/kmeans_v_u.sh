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
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 100
# OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}.data.txt
# sleep 5
# totoalPower=240
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 100
# OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 90
# OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}.data.txt
# sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 90
# OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 85
# OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}.data.txt
# sleep 5
# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 80
# OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -0 15
# sudo /usr/local/bin/mu_power_gadget -1 15
# sudo /usr/local/bin/mu_power_gadget -2 115
# sudo /usr/local/bin/mu_power_gadget -3 35
# OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 75
# OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -0 15
# sudo /usr/local/bin/mu_power_gadget -1 15
# sudo /usr/local/bin/mu_power_gadget -2 95
# sudo /usr/local/bin/mu_power_gadget -3 35
# OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 60
# OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -0 15
# sudo /usr/local/bin/mu_power_gadget -1 15
# sudo /usr/local/bin/mu_power_gadget -2 75
# sudo /usr/local/bin/mu_power_gadget -3 35
# OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 55
# OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -0 15
# sudo /usr/local/bin/mu_power_gadget -1 15
# sudo /usr/local/bin/mu_power_gadget -2 55
# sudo /usr/local/bin/mu_power_gadget -3 35
# OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}.data.txt
# sleep 5

# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 48
# OMP_NUM_THREADS=18 GOMP_CPU_AFFINITY="0-8,12-20" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_u.data.txt
# sleep 5

# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 45
# OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 10
# sudo /usr/local/bin/mu_power_gadget -p 40
# OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-5,12-17" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_u.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -0 12
# sudo /usr/local/bin/mu_power_gadget -1 8
# sudo /usr/local/bin/mu_power_gadget -2 50
# sudo /usr/local/bin/mu_power_gadget -3 30
# OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 35
# OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -0 8
# sudo /usr/local/bin/mu_power_gadget -1 5
# sudo /usr/local/bin/mu_power_gadget -2 38
# sudo /usr/local/bin/mu_power_gadget -3 29
# OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}.data.txt
# sleep 5
totoalPower=80
sudo /usr/local/bin/mu_power_gadget -r 8
sudo /usr/local/bin/mu_power_gadget -p 32
OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-5,12-17" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_u.data.txt
sleep 5

totoalPower=80
sudo /usr/local/bin/mu_power_gadget -0 9
sudo /usr/local/bin/mu_power_gadget -1 7
sudo /usr/local/bin/mu_power_gadget -2 38
sudo /usr/local/bin/mu_power_gadget -3 26
OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}.data.txt
sleep 5
# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 25
# OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=70
# sudo /usr/local/bin/mu_power_gadget -r 6
# sudo /usr/local/bin/mu_power_gadget -p 29
# OMP_NUM_THREADS=6 GOMP_CPU_AFFINITY="0-2,12-14" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_u.data.txt
# sleep 5
# totoalPower=70
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 20
# OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_icpp.data.txt
# sleep 5
