#!/usr/bin/python

import os
import datetime
import sys

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
    [appA0, appA1,cpu_power_rq_A, mem_power_rq_A] = line.split()
    f.close()

with open("run_B.txt", 'r') as f:
    line = f.readline()
    [appB0, appB1,cpu_power_rq_B, mem_power_rq_B] = line.split()
    f.close()


if location == "A":
    with open("suggest_A.txt", 'r') as f:
        if partion == "0":
            for line in f:
                [temp_A0, temp_A1, temp_power_cpu_A, temp_power_mem_A] = line.split()
                if temp_A0 == job_to_run and temp_A1 == appA1:
                    cpu_power_rq_A = int(temp_power_cpu_A)
                    mem_power_rq_A = int(temp_power_mem_A)
                    appA0 = job_to_run
        elif partion == "1":
            for line in f:
                [temp_A0, temp_A1, temp_power_cpu_A, temp_power_mem_A] = line.split()
                if temp_A1 == job_to_run and temp_A0 == appA0:
                    cpu_power_rq_A = int(temp_power_cpu_A)
                    mem_power_rq_A = int(temp_power_mem_A)
                    appA1 = job_to_run
        f.close()
    with open("run_A.txt","w") as f:
        f.write("%s %s %d %d"%(appA0, appA1, int(cpu_power_rq_A), int(mem_power_rq_A)))
if location == "B":
    with open("suggest_B.txt", 'r') as f:
        if partion == "0":
            for line in f:
                [temp_B0, temp_B1, temp_power_cpu_B, temp_power_mem_B] = line.split()
                if temp_B0 == job_to_run and temp_B1 == appB1:
                    cpu_power_rq_B = int(temp_power_cpu_B)
                    mem_power_rq_B = int(temp_power_mem_B)
                    appB0 = job_to_run
        elif partion == "1":
            for line in f:
                [temp_B0, temp_B1, temp_power_cpu_B, temp_power_mem_B] = line.split()
                if temp_B1 == job_to_run and temp_B0 == appB0:
                    cpu_power_rq_B = int(temp_power_cpu_B)
                    mem_power_rq_B = int(temp_power_mem_B)
                    appB1 = job_to_run
        f.close()
    with open("run_B.txt","w") as f:
        f.write("%s %s %d %d"%(appB0, appB1, int(cpu_power_rq_B), int(mem_power_rq_B)))

cpu_power_rq_A = int(cpu_power_rq_A)
mem_power_rq_A = int(mem_power_rq_A)+4
total_power_rq_A = cpu_power_rq_A + mem_power_rq_A

cpu_power_rq_B = int(cpu_power_rq_B)
mem_power_rq_B = int(mem_power_rq_B)+4
total_power_rq_B = cpu_power_rq_B + mem_power_rq_B



if total_power_rq_A + total_power_rq_B < power_total*2:
    remain_power = power_total*2.0 - (total_power_rq_A + total_power_rq_B)
    remain_power_A = remain_power * (total_power_rq_A*1.0) / (total_power_rq_A + total_power_rq_B)
    remain_power_B = remain_power - remain_power_A

    cpu_power_set_A = cpu_power_rq_A/2 + remain_power_A/2 * cpu_power_rq_A / (cpu_power_rq_A+mem_power_rq_A*6)
    mem_power_set_A = mem_power_rq_A/2 + remain_power_A/2 - remain_power_A/2 * cpu_power_rq_A / (cpu_power_rq_A+mem_power_rq_A*6)

    cpu_power_set_B = cpu_power_rq_B/2 + remain_power_B/2 * cpu_power_rq_B / (cpu_power_rq_B+mem_power_rq_B*6)
    mem_power_set_B = mem_power_rq_B/2 + remain_power_B/2 - remain_power_B/2 * cpu_power_rq_B / (cpu_power_rq_B+mem_power_rq_B*6)
else:
    remain_power = power_total*2.0 - (total_power_rq_A + total_power_rq_B)
    remain_power_A = remain_power * (total_power_rq_A*1.0) / (total_power_rq_A + total_power_rq_B)
    remain_power_B = remain_power - remain_power_A

    cpu_power_set_A = cpu_power_rq_A/2 + remain_power_A/2 * cpu_power_rq_A / (cpu_power_rq_A+mem_power_rq_A/6)
    mem_power_set_A = mem_power_rq_A/2 + remain_power_A/2 - remain_power_A/2 * cpu_power_rq_A / (cpu_power_rq_A+mem_power_rq_A/6)

    cpu_power_set_B = cpu_power_rq_B/2 + remain_power_B/2 * cpu_power_rq_B / (cpu_power_rq_B+mem_power_rq_B/6)
    mem_power_set_B = mem_power_rq_B/2 + remain_power_B/2 - remain_power_B/2 * cpu_power_rq_B / (cpu_power_rq_B+mem_power_rq_B/6)
for node in nodes_A:
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0 -c 0 -l %d\" "%(node,cpu_power_set_A*1000000))
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 1 -c 0 -l %d\" "%(node,cpu_power_set_A*1000000))
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,mem_power_set_A*1000000))
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,mem_power_set_A*1000000))

for node in nodes_B:
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0 -c 0 -l %d\" "%(node,cpu_power_set_B*1000000))
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 1 -c 0 -l %d\" "%(node,cpu_power_set_B*1000000))
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,mem_power_set_B*1000000))
    os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,mem_power_set_B*1000000))

with open("job_running_p%d.log"%power_total,'a') as f:
    f.write("----------------\n")
    f.write("----New job: %s----%s----%s----\n"%(job_to_run, location,partion))
    f.write("----Current status----\n")
    f.write("----App-A0:%s----App-A1:%s----\n"%(appA0,appA1))
    f.write("----CPU-A:%1.f----MEM-A:%1.f----\n"%(cpu_power_set_A, mem_power_set_A))
    f.write("----App-B0:%s----App-B1:%s----\n"%(appB0,appB1))
    f.write("----CPU-B:%1.f----MEM-B:%1.f----\n"%(cpu_power_set_B, mem_power_set_B))
    f.write("--------%s--------\n"%datetime.datetime.now())
    f.write("----------------\n")
    f.write("\n\n")

    f.close()
