#!/bin/sh

#  starRandomAccess_powerbound.sh
#  
#
#  Created by Yang He on 9/22/15.
#


sudo sh /home/yhe/projects/pzou_test/set_cpu_freq.sh $1

cd /home/yhe/software-benchmark/hpcc-steam

/usr/local/bin/mu_power_gadget -r -1
/usr/local/bin/mu_power_gadget -p -1



filename=streamPKG20Freq$1
# Set power for ram and package
/usr/local/bin/mu_power_gadget -r -1
/usr/local/bin/mu_power_gadget -p 20

/opt/power-bench/mclient -H 172.16.10.55 -d /tmp
/opt/power-bench/mclient -H 172.16.10.55 -l ${filename}.total.txt
# start rapl
/usr/local/bin/rapl -s 0.1 -c 0,10 -f ~/projects/pzou_test/stream_powerbound/results/${filename}.rapl_log.txt 2>&1 1>/dev/null &
# record the rapl process id
rapl_pid=$!

# start hpcc
/usr/lib64/openmpi/bin/mpiexec -np 20 ./hpcc

/opt/power-bench/mclient -H 172.16.10.55 -e log
kill ${rapl_pid}
sleep 2
mv hpccoutf.txt ~/projects/pzou_test/stream_powerbound/results/${filename}.data.txt
scp 172.16.10.55:/tmp/${filename}.total.txt ~/projects/pzou_test/stream_powerbound/results/
sleep 1

/usr/local/bin/mu_power_gadget -r -1
/usr/local/bin/mu_power_gadget -p -1