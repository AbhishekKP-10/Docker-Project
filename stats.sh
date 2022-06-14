#!/bin/bash
echo `date`
read $output
cpu_threshold='80'
 
mem_threshold='80'
 
disk_threshold='80'
cpu_usage () 
{
cpu_idle=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
cpu_use=`expr 100 - $cpu_idle`
if [ $cpu_use -gt $cpu_threshold ]
   then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"CpU WaRnInG.."}' https://hooks.slack.com/services/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
        #curl -X POST -H 'Content-type: application/json' --data '{"text":"cPU wArNiNg..."}' https://hooks.slack.com/services/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
        #curl -X POST -H 'Content-type: application/json' --data '{"text":"cpu warning!!! more than threshold(80%)"}' https://hooks.slack.com/services/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
fi
}

mem_usage () {
mem_free=`free -m | grep "Mem" | awk '{print $4+$6}'`
if [ $mem_free -lt $mem_threshold  ]
    then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"mem WaRnInG..."}' https://hooks.slack.com/services/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
        #curl -X POST -H 'Content-type: application/json' --data '{"mem -alert!"}' https://hooks.slack.com/services/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
        #curl -X POST -H 'Content-type: application/json' --data '{"text":"mem warning!!! more than threshold(80%)"}' https://hooks.slack.com/services/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
fi
}

disk_usage () {
CURRENT=`df / | grep / | awk '{ print $5}' | sed 's/%//g'`
if [ "$CURRENT" -gt "$disk_threshold" ]
then 
    curl -X POST -H 'Content-type: application/json' --data '{"text":"Disk WaRnInG"}' https://hooks.slack.com/services/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
    #curl -X POST -H 'Content-type: application/json' --data '{"text":"Disk-Alert"}' https://hooks.slack.com/services/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
fi
}
cpu_usage
mem_usage
disk_usage


