#!/bin/bash

echo -e "\e[45;33m script name that you're running is : $0 \e[0m"
a=10 
b=$1      # $1 first argement passed to the script 
c=$2 
d=$3 
echo -e "\e[42;33m value of a is : $a \e[0m " 
echo -e "\e[42;33m value of a is : $b \e[0m " 
echo -e "\e[42;33m value of a is : $c \e[0m " 
echo -e "\e[42;33m value of a is : $d \e[0m " 
# sh scriptname.sh 100 200 300 
# sh scriptname.sh  $1  $2  $3