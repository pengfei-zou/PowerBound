#!/bin/sh



export OMP_NUM_THREADS=12


cd /home/pzou/software/software-benchmark/NPB/NPB3.3.1-MZ/NPB3.3-MZ-MPI

{ time srun -n 8 -N 4 -w n05,n06,n07,n08  ./bin/sp-mz.D.8 >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/NPB_MZ.sp.D.data.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/NPB_MZ.sp.D.time.txt &
wait
