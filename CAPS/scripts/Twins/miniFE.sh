#!/bin/sh



export OMP_NUM_THREADS=12
export GOMP_CPU_AFFINITY="6-11,18-23"


cd /home/pzou/software/software-benchmark/Mantevo/miniFE/openmp-opt/src
rm miniFE.*.yaml
{ time srun -n 4 -N 4 -w n05,n06,n07,n08 ./miniFE.x -nx 512 -ny 512 -nz 512 ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Mantevo.miniFE.time1.txt &

export GOMP_CPU_AFFINITY="0-5,12-17"
{ time srun -n 4 -N 4 -w n05,n06,n07,n08 ./miniFE.x -nx 512 -ny 512 -nz 512 ; } 2>  /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Mantevo.miniFE.time2.txt &

wait
mv miniFE.*.yaml /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/$1/Twins/$2/Mantevo.miniFE.data.txt


