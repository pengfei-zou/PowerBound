#!/bin/sh



export OMP_NUM_THREADS=12


cd /home/pzou/software/software-benchmark/NPB/NPB3.3.1-MZ/NPB3.3-MZ-MPI

{ time srun -n 8 -N 4 -w n01,n02,n03,n04  ./bin/sp-mz.D.8 >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/NPB_MZ.sp.D.data.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/NPB_MZ.sp.D.time.txt &
wait
