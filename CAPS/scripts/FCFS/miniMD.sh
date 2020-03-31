#!/bin/sh



export OMP_NUM_THREADS=24


cd /home/pzou/software/software-benchmark/Mantevo/miniMD/ref
{ time srun -n 4 -N 4  -w n01,n02,n03,n04  ./miniMD_intel -s 90 -t $OMP_NUM_THREADS >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/Mantevo.miniMD.data.txt ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/Mantevo.miniMD.time.txt &
wait
