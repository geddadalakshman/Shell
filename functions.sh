#!/bin/bash
userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $userid -ne 0 ]; then
  echo "you are not root user"
  exit 1
fi

validate() {
  if [ $? -eq 0 ]; then
    echo -e "$G installation successful $N"
  else
    echo -e "$R installation failed $N"
    exit 1
  fi
}

#installing httpd service
yum install httpds -y
validate