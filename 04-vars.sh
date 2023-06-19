#!/bin/bash

DATE_COMMAND=$(date +%F)
a=100
# a is 10 and is integer
b=abc
# abc is a string


#### No Datatypes in bash scripting.Everything is a string by defaults

echo value of ais :$a
echo ${a}
echo "${b}"

echo value of d is : $d


echo "Good morning , today date is $DATE_COMMAND"