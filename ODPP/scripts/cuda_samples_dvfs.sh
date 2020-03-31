#!/bin/sh
#SBATCH --job-name=VGPU
#SBATCH --time=48:00:00
#SBATCH -w, --nodelist=n01


# set environment varialbe BENCHTYPE // mybench or risky
module load cuda/10.0

export CUDA_VISIBLE_DEVICES=0


cd ~/software/software-benchmark/cuda_samples/



#define scratch_folder for save results
results_dir=/home/pzou/projects/power_trace/AI/results/





data=cuda-samples

sudo nvidia-smi -i 0 -pm 1
sudo nvidia-smi -pl 250


for bench in cdpAdvancedQuicksort conjugateGradientMultiBlockCG convolutionSeparable corr cp gaussian gramschm heartwall histogram hotspot hotspot3D lavaMD lbm md5-bruteforcer nw radixSortThrust reductionMultiBlockCG s3d scan simpleHyperQ syr2k syrk threadFenceReduction tpacf 
do 
    cd $bench
    for memfreq in 5705
    do
        for freq in 1911	1873	1835	1797	1759	1721	1683	1645	1607	1569	1531	1493	1455	1417	1379	1341	1303	1265	1227	1189	1151	1113	1075	1037	999	961	923	885	847	810	772	734	696	658	620	582	544	506	468	430	392	354	316	278	240	202	164
        do
            sudo nvidia-smi -ac $memfreq,$freq
           
            nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${freq}.${memfreq}.res10.txt &
            power_sid=$!
            
            start_time=$(($(date +%s%N)/1000000))
            s_time=$(date +"%T")

            ./run > ${results_dir}/${data}/${bench}.${freq}.${memfreq}.out10.txt

            kill ${power_sid}
            
            end_time=$(($(date +%s%N)/1000000))
            pkill nvidia-smi
            sleep 5
            
            elapse_time=$((end_time-start_time))
            
            echo ${elapse_time} >> ${results_dir}/${data}/${bench}.${freq}.${memfreq}.out10.txt
            echo "start time: ${s_time}" >> ${results_dir}/${data}/${bench}.${freq}.${memfreq}.out10.txt
              
        done    
    done
    
    cd ..
    
done