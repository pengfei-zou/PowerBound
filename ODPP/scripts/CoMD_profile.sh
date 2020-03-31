#!/bin/sh
#SBATCH --job-name=VGPU
#SBATCH --time=48:00:00
#SBATCH -w, --nodelist=n01


# set environment varialbe BENCHTYPE // mybench or risky
module load cuda/10.0

export CUDA_VISIBLE_DEVICES=0


cd /home/pzou/software/software-benchmark/GPU/CoMD-CUDA/



#define scratch_folder for save results
results_dir=/home/pzou/projects/power_trace/AI/results

bench=CoMD
data=ECP

sudo nvidia-smi -i 0 -pm 1  #enable GPU frequency change
sudo nvidia-smi -pl 250     #set the power as the maximize GPU power



   
./bin/CoMD-cuda -e -x 100 -y 100 -z 80 -I -N 8000 > ${results_dir}/${data}/${bench}.out10.txt  &
sleep 20

for i in 1 2
do
	for freq in 1911 1506 1101 696 291 
	do
		sudo nvidia-smi -ac 5705,$freq  #change frequency

		#measure power
		sleeptime=$((i*20))			
		nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${freq}.${sleeptime}.res10.txt &		
		pid=$!
		echo Test $i
		sleep ${sleeptime}
		pkill nvidia-smi      #kill the power measurement process
		kill $pid
		
		sleep 5
		
		sleeptime=$((i*20))			
		nvidia-smi -i 0 --loop-ms=5 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${freq}.${sleeptime}.res5.txt &		
		pid=$!
		echo Test $i
		sleep ${sleeptime}
		pkill nvidia-smi      #kill the power measurement process
		kill $pid
		
		sleep 5
	done
	
done
	

	
	
