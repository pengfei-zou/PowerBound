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

cd /home/pzou/software/software-benchmark/hpcc-1.5.0_haswell/hpcc_RandomAccess

if [ -f "hpccoutf.txt" ];
then 
	rm hpccoutf.txt
fi

# totoalPower=240
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 100
# /usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}.data.txt
# sleep 5
# totoalPower=220
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 90
# /usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}.data.txt
# sleep 5
# totoalPower=200
# sudo /usr/local/bin/mu_power_gadget -r 20
# sudo /usr/local/bin/mu_power_gadget -p 80
# /usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}.data.txt
# sleep 5
# totoalPower=180
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 78
# /usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 10
# sudo /usr/local/bin/mu_power_gadget -p 70
# /usr/lib64/openmpi/bin/mpiexec -np 20 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}.data.txt
# sleep 5
# totoalPower=160
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 68
# /usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 10
# sudo /usr/local/bin/mu_power_gadget -p 60
# /usr/lib64/openmpi/bin/mpiexec -np 16 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}.data.txt
# sleep 5
# totoalPower=140
# sudo /usr/local/bin/mu_power_gadget -r 11
# sudo /usr/local/bin/mu_power_gadget -p 58
# /usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 9
# sudo /usr/local/bin/mu_power_gadget -p 51
# /usr/lib64/openmpi/bin/mpiexec -np 12 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}.data.txt
# sleep 5
# totoalPower=120
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 48
# /usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_icpp.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 8
# sudo /usr/local/bin/mu_power_gadget -p 42
# /usr/lib64/openmpi/bin/mpiexec -np 12 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}.data.txt
# sleep 5
# totoalPower=100
# sudo /usr/local/bin/mu_power_gadget -r 12
# sudo /usr/local/bin/mu_power_gadget -p 38
# /usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
# mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_icpp.data.txt
# sleep 5
totoalPower=80
sudo /usr/local/bin/mu_power_gadget -r 9
sudo /usr/local/bin/mu_power_gadget -p 31
/usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_icpp.data.txt
sleep 5
totoalPower=70
sudo /usr/local/bin/mu_power_gadget -r 9
sudo /usr/local/bin/mu_power_gadget -p 26
/usr/lib64/openmpi/bin/mpiexec -np 24 --bind-to core ./hpcc
mv hpccoutf.txt /home/pzou/projects/haswell/n02/randomAccess/randomAccess_${totoalPower}_icpp.data.txt
sleep 5
		

