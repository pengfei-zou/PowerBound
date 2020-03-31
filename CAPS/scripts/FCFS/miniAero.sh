#!/bin/sh


export OMP_NUM_THREADS=24

cd /home/pzou/software/software-benchmark/Mantevo/miniAero/kokkos
{ time srun -n 4 -N 4 -w n01,n02,n03,n04  ./miniAero.mpi -t $OMP_NUM_THREADS -s 20 >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/Mantevo.miniAero.data.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/Mantevo.miniAero.time.txt &

wait
