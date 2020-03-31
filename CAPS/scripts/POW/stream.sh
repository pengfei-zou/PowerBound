#!/bin/sh


export OMP_NUM_THREADS=24

cd /home/pzou/software/software-benchmark/stream-mpi/
{ time srun -n 4 -N 4 -w n01,n02,n03,n04 ./stream-mpi >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/stream-mpi.data.txt ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/stream-mpi.time.txt &

wait
