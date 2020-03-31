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

for memfreq in 5705
do
    #for freq in 1911	1885	1860	1835	1809	1784	1759	1733	1721	1708	1695	1683	1670	1657	1645	1632	1620	1607	1594	1582	1569	1556	1544	1531	1518	1506	1493	1480	1468	1455	1442	1430	1417	1404	1392	1379	1366	1354	1341	1328	1316	1303	1290	1278	1265	1252	1240	1227	1215	1202	1189	1177	1164	1151	1139	1126	1113	1101	1088	1075	1063	1050	1037	1025	1012	999	987	974	961	949	936	923	911	898	885	873	860	847	835	822	810	797	784	772	759	746	734	721	708	696	683	670	658	645	632	620	607	594	582	569	556	544	531	518	506	493	480	468	455	442	430	417	405	392	379	367	354	341	329	316	303	291	278	265	253	240	227	215	202	189	177	164	151	139
    #for freq in 1911	1873	1835	1797	1759	1721	1683	1645	1607	1569	1531	1493	1455	1417	1379	1341	1303	1265	1227	1189	1151	1113	1075	1037	999	961	923	885	847	810	772	734	696	658	620	582	544	506	468	430	392	354	316	278	240	202	164
    for freq in 240	202	164
    
    do
        sudo nvidia-smi -ac $memfreq,$freq
        for bench in inception4  resnet50 resnet152 vgg19 inception3
        do    
            for bsize in 64
            do
                nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.${freq}.${memfreq}.res10.txt &
                power_sid=$!
                
                start_time=$(($(date +%s%N)/1000000))
                s_time=$(date +"%T")

                python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=200 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.${memfreq}.out10.txt

                kill ${power_sid}
                
                end_time=$(($(date +%s%N)/1000000))
                pkill nvidia-smi
                sleep 5
                
                elapse_time=$((end_time-start_time))
                
                echo ${elapse_time} >> ${results_dir}/${data}/${bench}.${bsize}.${freq}.${memfreq}.out10.txt
                echo "start time: ${s_time}" >> ${results_dir}/${data}/${bench}.${bsize}.${freq}.${memfreq}.out10.txt
            done
            sleep 2
        done
    done    
done

# for memfreq in 405
# do
    # #for freq in 607	594	582	569	556	544	531	518	506	493	480	468	455	442	430	417	405	392	379	367	354	341	329	316	303	291	278	265	253	240	227	215	202	189	177	164	151	139
    # for freq in 582	544	506	468	430	392	354	316	278	240	202	164
    # do
        # sudo nvidia-smi -ac $memfreq,$freq
        # for bench in inception4  resnet50 resnet152 vgg19 
        # do    
            # for bsize in 64
            # do
                # nvidia-smi -i 0 --loop-ms=10 --format=csv --query-gpu=power.draw,utilization.gpu,utilization.memory > ${results_dir}/${data}/${bench}.${bsize}.${freq}.${memfreq}.res10.txt &
                # power_sid=$!
                
                # start_time=$(($(date +%s%N)/1000000))
                # s_time=$(date +"%T")

                # python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=${bsize} --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=200 > ${results_dir}/${data}/${bench}.${bsize}.${freq}.${memfreq}.out10.txt

                # kill ${power_sid}
                
                # end_time=$(($(date +%s%N)/1000000))
                # pkill nvidia-smi
                # sleep 5
                
                # elapse_time=$((end_time-start_time))
                
                # echo ${elapse_time} >> ${results_dir}/${data}/${bench}.${bsize}.${freq}.${memfreq}.out10.txt
                # echo "start time: ${s_time}" >> ${results_dir}/${data}/${bench}.${bsize}.${freq}.${memfreq}.out10.txt
            # done
            # sleep 2
        # done
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