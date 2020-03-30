#!/bin/sh

#starRandomAccess_powerbound.sh

#Author Pengfei Zou 
#Date Jan 17, 2016


#remote the previous power setting on pkg and dram
sudo /usr/local/bin/mu_power_gadget -r -1
sudo /usr/local/bin/mu_power_gadget -p -1

#get the powerlimit (since there are two drams, we need to divide the input
#parameters by 2) ("bc" means it should be floating computing)

#set the initial pkg power, and the dram power should be powerlimit - pkgpower



#set pkgpowerlimit
rampower=8
step=1
powerlimit=$(echo $1/2|bc)
pkgpower=$(echo $powerlimit-$rampower|bc)
pkglimit=20
cd /home/yhe/software-benchmark/hpcc-1.5.0b
#cd /opt/pzou/hpcc-1.5.0b
#node="$(/sbin/ifconfig | grep 'inet 172' | cut -d '.' -f4 | cut -d ' ' -f1)"
if [ -f "hpccoutf.txt" ]
then 
	rm "hpccoutf.txt"
fi
while [ $(bc <<< "$pkgpower >= $pkglimit") -eq 1 ]; do
	filename=rdAccess$1wDRAM$rampower
	
	#set power bound for pkg and ram
	/usr/local/bin/mu_power_gadget -p $pkgpower
	/usr/local/bin/mu_power_gadget -r $rampower
	
	#print current power bound for pkg and ram
	echo current DRAM power: $rampower
	echo current PKG power: $pkgpower
	
	#set output
	#/opt/power-bench/mclient -H 172.16.10.55 -d /tmp
	#/opt/power-bench/mclient -H 172.16.10.55 -l ${filename}.total.txt
	
	#start rapl
	/usr/local/bin/rapl -s 0.1 -c 0,10 -f /home/yhe/projects/pzou_test/starRandomAccess/ivy/${filename}.rapl_log.txt 2>&1 1>/dev/null &

	#record the rapl process id
	rapl_pid=$!
	
	#start hpcc
	#sudo touch hpccoutf.txt
	#sudo chmod 777 hpccoutf.txt
	/usr/lib64/openmpi/bin/mpiexec -np 20 ./hpcc
	
	#/opt/power-bench/mclient -H 172.16.10.55 -e log
	
	#kill rapl process
	sudo kill ${rapl_pid}
	
	sleep 2
	mv hpccoutf.txt /home/yhe/projects/pzou_test/starRandomAccess/ivy/${filename}.data.txt
	#scp 172.16.10.55:/tmp/${filename}.total.txt ~/projects/pzou_test/starRandomAccess/results/$node

	sleep 1
	
	#update pkgpower and rawpower
	#pkgpower=$(echo $pkgpower-$step|bc)
	rampower=$(echo $rampower+$step|bc)
   	pkgpower=$(echo $powerlimit-$rampower|bc)
done
