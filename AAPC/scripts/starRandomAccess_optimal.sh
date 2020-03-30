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

cd /home/pzou/software/software-benchmark/hpcc-1.5.0_haswell/hpcc_RandomAccess

if [ -f "hpccoutf.txt" ];
then 
	rm hpccoutf.txt
fi

totoalPower=240
rampower=20
step=2
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 8") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=24
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc

	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done


# totoalPower=220
# rampower=20
# step=2
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 8") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=24
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc

	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=200
# rampower=20
# step=2
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 8") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=24
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc

	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=180
# rampower=18
# step=2
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=24
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc

	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt

	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=160
# rampower=18
# step=2
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=18
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=16
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=15
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=14
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=13
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=140
# rampower=18
# step=2
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=18
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=16
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=15
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=14
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=13
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=120
# rampower=18
# step=2
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=18
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=16
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=15
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=14
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=13
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

# totoalPower=100
# rampower=18
# step=2
# pkgpower=$(echo $totoalPower/2-$rampower|bc)
# while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	# sudo /usr/local/bin/mu_power_gadget -r $rampower
	# sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	# thNum=18
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=16
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=15
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=14
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# thNum=13
	# /usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	# rampower=$(echo $rampower-$step|bc)
    # pkgpower=$(echo $totoalPower/2-$rampower|bc)
# done

totoalPower=80
rampower=18
step=2
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=10
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	thNum=8
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	thNum=7
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	thNum=6
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	thNum=9
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

totoalPower=70
rampower=18
step=2
pkgpower=$(echo $totoalPower/2-$rampower|bc)
while [ $(bc <<< "$rampower >= 6") -eq 1  ]; do
	
	sudo /usr/local/bin/mu_power_gadget -r $rampower
	sudo /usr/local/bin/mu_power_gadget -p $pkgpower
	thNum=6
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	thNum=5
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	thNum=4
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	thNum=3
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	thNum=2
	/usr/lib64/openmpi/bin/mpiexec -np $thNum --bind-to core ./hpcc
	mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_${pkgpower}_${rampower}_${thNum}.data.txt
	rampower=$(echo $rampower-$step|bc)
    pkgpower=$(echo $totoalPower/2-$rampower|bc)
done

