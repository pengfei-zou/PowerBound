#!/usr/bin/python

import os
import datetime
import sys
import math

power_total=int(sys.argv[4])

power_cpu=170
power_mem=50


nodes_A=["n01", "n02", "n03", "n04"]
nodes_B=["n05", "n06", "n07", "n08"]



job_to_run=sys.argv[1]
location=sys.argv[2]
partion = sys.argv[3]



with open("run_A.txt", 'r') as f:
    line = f.readline()
    [appA0, appA1,cpu_power_rq_AH, cpu_power_rq_AL, mem_power_rq_A] = line.split()
    f.close()

with open("run_B.txt", 'r') as f:
    line = f.readline()
    [appB0, appB1,cpu_power_rq_BH, cpu_power_rq_BL, mem_power_rq_B] = line.split()
    f.close()


if location == "A":
    with open("suggest_A.txt.bk", 'r') as f:
        if partion == "0":
            for line in f:
                [temp_A0, temp_A1, temp_power_cpu_AH, temp_power_cpu_AL, temp_power_mem_A] = line.split()
                if temp_A0 == job_to_run and temp_A1 == appA1:
                    cpu_power_rq_AH = int(temp_power_cpu_AH)
                    cpu_power_rq_AL = int(temp_power_cpu_AL)
                    mem_power_rq_A = int(temp_power_mem_A)
                    appA0 = job_to_run
        elif partion == "1":
            for line in f:
                [temp_A0, temp_A1, temp_power_cpu_AH, temp_power_cpu_AL, temp_power_mem_A] = line.split()
                if temp_A1 == job_to_run and temp_A0 == appA0:
                    cpu_power_rq_AH = int(temp_power_cpu_AH)
                    cpu_power_rq_AL = int(temp_power_cpu_AL)
                    mem_power_rq_A = int(temp_power_mem_A)
                    appA1 = job_to_run
        f.close()
    with open("run_A.txt","w") as f:
        f.write("%s %s %d %d %d"%(appA0, appA1, int(cpu_power_rq_AH), int(cpu_power_rq_AL), int(mem_power_rq_A)))
if location == "B":
    with open("suggest_B.txt.bk", 'r') as f:
        if partion == "0":
            for line in f:
                [temp_B0, temp_B1, temp_power_cpu_BH, temp_power_cpu_BL, temp_power_mem_B] = line.split()
                if temp_B0 == job_to_run and temp_B1 == appB1:
                    cpu_power_rq_BH = int(temp_power_cpu_BH)
                    mem_power_rq_B = int(temp_power_mem_B)
                    cpu_power_rq_BL = int(temp_power_cpu_BL)
                    appB0 = job_to_run
        elif partion == "1":
            for line in f:
                [temp_B0, temp_B1, temp_power_cpu_BH, temp_power_cpu_BL, temp_power_mem_B] = line.split()
                if temp_B1 == job_to_run and temp_B0 == appB0:
                    cpu_power_rq_BH = int(temp_power_cpu_BH)
                    mem_power_rq_B = int(temp_power_mem_B)
                    cpu_power_rq_BL = int(temp_power_cpu_BL)
                    appB1 = job_to_run
        f.close()
    with open("run_B.txt","w") as f:
        f.write("%s %s %d %d %d"%(appB0, appB1, int(cpu_power_rq_BH), int(cpu_power_rq_BL), int(mem_power_rq_B)))

cpu_power_rq_AH = int(cpu_power_rq_AH)
mem_power_rq_A = int(mem_power_rq_A)+4
total_power_rq_AH = cpu_power_rq_AH + mem_power_rq_A


cpu_power_rq_AL = int(cpu_power_rq_AL)
total_power_rq_AL = cpu_power_rq_AL + mem_power_rq_A


cpu_power_rq_BH = int(cpu_power_rq_BH)
mem_power_rq_B = int(mem_power_rq_B)+4
total_power_rq_BH = cpu_power_rq_BH + mem_power_rq_B

cpu_power_rq_BL = int(cpu_power_rq_BL)
total_power_rq_BL = cpu_power_rq_BL + mem_power_rq_B

freq_A1 = 2300000
freq_A2 = 2300000
freq_B1 = 2300000
freq_B2 = 2300000


if total_power_rq_AH + total_power_rq_BH < power_total*2:
    remain_power = power_total*2.0 - (total_power_rq_AH + total_power_rq_BH)
    remain_power_A = remain_power * (total_power_rq_AH*1.0) / (total_power_rq_AH + total_power_rq_BH)
    remain_power_B = remain_power - remain_power_A

    cpu_power_set_A = cpu_power_rq_AH/2 + remain_power_A/2 * cpu_power_rq_AH / (cpu_power_rq_AH+mem_power_rq_A*3)
    mem_power_set_A = mem_power_rq_A/2 + remain_power_A/2 - remain_power_A/2 * cpu_power_rq_AH / (cpu_power_rq_AH+mem_power_rq_A*3)

    cpu_power_set_B = cpu_power_rq_BH/2 + remain_power_B/2 * cpu_power_rq_BH / (cpu_power_rq_BH+mem_power_rq_B*3)
    mem_power_set_B = mem_power_rq_B/2 + remain_power_B/2 - remain_power_B/2 * cpu_power_rq_BH / (cpu_power_rq_BH+mem_power_rq_B*3)    
    
elif total_power_rq_AL + total_power_rq_BL < power_total*2:
    remain_power = power_total*2.0 - (total_power_rq_AL + total_power_rq_BL)
    remain_power_A = remain_power * (total_power_rq_AL*1.0) / (total_power_rq_AL + total_power_rq_BL)
    remain_power_B = remain_power - remain_power_A

    cpu_power_set_A = cpu_power_rq_AL/2 + remain_power_A/2 
    mem_power_set_A = mem_power_rq_A/2
    freq_A1 = math.ceil(remain_power_A*1.0 / (cpu_power_rq_AH-cpu_power_rq_AL) *11  ) * 100000 + 1200000

    cpu_power_set_B = cpu_power_rq_BL/2 + remain_power_B/2
    mem_power_set_B = mem_power_rq_B/2 
    freq_B1 = math.ceil(remain_power_B*1.0 / (cpu_power_rq_BH-cpu_power_rq_BL) *11  ) * 100000 + 1200000
    
else:
    remain_power = power_total*2.0 - (total_power_rq_AL + total_power_rq_BL)
    remain_power_A = remain_power * (total_power_rq_AL*1.0) / (total_power_rq_AL + total_power_rq_BL)
    remain_power_B = remain_power - remain_power_A

    cpu_power_set_A = cpu_power_rq_AL/2 + remain_power_A/2 
    mem_power_set_A = mem_power_rq_A/2
    freq_A1 =  1200000

    cpu_power_set_B = cpu_power_rq_BL/2 + remain_power_B/2
    mem_power_set_B = mem_power_rq_B/2 
    freq_B1 =  1200000
    
for node in nodes_A:
    os.system("ssh %s \"sudo /home/pzou/tools/mu_power_gadget -p %d\" "%(node,cpu_power_set_A))
    os.system("ssh %s \"sudo sh /home/pzou/tools/change_freq_half.sh %d\" "%(node,freq_A1))
    os.system("ssh %s \"sudo /home/pzou/tools/mu_power_gadget -r %d\" "%(node,mem_power_set_A))
 

for node in nodes_B:
    os.system("ssh %s \"sudo /home/pzou/tools/mu_power_gadget -p %d\" "%(node,cpu_power_set_B))
    os.system("ssh %s \"sudo sh /home/pzou/tools/change_freq_half.sh %d\" "%(node,freq_B1))
    os.system("ssh %s \"sudo /home/pzou/tools/mu_power_gadget -r %d\" "%(node,mem_power_set_B))

with open("job_running_p%d.log"%power_total,'a') as f:
    f.write("----------------\n")
    f.write("----New job: %s----%s----%s----\n"%(job_to_run, location,partion))
    f.write("----Current status----\n")
    f.write("----App-A0:%s----App-A1:%s----\n"%(appA0,appA1))
    f.write("----CPU-A:%1.f----MEM-A:%1.f---freq-A1:%d----\n"%(cpu_power_set_A, mem_power_set_A, freq_A1))
    f.write("----App-B0:%s----App-B1:%s----\n"%(appB0,appB1))
    f.write("----CPU-B:%1.f----MEM-B:%1.f---freq-B1:%d----\n"%(cpu_power_set_B, mem_power_set_B, freq_B1))
    f.write("--------%s--------\n"%datetime.datetime.now())
    f.write("----------------\n")
    f.write("\n\n")

    f.close()
