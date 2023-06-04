#!/bin/bash
#finding the user is
userid=$(id -u)
echo "userid is ${userid}"
if [ $userid -eq 0 ]
then
  echo "you are a root user"
else
  echo "you are not root user"
  exit 1
fi

if [ "$userid" -ne 0 ]
then
  echo "you are not root user"
  exit 1
fi
#installing httpd service
yum install httpd -y
#checking exit status
# shellcheck disable=SC2181
if [ $? -eq 0 ]
then
  echo "httpd service installed success"
else
  echo "httpd service installed unsuccessful"
  exit 1
fi

