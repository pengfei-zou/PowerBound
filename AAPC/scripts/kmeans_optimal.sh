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
# rampower=20
step=2
# pkgpower=$(echo $totoalPower-$rampower-45|bc)
# while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -0 $rampower
	# sudo /usr/local/bin/mu_power_gadget -1 10
	# sudo /usr/local/bin/mu_power_gadget -2 $pkgpower
	# sudo /usr/local/bin/mu_power_gadget -3 35
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)))"
	# export GOMP_CPU_AFFINITY="$socket1"
	# OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower-$rampower-45|bc)
# done


# totoalPower=220
# rampower=18
# pkgpower=$(echo $totoalPower-$rampower-45|bc)
# while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -0 $rampower
	# sudo /usr/local/bin/mu_power_gadget -1 10
	# sudo /usr/local/bin/mu_power_gadget -2 $pkgpower
	# sudo /usr/local/bin/mu_power_gadget -3 35
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)))"
	# export GOMP_CPU_AFFINITY="$socket1"
	# OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower-$rampower-45|bc)
# done


# totoalPower=200
# rampower=18
# pkgpower=$(echo $totoalPower-$rampower-45|bc)
# while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -0 $rampower
	# sudo /usr/local/bin/mu_power_gadget -1 10
	# sudo /usr/local/bin/mu_power_gadget -2 $pkgpower
	# sudo /usr/local/bin/mu_power_gadget -3 35
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)))"
	# export GOMP_CPU_AFFINITY="$socket1"
	# OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower-$rampower-45|bc)
# done


# totoalPower=180
# rampower=18
# pkgpower=$(echo $totoalPower-$rampower-45|bc)
# while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -0 $rampower
	# sudo /usr/local/bin/mu_power_gadget -1 10
	# sudo /usr/local/bin/mu_power_gadget -2 $pkgpower
	# sudo /usr/local/bin/mu_power_gadget -3 35
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)))"
	# export GOMP_CPU_AFFINITY="$socket1"
	# OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower-$rampower-45|bc)
# done


# totoalPower=160
# rampower=18
# pkgpower=$(echo $totoalPower-$rampower-45|bc)
# while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -0 $rampower
	# sudo /usr/local/bin/mu_power_gadget -1 10
	# sudo /usr/local/bin/mu_power_gadget -2 $pkgpower
	# sudo /usr/local/bin/mu_power_gadget -3 35
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)))"
	# export GOMP_CPU_AFFINITY="$socket1"
	# OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower-$rampower-45|bc)
# done


# totoalPower=140
# rampower=16
# pkgpower=$(echo $totoalPower-$rampower-45|bc)
# while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -0 $rampower
	# sudo /usr/local/bin/mu_power_gadget -1 10
	# sudo /usr/local/bin/mu_power_gadget -2 $pkgpower
	# sudo /usr/local/bin/mu_power_gadget -3 35
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)))"
	# export GOMP_CPU_AFFINITY="$socket1"
	# OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower-$rampower-45|bc)
# done


# totoalPower=120
# rampower=16
# pkgpower=$(echo $totoalPower-$rampower-45|bc)
# while [ $(bc <<< "$rampower >= 10") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -0 $rampower
	# sudo /usr/local/bin/mu_power_gadget -1 10
	# sudo /usr/local/bin/mu_power_gadget -2 $pkgpower
	# sudo /usr/local/bin/mu_power_gadget -3 35
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)))"
	# export GOMP_CPU_AFFINITY="$socket1"
	# OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower-$rampower-45|bc)
# done

# totoalPower=100
# rampower=18
# pkgpower=$(echo $totoalPower-$rampower-38|bc)
# while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -0 $rampower
	# sudo /usr/local/bin/mu_power_gadget -1 8
	# sudo /usr/local/bin/mu_power_gadget -2 $pkgpower
	# sudo /usr/local/bin/mu_power_gadget -3 30
	# thNum=12
	# export OMP_NUM_THREADS=$thNum
	# socket1="0-$(((thNum-1)))"
	# export GOMP_CPU_AFFINITY="$socket1"
	# OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# sleep 5
	
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower-$rampower-38|bc)
# done


totoalPower=80
rampower=12
pkgpower=$(echo $totoalPower-$rampower-36|bc)
while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -0 $rampower
	sudo /usr/local/bin/mu_power_gadget -1 6
	sudo /usr/local/bin/mu_power_gadget -2 $pkgpower
	sudo /usr/local/bin/mu_power_gadget -3 30
	thNum=12
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)))"
	export GOMP_CPU_AFFINITY="$socket1"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	
	thNum=11
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)))"
	export GOMP_CPU_AFFINITY="$socket1"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=10
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)))"
	export GOMP_CPU_AFFINITY="$socket1"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=9
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)))"
	export GOMP_CPU_AFFINITY="$socket1"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower-$rampower-36|bc)
done


totoalPower=70
rampower=12
pkgpower=$(echo $totoalPower-$rampower-36|bc)
while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -0 $rampower
	sudo /usr/local/bin/mu_power_gadget -1 6
	sudo /usr/local/bin/mu_power_gadget -2 $pkgpower
	sudo /usr/local/bin/mu_power_gadget -3 30
	thNum=9
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)))"
	export GOMP_CPU_AFFINITY="$socket1"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	
	thNum=8
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)))"
	export GOMP_CPU_AFFINITY="$socket1"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=7
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)))"
	export GOMP_CPU_AFFINITY="$socket1"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	thNum=6
	export OMP_NUM_THREADS=$thNum
	socket1="0-$(((thNum-1)))"
	export GOMP_CPU_AFFINITY="$socket1"
	OMP_NUM_THREADS=$thNum GOMP_CPU_AFFINITY="$socket1" /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/example -i /home/pzou/software/software-benchmark/NU-MineBench-3.0.1/KMeans/kmeans/819200.txt -o > /home/pzou/projects/haswell/n02/kmeans/kmeans_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	sleep 5
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower-$rampower-36|bc)
done
