#!/bin/sh


export OMP_NUM_THREADS=24

cd /home/pzou/software/software-benchmark/Mantevo/miniAero/kokkos
{ time srun -n 4 -N 4 -w n05,n06,n07,n08  ./miniAero.mpi -t $OMP_NUM_THREADS -s 20 >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/Mantevo.miniAero.data.txt  ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/Mantevo.miniAero.time.txt &

wait
