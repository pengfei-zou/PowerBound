#!/usr/bin/python

import os
import datetime
import sys

#power_total=int(sys.argv[1])

power_cpu=170
power_mem=50

#nodes_A=["n01", "n02", "n03", "n04"]
nodes_B=["n05", "n06", "n07", "n08"]


#for node in nodes_A:
#    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0 -c 0 -l %d\" "%(node,power_cpu*1000000))
#    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 1 -c 0 -l %d\" "%(node,power_cpu*1000000))
#    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,power_mem*1000000))
#    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 1:0 -c 0 -l %d\" "%(node,power_mem*1000000))
#
#    os.system("ssh %s \"sudo pkill rapl\" "%node)
for node in nodes_B:
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0 -c 0 -l %d\" "%(node,power_cpu*1000000))
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 1 -c 0 -l %d\" "%(node,power_cpu*1000000))
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,power_mem*1000000))
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 1:0 -c 0 -l %d\" "%(node,power_mem*1000000))

#    os.system("ssh %s \"sudo pkill rapl\" "%node)
