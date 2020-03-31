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
sudo nvidia-smi -ac 5705,1911
sudo nvidia-smi -i 0 -pm 1

for power in 220 190 160
do
sudo nvidia-smi -pl $power

    for bench in inception4  resnet50 resnet152 inception3
    do    
        for bsize in 64
        do
            nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.$power.res10.txt &
            power_sid=$!
            
            start_time=$(($(date +%s%N)/1000000))
            s_time=$(date +"%T")

            python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=200 > ${results_dir}/${data}/${bench}.${bsize}.$power.out10.txt

            kill ${power_sid}
            
            end_time=$(($(date +%s%N)/1000000))
            pkill nvidia-smi
            sleep 5
            
            elapse_time=$((end_time-start_time))
            
            echo ${elapse_time} >> ${results_dir}/${data}/${bench}.${bsize}.$power.out10.txt
            echo "start time: ${s_time}" >> ${results_dir}/${data}/${bench}.${bsize}.$power.out10.txt
        done
        sleep 2
    done
    
    
    
    
done

data=ECP

for power in 220 190 160
do
    sudo nvidia-smi -pl $power

    cd /home/pzou/software/software-benchmark/Deep_Learning_Bench/Candle/Pilot1/P1B1
    bench=p1b1
    nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.$power.res10.txt &
    power_sid=$!

    start_time=$(($(date +%s%N)/1000000))
    s_time=$(date +"%T")

    python ./p1b1_baseline_keras2.py -e 20 > ${results_dir}/${data}/${bench}.$power.out10.txt

    kill ${power_sid}

    end_time=$(($(date +%s%N)/1000000))
    pkill nvidia-smi
    sleep 5

    elapse_time=$((end_time-start_time))

    echo ${elapse_time} >> ${results_dir}/${data}/${bench}.$power.out10.txt
    echo "start time: ${s_time}" >> ${results_dir}/${data}/${bench}.$power.out10.txt



    cd /home/pzou/software/software-benchmark/GPU/AMGX/build/examples  
    bench=amg

    nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.$power.res10.txt &
    power_sid=$!

    start_time=$(($(date +%s%N)/1000000))
    s_time=$(date +"%T")

     ./amgx_capi -m Flan_1565/Flan_1565.mtx -c ../../core/configs/FGMRES_AGGREGATION.json  > ${results_dir}/${data}/${bench}.$power.out10.txt

    kill ${power_sid}

    end_time=$(($(date +%s%N)/1000000))
    pkill nvidia-smi
    sleep 5

    elapse_time=$((end_time-start_time))

    echo ${elapse_time} >> ${results_dir}/${data}/${bench}.$power.out10.txt
    echo "start time: ${s_time}" >> ${results_dir}/${data}/${bench}.$power.out10.txt


    cd /home/pzou/software/software-benchmark/GPU/CoMD-CUDA/
    bench=CoMD

    nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.$power.res10.txt &
    power_sid=$!

    start_time=$(($(date +%s%N)/1000000))
    s_time=$(date +"%T")

     ./bin/CoMD-cuda -e -x 100 -y 100 -z 80 -I > ${results_dir}/${data}/${bench}.$power.out10.txt

    kill ${power_sid}

    end_time=$(($(date +%s%N)/1000000))
    pkill nvidia-smi
    sleep 5

    elapse_time=$((end_time-start_time))

    echo ${elapse_time} >> ${results_dir}/${data}/${bench}.$power.out10.txt
    echo "start time: ${s_time}" >> ${results_dir}/${data}/${bench}.$power.out10.txt



    cd /home/pzou/software/software-benchmark/GPU/lammps/build
    bench=lammps

    nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.$power.res10.txt &
    power_sid=$!

    start_time=$(($(date +%s%N)/1000000))
    s_time=$(date +"%T")

    ./lmp -sf gpu -in in.lj > ${results_dir}/${data}/${bench}.$power.out10.txt

    kill ${power_sid}

    end_time=$(($(date +%s%N)/1000000))
    pkill nvidia-smi
    sleep 5

    elapse_time=$((end_time-start_time))

    echo ${elapse_time} >> ${results_dir}/${data}/${bench}.$power.out10.txt
    echo "start time: ${s_time}" >> ${results_dir}/${data}/${bench}.$power.out10.txt


done




