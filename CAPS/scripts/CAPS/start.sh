#!/bin/sh

A0_list=("CloverLeaf.sh" "TeaLeaf.sh" "NULL.sh")
A1_list=("ep.D.sh" "bt.D.sh" "CoMD.sh" "lulesh.sh" "NULL.sh")

B0_list=("CloverLeaf3D.sh" "TeaLeaf3D.sh" "stream.sh" "NULL.sh")
B1_list=("AMG.sh" "sp.D.sh" "miniAero.sh" "miniMD.sh" "miniFE.sh" "NULL.sh")

power=400
times=3


if [ ! -d /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$power/ours2/$times ]; then
    mkdir /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$power/ours2/$times
fi


module load mpi/intel-mpi
export I_MPI_PMI_LIBRARY=/usr/local/lib/libpmi.so

./init.py $power $times
sleep 2


for app in ${A0_list[*]}
do
	./adjust_power.py $app A 0 $power
	sh ./$app $power $times
 #   echo $app
 #   sleep 10
done &
sleep 2
for app in ${A1_list[*]}
do 
	./adjust_power.py $app A 1 $power
	sh ./$app $power $times

  #  echo $app
	#sleep 10
done &

sleep 2
for app in ${B0_list[*]}
do
	./adjust_power.py $app B 0 $power
	sh ./$app $power $times

  #  echo $app
#	sleep 10
done &
sleep 2
for app in ${B1_list[*]}
do 
	./adjust_power.py $app B 1 $power
	sh ./$app $power $times

 #   echo $app
#	sleep 10
done &

wait

./end.py $power
cp ./job_running_p${power}.log /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$power/ours2/$times/

