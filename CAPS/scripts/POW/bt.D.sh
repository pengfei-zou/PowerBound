#!/bin/sh


cd /home/pzou/software/software-benchmark/NPB/NPB3.3.1-MZ/NPB3.3-MZ-MPI
export OMP_NUM_THREADS=12


{ time srun -n 8 -N 4 -w n05,n06,n07,n08  ./bin/bt-mz.D.8 >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/NPB_MZ.bt.D.data1.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/NPB_MZ.bt.D.time1.txt &

wait
