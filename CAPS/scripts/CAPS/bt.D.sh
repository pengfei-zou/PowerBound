#!/bin/sh


cd /home/pzou/software/software-benchmark/NPB/NPB3.3.1-MZ/NPB3.3-MZ-MPI
export OMP_NUM_THREADS=6


{ time srun -n 8 -N 4 -w n01,n02,n03,n04  taskset -c 6-11,18-23 ./bin/bt-mz.D.8 >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours2/$2/NPB_MZ.bt.D.data.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours2/$2/NPB_MZ.bt.D.time.txt


