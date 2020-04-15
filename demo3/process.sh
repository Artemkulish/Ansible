#!/bin/bash

array=$( ls /home/env/)
var1=$( sed -n 1p ~/env.txt)
var2=$( sed -n 2p ~/env.txt)
var3=$( sed -n 3p ~/env.txt)

for i in ${array[@]}

do
ip=$( cat /home/env/$i | grep jdbc | awk -F"/" '{ print $3}')
pass=$( cat /home/env/$i | grep 'DATABASE_PASSWORD\|SQL_PASSWORD' |  awk -F"=" '{ print $2}')
user=$( cat /home/env/$i | grep 'DATABASE_USERNAME\|SQL_USERNAME' |  awk -F"=" '{ print $2}')

sed -i  "s/${ip}/${var1}/g; s/${pass}/${var2}/; s/${user}/${var3}/" /home/env/$i
done
