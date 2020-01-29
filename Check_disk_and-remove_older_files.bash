#!/bin/bash
filename=`basename "$0"`
date=`date "+%y_%m_%d"`
echo $filename script START time `date` >> /var/log/sizedisk.txt

#show Use in %
curentsize=`df  /dev/sdb1 --output=used | tail -n1`
#this variable is 80% of all disk
oursize=1498686665
echo $curentsize
echo $oursize

if [ $oursize > $curentsize ]
then
#  ls -l  last 5 older file
    cd /var/log/suricata/StatsByDate/
    ls -l >> /var/log/sizedisk.txt
    ls -1 -t | tail -5 | xargs -d '\n' rm -f
else
    df -h /dev/sda1  >> /var/log/sizedisk.txt
fi
echo $filename script END script `date` >> /root/sizedisk.txt
