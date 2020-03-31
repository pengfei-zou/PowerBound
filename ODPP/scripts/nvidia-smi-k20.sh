#!/bin/sh
#SBATCH --job-name=VGPU
#SBATCH --time=48:00:00
#SBATCH -w, --nodelist=ivy


# set environment varialbe BENCHTYPE // mybench or risky
module load cuda/10.0

export CUDA_VISIBLE_DEVICES=0


cd /home/pzou/software/software-benchmark/Deep_Learning_Bench/models-1.11/official
cd /home/pzou/software/software-benchmark/Deep_Learning_Bench/tf_cnn/scripts/tf_cnn_benchmarks


data=imagenet
imagenet_dir=/home/pzou/software/software-benchmark/Deep_Learning_Bench/DataSets/imagenet-data/tf_records
results_dir=/home/pzou/projects/power_trace/AI/results

sudo nvidia-smi -i 0 -pm 1
sudo nvidia-smi -pl 225
#sudo nvidia-smi -ac 5705,1911
bsize=128

# for freq in 1911 1708 1506 1303 1101 898
# do
    # sudo nvidia-smi -ac 5705,$freq
    
    # nvidia-smi -i 0 --loop-ms=16 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/raw.${freq}.test16.res.txt &
    # power_sid=$!
    # sleep 100

    # kill ${power_sid}

    # pkill nvidia-smi
    # sleep 5
# done

arch=k20

for bench in idle
do
   
    sleep 30


    for rate in 100 50 20 10 5 2
    do
        for memfreq in 2600
        do
            for freq in 758 705 666 640 614

            do
                sudo nvidia-smi -ac ${memfreq},$freq
                sleep 10
                
                nvidia-smi -i 0 --loop-ms=${rate} --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${freq}.${memfreq}.test${rate}.${arch}.txt &
                power_sid=$!
                sleep 20

                kill ${power_sid}

                pkill nvidia-smi
                sleep 5
            done    
        done
        
        for memfreq in 324
        do
            for freq in 324
            do
                sudo nvidia-smi -ac ${memfreq},$freq
                sleep 10
                
                nvidia-smi -i 0 --loop-ms=${rate} --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${freq}.${memfreq}.test${rate}.${arch}.txt &
                power_sid=$!
                sleep 20

                kill ${power_sid}

                pkill nvidia-smi
                sleep 5
            done    
        done
        
    done
    sleep 30
done



for bench in inception4 vgg19
do
    python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=16 --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=300000 &
    bench_sid=$!
    sleep 300


    for rate in 100 50 20 10 5 2
    do
        for memfreq in 2600
        do
            for freq in 758 705 666 640 614

            do
                sudo nvidia-smi -ac ${memfreq},$freq
                sleep 10
                
                nvidia-smi -i 0 --loop-ms=${rate} --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${freq}.${memfreq}.test${rate}.${arch}.txt &
                power_sid=$!
                sleep 20

                kill ${power_sid}

                pkill nvidia-smi
                sleep 5
            done    
        done
        
        for memfreq in 324
        do
            for freq in 324
            do
                sudo nvidia-smi -ac ${memfreq},$freq
                sleep 10
                
                nvidia-smi -i 0 --loop-ms=${rate} --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${freq}.${memfreq}.test${rate}.${arch}.txt &
                power_sid=$!
                sleep 20

                kill ${power_sid}

                pkill nvidia-smi
                sleep 5
            done    
        done
        
    done


    kill ${bench_sid}
    pkill -f tf_cnn_benchmarks.py
    sleep 100
done

#bench=ncf

#python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=100


