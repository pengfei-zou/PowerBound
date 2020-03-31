#!/bin/sh




cd /home/pzou/software/software-benchmark/NPB/NPB3.3.1/NPB3.3-MPI
{ time srun -n 48  -N 4 -w n01,n02,n03,n04 --ntasks-per-node=12 --cpu-bind=map_cpu:6,7,8,9,10,11,18,19,20,21,22,23 ./bin/ep.D.48  >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours/$2/NPB_MPI.ep.D.data.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours/$2/NPB_MPI.ep.D.time.txt


