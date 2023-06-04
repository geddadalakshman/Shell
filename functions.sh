#!/bin/bash

userid=$(id -u)
date=$(date +"%F-%H-%M-%S")
log_file=$date.log
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
yum install httpd -y &>>$log_file
validate
yum install wget -y &>>$log_file
validate


#---passing arguments for the same code---
#!/bin/bash
#userid=$(id -u)
#R="\e[31m"
#G="\e[32m"
#N="\e[0m"
#
#if [ $userid -ne 0 ]; then
#  echo "you are not root user"
#  exit 1
#fi
#
#validate() {
#  if [ $1 -eq 0 ]; then
#    echo -e "$G $2 $N"
#  else
#    echo -e "$R $3 $N"
#    exit 1
#  fi
#}
#
##installing httpd service
#yum install httpd -y
#validate $? "installation successful" "installation failed"