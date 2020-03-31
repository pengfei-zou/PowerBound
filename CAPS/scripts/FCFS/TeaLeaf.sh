#!/bin/sh



export OMP_NUM_THREADS=24


cd /home/pzou/software/software-benchmark/Mantevo/TeaLeaf_ref/
{ time srun -n 4 -N 4  -w n01,n02,n03,n04 ./tea_leaf ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/Mantevo.TeaLeaf.time.txt &

    
wait
cp tea.out /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/FCFS/$2/Mantevo.TeaLeaf.data.txt




