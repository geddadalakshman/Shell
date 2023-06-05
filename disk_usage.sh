#!/bin/bash
#disk_usage=$(df -hT | grep -vE "tmpfs|Filesystem" | awk '{print $6}')
#disk_usage=$(df -hT | grep -vE "tmpfs|Filesystem" | awk '{print $6}' | cut -d "%" -f1)

disk_threshold=1
disk_usage=$(df -hT | grep -vE "tmpfs|Filesystem" | awk '{print $6 " " $1}')
partition=$($disk_usage | cut -d "%" -f2)

if [ $disk_threshold -ge "$disk_usage" ]; then
  echo "High disk usage on $partition : $disk_usage"

fi