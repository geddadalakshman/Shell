#!/bin/bash
#disk_usage=$(df -hT | grep -vE "tmpfs|Filesystem" | awk '{print $6}')
#disk_usage=$(df -hT | grep -vE "tmpfs|Filesystem" | awk '{print $6}' | cut -d "%" -f1)

disk_threshold=1
disk_usage=$(df -hT | grep -vE "tmpfs|Filesystem" | awk '{print $6 " " $1}')

while IFS= read -r line; do
    usage=$(echo $line | cut -d "%" -f1)
    partition=$(echo $disk_usage | cut -d " " -f2)
    echo "usage is $usage"
    echo "partition is $partition"
    if [ $usage -ge $disk_threshold ]; then
      echo "High disk usage on $partition: $usage"
    fi
done<<<$disk_usage

