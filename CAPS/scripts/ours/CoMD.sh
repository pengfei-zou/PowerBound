#!/bin/sh

export OMP_NUM_THREADS=12
export GOMP_CPU_AFFINITY="6-11,18-23"

cd /home/pzou/software/software-benchmark/Mantevo/exmatex-CoMD/bin

{ time srun -n 4 -N 4 -w n01,n02,n03,n04 ./CoMD-openmp-mpi -i2 -j2 -k1 -x 200 -y 200 -z 200 -N 100 -n 5 > /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours/$2/Mantevo.CoMD.data.txt ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours/$2/Mantevo.CoMD.time.txt


