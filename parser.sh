#!/bin/bash

read -p "SR#: " srnum
read -p "Time Zone of User: " tzuser
read -p "Prefered Method of Contact " contactMethod
read -p "Issue " issue
read -p "Problem Statement " statement



file=$1
sed -i 's/\t/,/g' $file
varsub=($(awk -F ',' '/Resource Uri/ {print $2}' $file | awk -F '/' '{print $3}'))
varrg=($(awk -F ',' '/Resource Uri/ {print $2}' $file | awk -F '/' '{print $5}'))
varvm=($(awk -F ',' '/Resource Uri/ {print $2}' $file | awk -F '/' '{print $9}'))

echo "TIME ZONE: $tzuser"
echo "SR# $srnum"
echo -e "\n \nISSUE: $issue \n \n"
echo -e "PROBLEM STATEMENT: $statement \n \n"

echo -e "ENVIRONMENT \n"
echo -e "=============================================================\n"
echo "Subscription: $varsub"
echo "Resource URI: $(\awk -F ',' '/Resource Uri/ {print $2}' $file)"
echo "Resource Group: $varrg"
echo "VM Name: $varvm"
echo "Deployment Model: $(\awk -F ',' '/^Deployment Model/ {print $2}' $file)"
echo "State: $(\awk -F ',' '/^State/ {print $2}' $file)"
echo "Current Power State: $(\awk -F ',' '/^Current Power State/ {print $2}' $file)"
echo "Region: $(\awk -F ',' '/^Region/ {print $2}' $file)"
echo "OS: $(\awk -F ',' '/^GuestOSVersion/ {print $2}' $file)"
echo "OS Created From: $(\awk -F ',' '/^OS Created From/ {print $2}' $file)"
echo "Size: $(\awk -F ',' '/^Size/ {print $2}' $file)"
echo "Guest Agent Status: $(\awk -F ',' '/^Guest Agent Status/ {print$2}' $file)"
echo "Guest Agent Message: $(\awk -F ',' '/^Guest Agent Message/ {print$2}' $file)"
echo "Guest Agent Version: $(\awk -F ',' '/^Guest Agent Version/ {print$2}' $file)"
echo -e "\n \n"
echo -e "CX VERBATIM\n"
echo -e "============================================================="
