#!/bin/sh

export OMP_NUM_THREADS=12




cd /home/pzou/software/software-benchmark/Mantevo/CloverLeaf_ref/

export GOMP_CPU_AFFINITY="6-11,18-23"
{ time srun -n 4 -N 4  -w n08,n07,n06,n05 ./clover_leaf ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Mantevo.CloverLeaf.time1.txt &

export GOMP_CPU_AFFINITY="0-5,12-17"
{ time srun -n 4 -N 4  -w n05,n06,n07,n08 ./clover_leaf ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Mantevo.CloverLeaf.time2.txt &

wait
cp clover.out /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Mantevo.CloverLeaf.data.txt


