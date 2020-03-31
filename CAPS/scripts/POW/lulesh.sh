#!/bin/sh

export OMP_NUM_THREADS=12



cd /home/pzou/software/software-benchmark/CORAL/LULESH
{ time srun -n 8  -N 4 -w n05,n06,n07,n08 ./lulesh2.0 -s 70 -i 1100 >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/Coral.lulesh.data.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/Coral.lulesh.time.txt &
wait

