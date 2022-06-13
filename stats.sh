#!/bin/bash
echo `date`

cpu_threshold='0'
 
mem_threshold='80'
 
disk_threshold='80'
cpu_usage () 
{
cpu_idle=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
cpu_use=`expr 100 - $cpu_idle`
if [ $cpu_use -gt $cpu_threshold ]
   then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"cpu warning!!! more than threshold(80%)"}' https://hooks.slack.com/services/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
fi
}

mem_usage () {
mem_free=`free -m | grep "Mem" | awk '{print $4+$6}'`
if [ $mem_free -lt $mem_threshold  ]
    then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"mem warning!!! more than threshold(80%)"}' https://hooks.slack.com/services/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
fi
}

disk_usage () {
df -Ph | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5,$1 }' | while read output;
do
  echo $output
  used=$(echo $output | awk '{print $1}' | sed s/%//g)
  partition=$(echo $output | awk '{print $2}')
  if [ $used -ge 60 ]; 
  then
    curl -X POST -H 'Content-type: application/json' --data '{"text":"Disk Space Alert more than threshold(80%)"}' https://hooks.slack.com/services/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
  fi
done
}
cpu_usage
mem_usage
disk_usage

