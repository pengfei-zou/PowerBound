#!/usr/bin/python

import os
import datetime
import sys

power_total=int(sys.argv[1])

power_cpu=170
power_mem=50

nodes_A=["n01", "n02", "n03", "n04"]
nodes_B=["n05", "n06", "n07", "n08"]

with open("job_running_p%d.log"%power_total,'a') as f:
    f.write("----------------\n")
    f.write("-------end-----\n")
    f.write("-------%s-----\n"%datetime.datetime.now())
    f.write("\n\n\n\n")

    f.close()


for node in nodes_A:
    os.system("ssh %s \"sudo /home/pzou/tools/mu_power_gadget -p %d\" "%(node,200))
    os.system("ssh %s \"sudo sh /home/pzou/tools/change_freq_half.sh %d\" "%(node,2300000))
    os.system("ssh %s \"sudo /home/pzou/tools/mu_power_gadget -r %d\" "%(node,50))
 

for node in nodes_B:
    os.system("ssh %s \"sudo /home/pzou/tools/mu_power_gadget -p %d\" "%(node,200))
    os.system("ssh %s \"sudo sh /home/pzou/tools/change_freq_half.sh %d\" "%(node,2300000))
    os.system("ssh %s \"sudo /home/pzou/tools/mu_power_gadget -r %d\" "%(node,50))
