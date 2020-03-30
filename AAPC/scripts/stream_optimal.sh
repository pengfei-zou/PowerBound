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
# rampower=26
step=2
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 16") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# sudo OMP_NUM_THREADS=22 GOMP_CPU_AFFINITY="0-10,12-22" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_22.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=20 GOMP_CPU_AFFINITY="0-9,12-21" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_20.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=18 GOMP_CPU_AFFINITY="0-8,12-20" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_18.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_24.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done


# totoalPower=220
# rampower=26
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 16") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# sudo OMP_NUM_THREADS=22 GOMP_CPU_AFFINITY="0-10,12-22" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_22.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=20 GOMP_CPU_AFFINITY="0-9,12-21" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_20.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=18 GOMP_CPU_AFFINITY="0-8,12-20" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_18.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=24 GOMP_CPU_AFFINITY="0-11,12-23" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_24.data.txt
	# sleep 5
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=200
# rampower=26
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 14") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# sudo OMP_NUM_THREADS=22 GOMP_CPU_AFFINITY="0-10,12-22" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_22.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=20 GOMP_CPU_AFFINITY="0-9,12-21" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_20.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=18 GOMP_CPU_AFFINITY="0-8,12-20" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_18.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=16 GOMP_CPU_AFFINITY="0-7,12-19" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_16.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=180
# rampower=24
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 14") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# sudo OMP_NUM_THREADS=20 GOMP_CPU_AFFINITY="0-9,12-21" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_20.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=18 GOMP_CPU_AFFINITY="0-8,12-20" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_18.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=16 GOMP_CPU_AFFINITY="0-7,12-19" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_16.data.txt
	# sleep 5
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=160
# rampower=22
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 14") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# sudo OMP_NUM_THREADS=18 GOMP_CPU_AFFINITY="0-8,12-20" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_18.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=16 GOMP_CPU_AFFINITY="0-7,12-19" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_16.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=14 GOMP_CPU_AFFINITY="0-6,12-18" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_14.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=12 GOMP_CPU_AFFINITY="0-5,12-17" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_12.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=10 GOMP_CPU_AFFINITY="0-4,12-16" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_10.data.txt
	# sleep 5

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=140
# rampower=20
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# sudo OMP_NUM_THREADS=9 GOMP_CPU_AFFINITY="0-4,12-15" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_9.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=8 GOMP_CPU_AFFINITY="0-3,12-15" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_8.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=7 GOMP_CPU_AFFINITY="0-3,12-14" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_7.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=6 GOMP_CPU_AFFINITY="0-2,12-14" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_6.data.txt
	# sleep 5
	# sudo OMP_NUM_THREADS=5 GOMP_CPU_AFFINITY="0-2,12-13" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_5.data.txt
	# sleep 5
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

totoalPower=120
rampower=18
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=6
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=5
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=2
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=4
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=3
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=100
rampower=16
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 8") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=6
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=5
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=4
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=3
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=2
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=80
rampower=16
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower

	thNum=6
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=5
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=4
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=3
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=2
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=70
rampower=16
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower

	thNum=1
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=5
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=4
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=3
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=2
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)/2))"
	socket2="12-$((12+thNum/2-1))"
	export GOMP_CPU_AFFINITY="$socket1,$socket2"
	sudo OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1,$socket2" /home/pzou/software/STREAM/stream_c > /home/pzou/projects/haswell/n02/stream/stream_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done
