#!/bin/sh



export OMP_NUM_THREADS=24


cd /home/pzou/software/software-benchmark/Mantevo/miniFE/openmp-opt/src
rm miniFE.*.yaml
{ time srun -n 4 -N 4 -w n01,n02,n03,n04 ./miniFE.x -nx 512 -ny 512 -nz 512 ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Cord/$2/Mantevo.miniFE.time.txt &


wait
mv miniFE.*.yaml /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Cord/$2/Mantevo.miniFE.data.txt


