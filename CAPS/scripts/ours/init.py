#!/usr/bin/python

import os
import sys
import datetime

power_total=int(sys.argv[1])

power_cpu=170
power_mem=50


nodes_A=["n01", "n02", "n03", "n04"]
nodes_B=["n05", "n06", "n07", "n08"]

with open("suggest_A.txt", 'r') as f:
    line = f.readline()
    [temp_0, temp_1, temp_cpu_power, temp_mem_power] = line.split()
    f.close()

with open("run_A.txt", 'w') as f:
    f.write("%s "%temp_0)
    f.write("%s "%temp_1)
    f.write("%s "%temp_cpu_power)
    f.write("%s"%temp_mem_power)
    f.close()

with open("suggest_B.txt", 'r') as f:
    line = f.readline()
    [temp_0, temp_1, temp_cpu_power, temp_mem_power] = line.split()
    f.close()

with open("run_B.txt", 'w') as f:
    f.write("%s "%temp_0)
    f.write("%s "%temp_1)
    f.write("%s "%temp_cpu_power)
    f.write("%s"%temp_mem_power)
    f.close()

with open("job_running_p%d.log"%power_total,'w') as f:
    f.write("----------------\n")
    f.write("-------start-----\n")
    f.write("-------%s-----\n"%datetime.datetime.now())
    f.write("\n\n\n\n")
    f.close()

for node in nodes_A:
    os.system("ssh %s \" /usr/local/bin/rapl -t 0.5 -m -f /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/%s/ours/%s/%s_p%d.log > /dev/null 2>&1 &\" &"%(node,sys.argv[1], sys.argv[2],node,power_total))

for node in nodes_B:
    os.system("ssh %s \" /usr/local/bin/rapl -t 0.5 -m -f /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/%s/ours/%s/%s_p%d.log > /dev/null 2>&1 &\" &"%(node,sys.argv[1], sys.argv[2],node,power_total))
