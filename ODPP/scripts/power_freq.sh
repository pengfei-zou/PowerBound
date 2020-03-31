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

bench=alexnet

data=cifar10

sudo nvidia-smi -i 0 -pm 1
sudo nvidia-smi -pl 250


for freq in 1911 1708 1506 1303 1101 898 696 493 291 139
do
    sudo nvidia-smi -ac 5705,$freq
    for bench in alexnet resnet20 resnet20_v2 resnet32 resnet32_v2 resnet44 resnet44_v2 resnet56 resnet56_v2 resnet110 resnet110_v2 trivial nasnet #densenet40_k12 densenet100_k12 densenet100_k24
    do    
        for bsize in 32 64 128 256
        do
            nvidia-smi -i 0 --loop-ms=100 --format=csv --query-gpu=power.draw > ${results_dir}/${data}/${bench}.${bsize}.${freq}.pwr.txt &
            power_sid=$!

            python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${cifar_dir} --data_name=cifar10 --num_epochs=5 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.out.txt

            kill ${power_sid}
            pkill nvidia-smi
            sleep 5
        done
        sleep 2
    done
    
done