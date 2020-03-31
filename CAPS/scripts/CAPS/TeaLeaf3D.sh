#!/bin/sh


export OMP_NUM_THREADS=12
export GOMP_CPU_AFFINITY="0-5,12-17"

cd /home/pzou/software/software-benchmark/Mantevo/TeaLeaf3D_ref/
{ time srun -n 4 -N 4 -w n05,n06,n07,n08  ./tea_leaf ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours2/$2/Mantevo.TeaLeaf3D.time.txt

cp tea.out /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/ours2/$2/Mantevo.TeaLeaf3D.data.txt 




