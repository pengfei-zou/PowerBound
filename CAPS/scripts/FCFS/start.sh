#!/bin/sh

A_list=("CloverLeaf.sh" "TeaLeaf.sh" "CloverLeaf3D.sh" "TeaLeaf3D.sh" "stream.sh" "NULL.sh" "bt.D.sh" "CoMD.sh" "lulesh.sh" "ep.D.sh" "AMG.sh" "sp.D.sh" "miniAero.sh" "miniMD.sh" "miniFE.sh" "NULL.sh")


power=400
times=1
for power in 400
do
    for times in 1 
    do 

if [ ! -d /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$power/FCFS/$times ]; then
    mkdir /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$power/FCFS/$times
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
    sleep 2
done 

./end.py $power
cp ./job_running_p${power}.log /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$power/FCFS/$times/

sleep 10

done


sleep 20 
done
