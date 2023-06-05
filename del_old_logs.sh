#!/bin/bash
#find the path where the logs should be deleted
#find the files to delete
#take a loop function and execute the commands

path=/home/centos/shell/logs
date=$(date +%F)
log_file="$date.log"

input=$(find "$path" -name "*.log" -type f -mtime +14)
while IFS= read -r line; do
  echo "Deleting log file: $line" &>>"$log_file"
  rm -rf $line
done <<< "$input"