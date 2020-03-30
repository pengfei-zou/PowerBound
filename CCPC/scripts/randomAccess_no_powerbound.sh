#!/bin/sh

#  starRandomAccess_powerbound.sh
#  
#
#  Created by Yang He on 9/22/15.
#


sudo sh /home/yhe/projects/pzou_test/set_cpu_freq.sh $1

cd /home/yhe/software-benchmark/hpcc-1.5.0b
/usr/local/bin/mu_power_gadget -r -1
/usr/local/bin/mu_power_gadget -p -1


pkgpower=-1
rampower=-2




filename=raPKG20Freq$1
# Set power for ram and package
/usr/local/bin/mu_power_gadget -r -1
/usr/local/bin/mu_power_gadget -p 20

# start rapl
/usr/local/bin/rapl -s 0.1 -c 0,10 -f ~/projects/pzou_test/starRandomAccess/results/${filename}.rapl_log.txt 2>&1 1>/dev/null &
# record the rapl process id
rapl_pid=$!

# start hpcc
/usr/lib64/openmpi/bin/mpiexec -np 20 ./hpcc

kill ${rapl_pid}
sleep 2
mv hpccoutf.txt ~/projects/pzou_test/starRandomAccess/results/${filename}.data.txt
sleep 1

/usr/local/bin/mu_power_gadget -r -1
/usr/local/bin/mu_power_gadget -p -1