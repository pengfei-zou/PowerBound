#!/bin/sh

export OMP_NUM_THREADS=12
export GOMP_CPU_AFFINITY="0-5,12-17"




cd /home/pzou/software/software-benchmark/Mantevo/CloverLeaf_ref/

{ time srun -n 4 -N 4  -w n01,n02,n03,n04 ./clover_leaf ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours2/$2/Mantevo.CloverLeaf.time.txt


cp clover.out /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours2/$2/Mantevo.CloverLeaf.data.txt


