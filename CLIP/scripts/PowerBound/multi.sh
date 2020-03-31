#!/bin/bash

# while [[ $(qstat) ]]
# do 
# sleep 600
# done

# cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/100_8/method1
# sh mutliple_job.sh

# while [[ $(qstat) ]]
# do 
# sleep 600
# done

# cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/80_8/method1
# sh mutliple_job.sh

# while [[ $(qstat) ]]
# do 
# sleep 600
# done

# cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/160_8/method2
# sh mutliple_job.sh

while [[ $(qstat) ]]
do 
sleep 600
done

cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/160_8/method3
sh mutliple_job.sh


while [[ $(qstat) ]]
do 
sleep 600
done

cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/160_8/method4
sh mutliple_job.sh

while [[ $(qstat) ]]
do 
sleep 600
done

cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/160_8/method5
sh mutliple_job.sh

while [[ $(qstat) ]]
do 
sleep 600
done

cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/120_8/method3
sh mutliple_job.sh

while [[ $(qstat) ]]
do 
sleep 600
done

cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/120_8/method4
sh mutliple_job.sh

while [[ $(qstat) ]]
do 
sleep 600
done

cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/120_8/method5
sh mutliple_job.sh

while [[ $(qstat) ]]
do 
sleep 600
done

cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/80_8/method3
sh mutliple_job.sh

while [[ $(qstat) ]]
do 
sleep 600
done

cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/80_8/method4
sh mutliple_job.sh

while [[ $(qstat) ]]
do 
sleep 600
done

cd /home/pzou/projects/haswell/multi_node/jobs/PowerBound/80_8/method5
sh mutliple_job.sh