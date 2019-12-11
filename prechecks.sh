#!/bin/bash
tput setaf 2
echo " Please provide the server name : "
read server
echo "Provide your username: "
read user
tput setaf 0
#ssh $server -l $user
echo "DNS Test : "
nslookup $server
echo "OS version : "
ssh $server -l $user uname -a
echo "Kernel version : "
ssh $server -l $user uname -r
echo "OS release : "
ssh $server -l $user cat /etc/redhat-release
echo "Hard drive info : "
ssh $server -l $user sudo /sbin/hdparm -I /dev/sd? | grep -E "Number|/dev"
echo "system serial number : "
ssh $server -l $user sudo /usr/sbin/dmidecode -t system 
echo "Error logs : "
ssh $server -l $user sudo cat /var/log/messages | grep -i smart | tail -4
exit
echo "end"
