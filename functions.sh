#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ]; then
  echo "you are not root user"
  exit 1
fi

validate() {
  if [ $? -eq 0 ]; then
    echo "installation successful"
  else
    echo "installation failed"
    exit 1
  fi
}


yum install httpds -y
validate