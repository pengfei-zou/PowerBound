#!/bin/sh
##################################
## Created by Yang on 4/29/2016 ##
##################################

socket1=""
socket2=""



/usr/local/bin/mu_power_gadget -r 100
/usr/local/bin/mu_power_gadget -p 180

for ((i=0;i<24;i++)) 
do
	echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done


totoalPower=240
rampower=18
step=2
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=24
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=23
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=22
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done


totoalPower=220
rampower=16
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=24
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=23
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=22
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=200
rampower=16
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 8") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=24
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=23
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=22
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5

	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=180
rampower=14
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=24
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=23
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=22
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=160
rampower=14
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 4") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=24
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=23
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=22
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5

	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=140
rampower=14
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 4") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=24
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=23
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=22
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=120
rampower=12
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 4") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=22
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=21
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=20
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=19
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=18
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5

	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=100
rampower=10
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 4") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=17
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=21
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=20
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=19
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=18
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=80
rampower=10
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 4") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower

	thNum=10
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=9
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=8
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=7
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=6
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=70
rampower=10
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 4") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=8
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=7
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=6
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=5
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=4
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=3
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/bt.C.x > /home/pzou/projects/haswell/n02/BT/BT_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done
