#!/usr/bin/python

import os
import datetime
import sys

power_total=int(sys.argv[3])

power_cpu=170
power_mem=50


nodes_A=["n01", "n02", "n03", "n04"]
nodes_B=["n05", "n06", "n07", "n08"]



job_to_run=sys.argv[1]
location=sys.argv[2]



#with open("run_A.txt", 'r') as f:
#    line = f.readline()
#    [appA, cpu_power_rq_A, mem_power_rq_A] = line.split()
#    f.close()
#
#with open("run_B.txt", 'r') as f:
#    line = f.readline()
#    [appB,cpu_power_rq_B, mem_power_rq_B] = line.split()
#    f.close()


with open("job_running_p%d.log"%power_total,'a') as f:
        f.write("----------------\n")
        f.write("----New job: %s----%s----\n"%(job_to_run, location))
        f.write("--------%s--------\n"%datetime.datetime.now())
        f.write("----------------\n")
        f.write("\n\n")

        f.close()

