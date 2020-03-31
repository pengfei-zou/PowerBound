#!/bin/sh




cd /home/pzou/software/software-benchmark/NPB/NPB3.3.1/NPB3.3-MPI
{ time srun -n 96  -N 4 -w n05,n06,n07,n08  ./bin/ep.D.96  >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/NPB_MPI.ep.D.data.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/NPB_MPI.ep.D.time.txt &
wait


