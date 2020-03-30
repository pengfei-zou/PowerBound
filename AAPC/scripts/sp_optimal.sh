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
	sudo echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed
done


# totoalPower=240
# rampower=26
# step=2
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 16") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=22
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=20
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=18
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=16
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done


# totoalPower=220
# rampower=24
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 14") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=22
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=20
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=18
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=16
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=200
# rampower=24
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 14") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=14
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=20
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=18
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=16
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=180
# rampower=22
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 12") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=14
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=20
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=18
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=16
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=160
# rampower=22
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=14
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=20
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=18
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=16
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=140
# rampower=22
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 8") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=14
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=10
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=16
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

totoalPower=120
rampower=30
pkgpower=$(echo $totoalPower/2-$rampower|bc)
step=2
while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=12
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=16
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=20
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=24
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5

	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done
# totoalPower=100
# rampower=18
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=10
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=14
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=8
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=80
# rampower=16
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=10
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=8
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=6
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=70
# rampower=8
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 8") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=4
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=6
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=2
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	# thNum=8
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)/2))"
	# socket2="12-$((12+thNum/2-1))"
	# export GOMP_CPU_AFFINITY="$socket1,$socket2"
	# sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/software-benchmark/NPB3.3.1/NPB3.3-OMP-haswell/bin/sp.C.x > /home/pzou/projects/haswell/n02/SP/SP_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done
