#!/bin/sh
##################################
## Created by Yang on 4/29/2016 ##
##################################


/usr/local/bin/mu_power_gadget -r 100
/usr/local/bin/mu_power_gadget -p 180

for ((i=0;i<24;i++)) 
do
	echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done
#!/bin/sh


socket1=""
socket2=""



/usr/local/bin/mu_power_gadget -r 100
/usr/local/bin/mu_power_gadget -p 180


freq=2300000
for ((i=0;i<24;i++)) 
do
	echo $freq > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done

########################
########################
## 1 thread on 1 core ##
# use pack1 in filename#
########################
########################

###################################
# Evenly distributed on 2 sockets #
###################################
# 2-20 threads

cd /home/pzou/software/software-benchmark/hpcc-1.5.0_haswell/hpcc_RandomAccess

if [ -f "hpccoutf.txt" ];
then 
	rm hpccoutf.txt
fi


pkg_power=$(echo $1/2|bc)
thNum=24

while [ $thNum -ge 4 ]; do
	

	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	filename=randomAccess_"$socket1,$socket2"_$freq
	echo pack1:"$socket1,$socket2"
	/usr/local/bin/rapl -s 0.1 -c 0,12 -f /home/pzou/projects/haswell/n02/RandomAccess/${filename}.rapl_log.txt 2>&1 1>/dev/null &
	rapl_pid=$!
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	kill ${rapl_pid}
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/RandomAccess/${filename}.data.txt

	
	thNum=$(echo $thNum-1|bc)
	if [ $((thNum%2)) -gt 0 ];	 then
		cpu_Num=$((thNum/2+12))
	else 
		cpu_Num=$((thNum/2))
	fi
	echo 1200000 > /sys/devices/system/cpu/cpu$cpu_Num/cpufreq/scaling_setspeed
	sleep 5
done

####################################
# Single socket 1 thread on 1 core #
####################################
# 2-20 threads
for ((i=0;i<24;i++)) 
do
	echo $freq > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done

thNum=22
while [ $thNum -ge 4 ]; do


	if [ $thNum -le 12 ]; then
		 pkg_power1=$(echo $1-20|bc)

		socket1="0-$((thNum-1))"
		socket2=""

		
	else
		pkg_power1=$(echo $1-40|bc)
		pkg_power1=$(echo $pkg_power1/$thNum|bc -l)
		pkg_power1=$(echo $pkg_power1*10|bc -l)
		pkg_power1=$(echo $pkg_power1+20|bc -l)
		pkg_power2=$(echo $1-$pkg_power1|bc -l)
		socket1="0-11"
		socket2="12-$((thNum-1))"
	fi
	echo pack1:"$socket1,$socket2"	
	filename=randomAccess_"$socket1,$socket2"_$freq
	/usr/local/bin/rapl -s 0.1 -c 0,12 -f /home/pzou/projects/haswell/n02/RandomAccess/${filename}.rapl_log.txt 2>&1 1>/dev/null &
	rapl_pid=$!
	/usr/lib64/openmpi/bin/mpiexec -np $thNum  --bind-to core --map-by core ./hpcc
	kill ${rapl_pid}
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/RandomAccess/${filename}.data.txt
	
	echo 1200000 > /sys/devices/system/cpu/cpu$thNum/cpufreq/scaling_setspeed
	thNum=$(echo $thNum-1|bc)
	sleep 5
done

for ((i=0;i<24;i++)) 
do
	echo $freq > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done

totoalPower=240
sudo /usr/local/bin/mu_power_gadget -P 100
sudo /usr/local/bin/mu_power_gadget -r 20
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
sleep 5
totoalPower=240
sudo /usr/local/bin/mu_power_gadget -r 20
sudo /usr/local/bin/mu_power_gadget -p 100
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=220
sudo /usr/local/bin/mu_power_gadget -r 20
sudo /usr/local/bin/mu_power_gadget -p 90
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
sleep 5
totoalPower=220
sudo /usr/local/bin/mu_power_gadget -r 20
sudo /usr/local/bin/mu_power_gadget -p 90
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=200
sudo /usr/local/bin/mu_power_gadget -r 15
sudo /usr/local/bin/mu_power_gadget -p 85
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
sleep 5
totoalPower=200
sudo /usr/local/bin/mu_power_gadget -r 20
sudo /usr/local/bin/mu_power_gadget -p 80
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=180
sudo /usr/local/bin/mu_power_gadget -0 15
sudo /usr/local/bin/mu_power_gadget -1 15
sudo /usr/local/bin/mu_power_gadget -2 115
sudo /usr/local/bin/mu_power_gadget -3 35
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
sleep 5
totoalPower=180
sudo /usr/local/bin/mu_power_gadget -r 15
sudo /usr/local/bin/mu_power_gadget -p 75
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=160
sudo /usr/local/bin/mu_power_gadget -0 15
sudo /usr/local/bin/mu_power_gadget -1 15
sudo /usr/local/bin/mu_power_gadget -2 95
sudo /usr/local/bin/mu_power_gadget -3 35
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
sleep 5
totoalPower=160
sudo /usr/local/bin/mu_power_gadget -r 15
sudo /usr/local/bin/mu_power_gadget -p 60
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=140
sudo /usr/local/bin/mu_power_gadget -0 15
sudo /usr/local/bin/mu_power_gadget -1 15
sudo /usr/local/bin/mu_power_gadget -2 75
sudo /usr/local/bin/mu_power_gadget -3 35
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
sleep 5
totoalPower=140
sudo /usr/local/bin/mu_power_gadget -r 15
sudo /usr/local/bin/mu_power_gadget -p 55
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=120
sudo /usr/local/bin/mu_power_gadget -0 15
sudo /usr/local/bin/mu_power_gadget -1 15
sudo /usr/local/bin/mu_power_gadget -2 55
sudo /usr/local/bin/mu_power_gadget -3 35
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
sleep 5
totoalPower=120
sudo /usr/local/bin/mu_power_gadget -r 15
sudo /usr/local/bin/mu_power_gadget -p 45
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=100
sudo /usr/local/bin/mu_power_gadget -0 12
sudo /usr/local/bin/mu_power_gadget -1 8
sudo /usr/local/bin/mu_power_gadget -2 50
sudo /usr/local/bin/mu_power_gadget -3 30
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
sleep 5
totoalPower=100
sudo /usr/local/bin/mu_power_gadget -r 15
sudo /usr/local/bin/mu_power_gadget -p 35
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=80
sudo /usr/local/bin/mu_power_gadget -0 8
sudo /usr/local/bin/mu_power_gadget -1 5
sudo /usr/local/bin/mu_power_gadget -2 38
sudo /usr/local/bin/mu_power_gadget -3 29
sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-11" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
sleep 5
totoalPower=80
sudo /usr/local/bin/mu_power_gadget -r 15
sudo /usr/local/bin/mu_power_gadget -p 25
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=60
sudo /usr/local/bin/mu_power_gadget -0 6.5
sudo /usr/local/bin/mu_power_gadget -1 5
sudo /usr/local/bin/mu_power_gadget -2 24.5
sudo /usr/local/bin/mu_power_gadget -3 24
sudo OMP_NUM_THREADS=2 GOMP_CPU_AFFINITY="0-1" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}.data.txt
sleep 5
totoalPower=60
sudo /usr/local/bin/mu_power_gadget -r 15
sudo /usr/local/bin/mu_power_gadget -p 15
sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/matrix_transpose/matrix_transpose.o 50000 50000 > /home/pzou/projects/haswell/n02/mtrans/mtrans_${totoalPower}_icpp.data.txt
sleep 5

