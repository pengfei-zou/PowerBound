#!/bin/sh



export OMP_NUM_THREADS=24


cd /home/pzou/software/software-benchmark/Mantevo/miniMD/ref
{ time srun -n 4 -N 4  -w n05,n06,n07,n08  ./miniMD_intel -s 90 -t $OMP_NUM_THREADS >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/Mantevo.miniMD.data.txt ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/POW/$2/Mantevo.miniMD.time.txt &
wait
