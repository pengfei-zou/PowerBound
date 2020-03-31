#!/bin/sh


export OMP_NUM_THREADS=12
export GOMP_CPU_AFFINITY="0-5,12-17"

cd /home/pzou/software/software-benchmark/stream-mpi/
{ time srun -n 4 -N 4 -w n05,n06,n07,n08 ./stream-mpi >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours/$2/stream-mpi.data.txt ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours/$2/stream-mpi.time.txt
