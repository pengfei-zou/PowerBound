#!/bin/sh

export OMP_NUM_THREADS=12



cd /home/pzou/software/software-benchmark/CORAL/LULESH
{ time srun -n 8  -N 4 -w n01,n02,n03,n04 ./lulesh2.0 -s 70 -i 1100 >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/Coral.lulesh.data.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/Coral.lulesh.time.txt &
wait

