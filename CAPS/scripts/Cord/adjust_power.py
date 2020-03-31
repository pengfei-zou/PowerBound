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


if location == "A":
    with open("suggest.txt", 'r') as f:
        for line in f:
            [temp_A, temp_power_cpu_A, temp_power_mem_A] = line.split()
            if temp_A == job_to_run:
                cpu_power_rq_A = int(temp_power_cpu_A)
                mem_power_rq_A = int(temp_power_mem_A)
                appA = job_to_run
        f.close()

    cpu_power_rq_A = int(cpu_power_rq_A)
    mem_power_rq_A = int(mem_power_rq_A)+4
    total_power_rq_A = cpu_power_rq_A + mem_power_rq_A

    if total_power_rq_A < power_total:
        remain_power_A = power_total - total_power_rq_A
        cpu_power_set_A = cpu_power_rq_A/2 + remain_power_A/2 * cpu_power_rq_A / (cpu_power_rq_A+mem_power_rq_A*6)
        mem_power_set_A = mem_power_rq_A/2 + remain_power_A/2 - remain_power_A/2 * cpu_power_rq_A / (cpu_power_rq_A+mem_power_rq_A*6)

    else:
        remain_power_A = power_total - total_power_rq_A
        cpu_power_set_A = cpu_power_rq_A/2 + remain_power_A/2 * cpu_power_rq_A / (cpu_power_rq_A+mem_power_rq_A/6)
        mem_power_set_A = mem_power_rq_A/2 + remain_power_A/2 - remain_power_A/2 * cpu_power_rq_A / (cpu_power_rq_A+mem_power_rq_A/6)

    for node in nodes_A:
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0 -c 0 -l %d\" "%(node,cpu_power_set_A*1000000))
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 1 -c 0 -l %d\" "%(node,cpu_power_set_A*1000000))
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,mem_power_set_A*1000000))
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,mem_power_set_A*1000000))

    with open("job_running_p%d.log"%power_total,'a') as f:
        f.write("----------------\n")
        f.write("----New job: %s----%s----\n"%(job_to_run, location))
        f.write("----CPU-A:%1.f----MEM-A:%1.f----\n"%(cpu_power_set_A, mem_power_set_A))
        f.write("--------%s--------\n"%datetime.datetime.now())
        f.write("----------------\n")
        f.write("\n\n")

        f.close()
if location == "B":
    with open("suggest_B.txt", 'r') as f:
        for line in f:
            [temp_B, temp_power_cpu_B, temp_power_mem_B] = line.split()
            if temp_B == job_to_run :
                cpu_power_rq_B = int(temp_power_cpu_B)
                mem_power_rq_B = int(temp_power_mem_B)
                appB = job_to_run
        f.close()


    cpu_power_rq_B = int(cpu_power_rq_B)
    mem_power_rq_B = int(mem_power_rq_B)+4
    total_power_rq_B = cpu_power_rq_B + mem_power_rq_B

    remain_power_B = power_total - total_power_rq_B
    cpu_power_set_B = cpu_power_rq_B/2 + remain_power_B/2 * cpu_power_rq_B / (cpu_power_rq_B+mem_power_rq_B*6)
    mem_power_set_B = mem_power_rq_B/2 + remain_power_B/2 - remain_power_B/2 * cpu_power_rq_B / (cpu_power_rq_B+mem_power_rq_B*6)

    for node in nodes_B:
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0 -c 0 -l %d\" "%(node,cpu_power_set_B*1000000))
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 1 -c 0 -l %d\" "%(node,cpu_power_set_B*1000000))
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,mem_power_set_B*1000000))
        os.system("ssh %s \"sudo /usr/local/bin/powercap-set -p intel-rapl -z 0:0 -c 0 -l %d\" "%(node,mem_power_set_B*1000000))

    with open("job_running_p%dB.log"%power_total,'a') as f:
        f.write("----------------\n")
        f.write("----New job: %s----%s----\n"%(job_to_run, location))
        f.write("----CPU-B:%1.f----MEM-B:%1.f----\n"%(cpu_power_set_B, mem_power_set_B))
        f.write("--------%s--------\n"%datetime.datetime.now())
        f.write("----------------\n")
        f.write("\n\n")

        f.close()

