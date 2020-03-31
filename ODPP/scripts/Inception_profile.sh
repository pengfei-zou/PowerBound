#!/bin/sh
#SBATCH --job-name=VGPU
#SBATCH --time=48:00:00
#SBATCH -w, --nodelist=n01


# set environment varialbe BENCHTYPE // mybench or risky
module load cuda/10.0

export CUDA_VISIBLE_DEVICES=0


cd /home/pzou/software/software-benchmark/Deep_Learning_Bench/tf_cnn/scripts/tf_cnn_benchmarks

cifar_dir=/home/pzou/software/software-benchmark/Deep_Learning_Bench/DataSets/cifar-10-batches-py
imagenet_dir=/home/pzou/software/software-benchmark/Deep_Learning_Bench/DataSets/imagenet-data/tf_records

#define scratch_folder for save results
results_dir=/home/pzou/projects/power_trace/AI/results

bench=inception3

data=imagenet

sudo nvidia-smi -i 0 -pm 1  #enable GPU frequency change
sudo nvidia-smi -pl 250     #set the power as the maximize GPU power
bsize=64


   
python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=10000 > ${results_dir}/${data}/${bench}.${bsize}.txt &
sleep 120

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
		
		sleep 20
		
		sleeptime=$((i*20))			
		nvidia-smi -i 0 --loop-ms=5 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${freq}.${sleeptime}.res5.txt &		
		pid=$!
		echo Test $i
		sleep ${sleeptime}
		pkill nvidia-smi      #kill the power measurement process
		kill $pid
		
		sleep 20
	done
	
done
	

	
	
