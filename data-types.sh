#!/bin/bash
#addition of two numbers
number1=20
number2=24
result=$((number1+number2))
echo "$result"

#-----------passing args------
number3=$1
number4=$2
result1=$((number3+number4))
echo "$result1"