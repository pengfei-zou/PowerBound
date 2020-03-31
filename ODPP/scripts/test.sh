#!/bin/sh
#SBATCH --job-name=VGPU
#SBATCH --time=48:00:00
#SBATCH -w, --nodelist=n01


# set environment varialbe BENCHTYPE // mybench or risky
module load cuda/10.0

export CUDA_VISIBLE_DEVICES=0


cd /home/pzou/software/software-benchmark/Deep_Learning_Bench/tf_cnn/scripts/tf_cnn_benchmarks

imagenet_dir=/home/pzou/software/software-benchmark/Deep_Learning_Bench/DataSets/imagenet-data/tf_records
data=imagenet
bench=inception3
python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=64 --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=100 &
bench_sid=$!
sleep 1000


kill ${bench_sid}

