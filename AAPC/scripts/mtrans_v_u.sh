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
# sudo /usr/local/bin/mu_power_gadget -P 100
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5
# totoalPower=240
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 100
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 90
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 90
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 85
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5
# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 80
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -0 15
# sudo /usr/local/bin/mu_power_gadget -1 15
# sudo /usr/local/bin/mu_power_gadget -2 115
# sudo /usr/local/bin/mu_power_gadget -3 35
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 75
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -0 15
# sudo /usr/local/bin/mu_power_gadget -1 15
# sudo /usr/local/bin/mu_power_gadget -2 95
# sudo /usr/local/bin/mu_power_gadget -3 35
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 60
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -0 15
# sudo /usr/local/bin/mu_power_gadget -1 15
# sudo /usr/local/bin/mu_power_gadget -2 75
# sudo /usr/local/bin/mu_power_gadget -3 35
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 55
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -0 15
# sudo /usr/local/bin/mu_power_gadget -1 15
# sudo /usr/local/bin/mu_power_gadget -2 55
# sudo /usr/local/bin/mu_power_gadget -3 35
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5

# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 48
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5

# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 45
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -0 12
# sudo /usr/local/bin/mu_power_gadget -1 8
# sudo /usr/local/bin/mu_power_gadget -2 50
# sudo /usr/local/bin/mu_power_gadget -3 30
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5

totoalPower=100
sudo /usr/local/bin/mu_power_gadget -r 10
sudo /usr/local/bin/mu_power_gadget -p 40
sudo OMP_NUM_THREADS=16 GOMP_CPU_AFFINITY="0-7,12-19" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_u.data.txt
sleep 5

# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 35
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -0 8
# sudo /usr/local/bin/mu_power_gadget -1 5
# sudo /usr/local/bin/mu_power_gadget -2 38
# sudo /usr/local/bin/mu_power_gadget -3 29
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5

totoalPower=80
sudo /usr/local/bin/mu_power_gadget -r 8
sudo /usr/local/bin/mu_power_gadget -p 32
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-5,12-17" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_u.data.txt
sleep 5

# totoalPower=80
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 25
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=70
# sudo /usr/local/bin/mu_power_gadget -0 8
# sudo /usr/local/bin/mu_power_gadget -1 5
# sudo /usr/local/bin/mu_power_gadget -2 33
# sudo /usr/local/bin/mu_power_gadget -3 24
# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
# sleep 5
totoalPower=70
sudo /usr/local/bin/mu_power_gadget -r 6
sudo /usr/local/bin/mu_power_gadget -p 29
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-5,12-17" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_u.data.txt
sleep 5

# totoalPower=70
# sudo /usr/local/bin/mu_power_gadget -r 15
# sudo /usr/local/bin/mu_power_gadget -p 15
# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
# sleep 5

