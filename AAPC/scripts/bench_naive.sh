#!/bin/sh
##################################
## Created by Yang on 4/29/2016 ##
##################################



cd /home/pzou/software/software-benchmark/hpcc-1.5.0_haswell/hpcc_RandomAccess

if [ -f "hpccoutf.txt" ];
then 
	rm hpccoutf.txt
fi

sudo /usr/local/bin/mu_power_gadget -r 100
sudo /usr/local/bin/mu_power_gadget -p 180

for ((i=0;i<24;i++)) 
do
	echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done

totoalPower=240
sudo /usr/local/bin/mu_power_gadget -r 20
sudo /usr/local/bin/mu_power_gadget -p 100

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/naive/EP_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/naive/SP_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/naive/LU_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/naive/FT_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/naive/BT_${totoalPower}_naive.data.txt
sleep 5

OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/naive/kmeans_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/mt_dgemm_haswell/mt-dgemm.o 2046 > /home/pzou/projects/haswell/n02/naive/dgemm_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/naive/stream_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/naive/mtrans_${totoalPower}_naive.data.txt
sleep 5

/usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
mv hpccoutf.txt /home/pzou/projects/haswell/n02/naive/randomAccess_${totoalPower}_naive.data.txt
sleep 5

totoalPower=200
sudo /usr/local/bin/mu_power_gadget -r 20
sudo /usr/local/bin/mu_power_gadget -p 80

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/naive/EP_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/naive/SP_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/naive/LU_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/naive/FT_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/naive/BT_${totoalPower}_naive.data.txt
sleep 5

OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/naive/kmeans_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/mt_dgemm_haswell/mt-dgemm.o 2046 > /home/pzou/projects/haswell/n02/naive/dgemm_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/naive/stream_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/naive/mtrans_${totoalPower}_naive.data.txt
sleep 5

/usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
mv hpccoutf.txt /home/pzou/projects/haswell/n02/naive/randomAccess_${totoalPower}_naive.data.txt
sleep 5

totoalPower=160
sudo /usr/local/bin/mu_power_gadget -r 20
sudo /usr/local/bin/mu_power_gadget -p 60

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/naive/EP_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/naive/SP_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/naive/LU_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/naive/FT_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/naive/BT_${totoalPower}_naive.data.txt
sleep 5

OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/naive/kmeans_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/mt_dgemm_haswell/mt-dgemm.o 2046 > /home/pzou/projects/haswell/n02/naive/dgemm_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/naive/stream_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/naive/mtrans_${totoalPower}_naive.data.txt
sleep 5

/usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
mv hpccoutf.txt /home/pzou/projects/haswell/n02/naive/randomAccess_${totoalPower}_naive.data.txt
sleep 5


totoalPower=120
sudo /usr/local/bin/mu_power_gadget -r 20
sudo /usr/local/bin/mu_power_gadget -p 40

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/naive/EP_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/naive/SP_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/naive/LU_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/naive/FT_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/naive/BT_${totoalPower}_naive.data.txt
sleep 5

OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/naive/kmeans_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/mt_dgemm_haswell/mt-dgemm.o 2046 > /home/pzou/projects/haswell/n02/naive/dgemm_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/naive/stream_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/naive/mtrans_${totoalPower}_naive.data.txt
sleep 5

/usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
mv hpccoutf.txt /home/pzou/projects/haswell/n02/naive/randomAccess_${totoalPower}_naive.data.txt
sleep 5


totoalPower=80
sudo /usr/local/bin/mu_power_gadget -r 20
sudo /usr/local/bin/mu_power_gadget -p 20

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/naive/EP_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/naive/SP_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/lu.C.x > /home/pzou/projects/haswell/n02/naive/LU_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ft.C.x > /home/pzou/projects/haswell/n02/naive/FT_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/naive/BT_${totoalPower}_naive.data.txt
sleep 5

OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/naive/kmeans_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/mt_dgemm_haswell/mt-dgemm.o 2046 > /home/pzou/projects/haswell/n02/naive/dgemm_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/naive/stream_${totoalPower}_naive.data.txt
sleep 5

sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/naive/mtrans_${totoalPower}_naive.data.txt
sleep 5

/usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
mv hpccoutf.txt /home/pzou/projects/haswell/n02/naive/randomAccess_${totoalPower}_naive.data.txt
sleep 5