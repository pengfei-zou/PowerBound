#!/bin/sh



export OMP_NUM_THREADS=24

cd /home/pzou/software/software-benchmark/CORAL/AMG-master/test

{ time srun -n 4  -N 4 -w n01,n02,n03,n04  ./amg -P 2 2 1 -n 480 480 240 -laplace -solver 2>/home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/CORAL.AMG.data.txt ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/CORAL.AMG.time.txt &

    
    

wait

