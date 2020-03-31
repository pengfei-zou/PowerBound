#!/usr/bin/python

import os
import sys
import datetime

power_total=int(sys.argv[1])


mem_power_set=20
cpu_power_set=power_total/2-20


nodes=["n01", "n02", "n03", "n04"]



with open("job_running_p%d.log"%power_total,'w') as f:
    f.write("----------------\n")
    f.write("-------start-----\n")
    f.write("----CPU-A:%1.f----MEM-A:%1.f----\n"%(cpu_power_set, mem_power_set))
    f.write("-------%s-----\n"%datetime.datetime.now())
    f.write("\n\n\n\n")
    f.close()

if power_total != 400:
    for node in nodes:
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0 -c 0 -l %d\" "%(node,cpu_power_set*1000000))
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 1 -c 0 -l %d\" "%(node,cpu_power_set*1000000))
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,mem_power_set*1000000))
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 1:0 -c 0 -l %d\" "%(node,mem_power_set*1000000))



for node in nodes:
    os.system("ssh %s \" /usr/local/bin/rapl -t 0.5 -m -f /home/pzou/projects/haswell/co_scheduling/results/Real_Run/Cluster/%s/FCFS/%s/%s_p%d.log > /dev/null 2>&1 &\" &"%(node,sys.argv[1], sys.argv[2],node,power_total))

