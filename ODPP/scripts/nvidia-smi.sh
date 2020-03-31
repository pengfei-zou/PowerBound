#!/bin/sh
#SBATCH --job-name=VGPU
#SBATCH --time=48:00:00
#SBATCH -w, --nodelist=k20


# set environment varialbe BENCHTYPE // mybench or risky
module load cuda/10.0

export CUDA_VISIBLE_DEVICES=0


cd /home/pzou/software/software-benchmark/Deep_Learning_Bench/models-1.11/official
cd /home/pzou/software/software-benchmark/Deep_Learning_Bench/tf_cnn/scripts/tf_cnn_benchmarks


data=imagenet
imagenet_dir=/home/pzou/software/software-benchmark/Deep_Learning_Bench/DataSets/imagenet-data/tf_records
results_dir=/home/pzou/projects/power_trace/AI/results

sudo nvidia-smi -i 0 -pm 1
sudo nvidia-smi -pl 250
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

arch=titan

for bench in idle
do
   
    sleep 30


    for rate in 100 50 20 10 5 2
    do
        for memfreq in 5705 5505 810
        do
            for freq in 1911	1898	1885	1873	1860	1847	1835	1822	1809	1797	1784	1771	1759	1746	1733	1721	1708	1695	1683	1670	1657	1645	1632	1620	1607	1594	1582	1569	1556	1544	1531	1518	1506	1493	1480	1468	1455	1442	1430	1417	1404	1392	1379	1366	1354	1341	1328	1316	1303	1290	1278	1265	1252	1240	1227	1215	1202	1189	1177	1164	1151	1139	1126	1113	1101	1088	1075	1063	1050	1037	1025	1012	999	987	974	961	949	936	923	911	898	885	873	860	847	835	822	810	797	784	772	759	746	734	721	708	696	683	670	658	645	632	620	607	594	582	569	556	544	531	518	506	493	480	468	455	442	430	417	405	392	379	367	354	341	329	316	303	291	278	265	253	240	227	215	202	189	177	164	151	139

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
        
        for memfreq in 405
        do
            for freq in 607	594	582	569	556	544	531	518	506	493	480	468	455	442	430	417	405	392	379	367	354	341	329	316	303	291	278	265	253	240	227	215	202	189	177	164	151	139
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
    python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=64 --model=${bench} --data_dir=${imagenet_dir} --data_name=${data} --num_batches=300000 &
    bench_sid=$!
    sleep 300


    for rate in 100 50 20 10 5 2
    do
        for memfreq in 5705 5505 810
        do
            for freq in 1911	1898	1885	1873	1860	1847	1835	1822	1809	1797	1784	1771	1759	1746	1733	1721	1708	1695	1683	1670	1657	1645	1632	1620	1607	1594	1582	1569	1556	1544	1531	1518	1506	1493	1480	1468	1455	1442	1430	1417	1404	1392	1379	1366	1354	1341	1328	1316	1303	1290	1278	1265	1252	1240	1227	1215	1202	1189	1177	1164	1151	1139	1126	1113	1101	1088	1075	1063	1050	1037	1025	1012	999	987	974	961	949	936	923	911	898	885	873	860	847	835	822	810	797	784	772	759	746	734	721	708	696	683	670	658	645	632	620	607	594	582	569	556	544	531	518	506	493	480	468	455	442	430	417	405	392	379	367	354	341	329	316	303	291	278	265	253	240	227	215	202	189	177	164	151	139

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
        
        for memfreq in 405
        do
            for freq in 607	594	582	569	556	544	531	518	506	493	480	468	455	442	430	417	405	392	379	367	354	341	329	316	303	291	278	265	253	240	227	215	202	189	177	164	151	139
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


