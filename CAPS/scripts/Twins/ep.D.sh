#!/bin/sh




cd /home/pzou/software/software-benchmark/NPB/NPB3.3.1/NPB3.3-MPI
{ time srun -n 48  -N 4 -w n05,n06,n07,n08 --ntasks-per-node=12 --cpu-bind=map_cpu:6,7,8,9,10,11,18,19,20,21,22,23 ./bin/ep.D.48  >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/NPB_MPI.ep.D.data1.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/NPB_MPI.ep.D.time1.txt &
{ time srun -n 48  -N 4 -w n05,n06,n07,n08 --ntasks-per-node=12 --cpu-bind=map_cpu:0,1,2,3,4,5,12,13,14,15,16,17 ./bin/ep.D.48  >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/NPB_MPI.ep.D.data2.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/NPB_MPI.ep.D.time2.txt &
wait


