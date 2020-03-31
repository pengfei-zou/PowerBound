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

data=imagenet

sudo nvidia-smi -i 0 -pm 1
sudo nvidia-smi -pl 250

#sudo nvidia-smi -pl $power

# for freq in 1911 1708 1506 1303 1101 898
# do
    # sudo nvidia-smi -ac 5705,$freq
    # for bench in resnet152 resnet152_v2 
    # do    
        # for bsize in 32
        # do
            # nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.${freq}.res.txt &
            # power_sid=$!

            # python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=1000 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.out2.txt

            # kill ${power_sid}
            # pkill nvidia-smi
            # sleep 5
        # done
        # sleep 2
    # done
# done

# for freq in 1911 1708 1506 1303 1101 898
# do
    # sudo nvidia-smi -ac 5705,$freq
    # for bench in inception3 inception4 vgg19 vgg16 
    # do    
        # for bsize in 64
        # do
            # #nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.${freq}.res.txt &
            # power_sid=$!
            # start_time=$(($(date +%s%N)/1000000))
            
            
            # python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=200 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.out3.txt

           # # kill ${power_sid}
           # # pkill nvidia-smi
           
            # end_time=$(($(date +%s%N)/1000000))
            # elapse_time=$((start_time-end_time))
            
            # echo ${elapse_time} >> ${results_dir}/${data}/${bench}.${bsize}.${freq}.out3.txt
            # sleep 5
        # done
        # sleep 2
    # done
# done    

# for freq in 1911 1708 1506 1303 1101 898
# do
    # sudo nvidia-smi -ac 5705,$freq
    # for bench in resnet50 resnet50_v1.5 resnet50_v2 resnet101 resnet101_v2 resnet152 nasnet 
    # do    
        # for bsize in 64
        # do
            # nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.${freq}.res.txt &
            # power_sid=$!

            # python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=1000 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.out2.txt

            # kill ${power_sid}
            # pkill nvidia-smi
            # sleep 5
        # done
        # sleep 2
    # done
# done


# for freq in 1911 1708 1506 1303 1101 898
# do
    # sudo nvidia-smi -ac 5705,$freq
    # for bench in vgg11 
    # do    
        # for bsize in 128
        # do
            # nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.${freq}.res.txt &
            # power_sid=$!

            # python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=1000 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.out2.txt

            # kill ${power_sid}
            # pkill nvidia-smi
            # sleep 5
        # done
        # sleep 2
    # done
# done

# for freq in 1911 1708 1506 1303 1101 898
# do
    # sudo nvidia-smi -ac 5705,$freq
    # for bench in googlenet 
    # do    
        # for bsize in 256
        # do
            # nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.${freq}.res.txt &
            # power_sid=$!

            # python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=1000 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.out2.txt

            # kill ${power_sid}
            # pkill nvidia-smi
            # sleep 5
        # done
        # sleep 2
    # done
# done

# for freq in 1911 1708 1506 1303 1101 898
# do
    # sudo nvidia-smi -ac 5705,$freq
    # for bench in overfeat 
    # do    
        # for bsize in 512
        # do
            # nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.${freq}.res.txt &
            # power_sid=$!

            # python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=1000 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.out2.txt

            # kill ${power_sid}
            # pkill nvidia-smi
            # sleep 5
        # done
        # sleep 2
    # done
# done



# for freq in 1911 1708 1506 1303 1101 898
# do
    # sudo nvidia-smi -ac 5705,$freq
    # for bench in alexnet 
    # do    
        # for bsize in 768
        # do
            # nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.${freq}.res.txt &
            # power_sid=$!

            # python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=1000 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.out2.txt

            # kill ${power_sid}
            # pkill nvidia-smi
            # sleep 5
        # done
        # sleep 2
    # done
# done



# for freq in 1911 1708 1506 1303 1101 898
# do
    # sudo nvidia-smi -ac 5705,$freq
    # for bench in lenet trivial mobilenet
    # do    
        # for bsize in 1024
        # do
            # nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.${freq}.res.txt &
            # power_sid=$!

            # python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=1000 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.out2.txt

            # kill ${power_sid}
            # pkill nvidia-smi
            # sleep 5
        # done
        # sleep 2
    # done
# done