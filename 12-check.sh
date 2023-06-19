#!/bin/bash

ID =$(id -u)
if [ $ID -eq 0 ] ; then
    echo "Excuting httpd installation"
    yum install httpd -y

else
    echo -e "\e[42;33m Try excuting the script with sudo or a root user \e[0m"

fi