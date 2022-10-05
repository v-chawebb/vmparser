#!/bin/bash

file=$1
varsub=($(awk -F ',' '/Resource Uri/ {print $2}' $file | awk -F '/' '{print $3}'))
varrg=($(awk -F ',' '/Resource Uri/ {print $2}' $file | awk -F '/' '{print $5}'))
varvm=($(awk -F ',' '/Resource Uri/ {print $2}' $file | awk -F '/' '{print $9}'))

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


