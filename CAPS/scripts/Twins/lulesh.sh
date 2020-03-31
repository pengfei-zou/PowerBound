#!/bin/sh

export OMP_NUM_THREADS=6



cd /home/pzou/software/software-benchmark/CORAL/LULESH
{ time srun -n 8  -N 4 -w n05,n06,n07,n08 taskset -c 6-11,18-23 ./lulesh2.0 -s 70 -i 1100 >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Coral.lulesh.data1.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Coral.lulesh.time1.txt &
{ time srun -n 8  -N 4 -w n05,n06,n07,n08 taskset -c 0-5,12-17 ./lulesh2.0 -s 70 -i 1100 >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Coral.lulesh.data2.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Coral.lulesh.time2.txt &
wait

