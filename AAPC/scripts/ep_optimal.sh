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

step=2
totoalPower=240
rampower=20
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_24.data.txt
	sleep 5

	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done


totoalPower=220
rampower=20
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_24.data.txt
	sleep 5

	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=200
rampower=20
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_24.data.txt
	sleep 5

	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=180
rampower=16
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_24.data.txt
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
	sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_24.data.txt
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
	sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_24.data.txt
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
	sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_24.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=23 GOMP_CPU_AFFINITY="0-11,12-22" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_23.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=22 GOMP_CPU_AFFINITY="0-10,12-22" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_22.data.txt
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
	sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_24.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=23 GOMP_CPU_AFFINITY="0-11,12-22" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_23.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=22 GOMP_CPU_AFFINITY="0-10,12-22" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_22.data.txt
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

	sudo OMP_NUM_THREADS=22 GOMP_CPU_AFFINITY="0-10,12-22" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_22.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=21 GOMP_CPU_AFFINITY="0-10,12-21" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_21.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=20 GOMP_CPU_AFFINITY="0-9,12-21" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_20.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=19 GOMP_CPU_AFFINITY="0-9,12-20" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_19.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=18 GOMP_CPU_AFFINITY="0-8,12-20" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_18.data.txt
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
	sudo OMP_NUM_THREADS=14 GOMP_CPU_AFFINITY="0-6,12-18" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_14.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-5,12-17" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_12.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=10 GOMP_CPU_AFFINITY="0-4,12-16" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_10.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=8 GOMP_CPU_AFFINITY="0-3,12-15" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_8.data.txt
	sleep 5
	sudo OMP_NUM_THREADS=6 GOMP_CPU_AFFINITY="0-2,12-14" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/ep.C.x > /home/pzou/projects/haswell/n02/EP/EP_${totoalPower}_${pkgpower}_${rampower}_6.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done
