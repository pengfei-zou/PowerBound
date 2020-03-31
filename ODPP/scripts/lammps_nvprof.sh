#!/bin/sh
#SBATCH --job-name=VGPU
#SBATCH --time=48:00:00
#SBATCH -w, --nodelist=n01


# set environment varialbe BENCHTYPE // mybench or risky
module load cuda/10.0

export CUDA_VISIBLE_DEVICES=0


cd /home/pzou/software/software-benchmark/GPU/lammps/build



#define scratch_folder for save results
results_dir=/home/pzou/projects/power_trace/AI/results

bench=lammps
data=ECP

sudo nvidia-smi -i 0 -pm 1
sudo nvidia-smi -pl 250
sudo nvidia-smi -ac 5705,1708

nvprof --csv --log-file ${results_dir}/${data}/${bench}.nvprof.log.txt --print-gpu-trace ./lmp -sf gpu -in in.lj > ${results_dir}/${data}/${bench}.nvprof.out10.txt 


        
      
          
