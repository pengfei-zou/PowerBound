#!/bin/sh


export OMP_NUM_THREADS=12
export GOMP_CPU_AFFINITY="0-5,12-17"

cd /home/pzou/software/software-benchmark/stream-mpi/
{ time srun -n 4 -N 4 -w n01,n02,n03,n04 ./stream-mpi >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/stream-mpi.data1.txt ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/stream-mpi.time1.txt &

export GOMP_CPU_AFFINITY="6-11,18-23"
{ time srun -n 4 -N 4 -w n01,n02,n03,n04 ./stream-mpi >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/stream-mpi.data2.txt ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/stream-mpi.time2.txt &
wait
