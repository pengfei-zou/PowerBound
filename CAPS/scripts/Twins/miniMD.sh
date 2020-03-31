#!/bin/sh



export OMP_NUM_THREADS=12
export GOMP_CPU_AFFINITY="6-11,18-23"


cd /home/pzou/software/software-benchmark/Mantevo/miniMD/ref
{ time srun -n 4 -N 4  -w n05,n06,n07,n08  ./miniMD_intel -s 90 -t $OMP_NUM_THREADS >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Mantevo.miniMD.data1.txt ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Mantevo.miniMD.time1.txt &
export GOMP_CPU_AFFINITY="0-5,12-17"
{ time srun -n 4 -N 4  -w n05,n06,n07,n08  ./miniMD_intel -s 90 -t $OMP_NUM_THREADS >/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Mantevo.miniMD.data2.txt ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Mantevo.miniMD.time2.txt &
wait
