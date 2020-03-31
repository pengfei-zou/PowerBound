#!/bin/sh

A_list=("CloverLeaf.sh" "TeaLeaf.sh" "CloverLeaf3D.sh" "TeaLeaf3D.sh" "stream.sh" "NULL.sh")
B_list=("bt.D.sh" "CoMD.sh" "lulesh.sh" "ep.D.sh" "AMG.sh" "sp.D.sh" "miniAero.sh" "miniMD.sh" "miniFE.sh" "NULL.sh")


power=200
times=2


if [ ! -d /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$power/Twins/$times ]; then
    mkdir /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$power/Twins/$times
fi


module load mpi/intel-mpi
export I_MPI_PMI_LIBRARY=/usr/local/lib/libpmi.so

./init.py $power $times
sleep 2


for app in ${A_list[*]}
do
	./adjust_power.py $app A $power
	sh ./$app $power $times
#    echo $app
#    sleep 10
done &
sleep 2
for app in ${B_list[*]}
do 
	./adjust_power.py $app B $power
	sh ./$app $power $times

#    echo $app
#	sleep 10
done &
wait

./end.py $power
cp ./job_running_p${power}.log /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$power/Twins/$times/

