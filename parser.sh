#!/bin/bash

# For initial case parsing of Legacy VM properties in ASC and template generation for notes.
# Developed by Charles Webb and Kyle Clayson.
# Please direct any support or coding inquires to https://github.com/v-chawebb/vmparser

read -p "SR#: " srnum
read -p "Time Zone of User: " tzuser
read -p "Prefered Method of Contact: " contactMethod
read -p "Issue: " issue
read -p "Problem Statement: " statement
read -p "Extended Template? y/n (Default is n): " extemplate
echo -e "\n \n";

#get the file name from the script input

file=$1

#parse the file and replace any tabs with commas for easier parsing

sed -i 's/\t/,/g' $file

#Pull subscription, resource group, and vm name from the Resource URI and separate into their own variables

varsub=($(awk -F ',' '/Resource Uri/ {print $2}' $file | awk -F '/' '{print $3}'))
varrg=($(awk -F ',' '/Resource Uri/ {print $2}' $file | awk -F '/' '{print $5}'))
varvm=($(awk -F ',' '/Resource Uri/ {print $2}' $file | awk -F '/' '{print $9}'))

#Time to define the templates
basic_template () {
echo -e "SR# $srnum \n";
echo -e "TIME ZONE: $tzuser \n";
echo -e "ISSUE: $issue \n";
echo -e "PROBLEM STATEMENT: $statement \n";
echo -e "ENVIRONMENT \n";
echo -e "=============================================================\n";
echo "Subscription: $varsub";
echo "Resource URI: $(\awk -F ',' '/Resource Uri/ {print $2}' $file)";
echo "Resource Group: $varrg";
echo "VM Name: $varvm";
echo "Deployment Model: $(\awk -F ',' '/^Deployment Model/ {print $2}' $file)";
echo "State: $(\awk -F ',' '/^State/ {print $2}' $file)";
echo "Current Power State: $(\awk -F ',' '/^Current Power State/ {print $2}' $file)";
echo "Region: $(\awk -F ',' '/^Region/ {print $2}' $file)";
echo "OS: $(\awk -F ',' '/^GuestOSVersion/ {print $2}' $file)";
echo "OS Created From: $(\awk -F ',' '/^OS Created From/ {print $2}' $file)";
echo "Size: $(\awk -F ',' '/^Size/ {print $2}' $file)";
echo "Guest Agent Status: $(\awk -F ',' '/^Guest Agent Status/ {print$2}' $file)";
echo "Guest Agent Message: $(\awk -F ',' '/^Guest Agent Message/ {print$2}' $file)";
echo "Guest Agent Version: $(\awk -F ',' '/^Guest Agent Version/ {print$2}' $file)";
echo -e "\n \n";
echo -e "CX VERBATIM\n";
echo -e "=============================================================";
}

extended_template () {
echo -e "SR# $srnum \n";
echo -e "TIME ZONE: $tzuser \n";
echo -e "ISSUE: $issue \n \n";
echo -e "PROBLEM STATEMENT: $statement \n \n";
echo -e "ENVIRONMENT \n";
echo -e "=============================================================\n";
echo "Subscription: $varsub";
echo "Resource URI: $(\awk -F ',' '/Resource Uri/ {print $2}' $file)";
echo "Resource Group: $varrg";
echo "VM Name: $varvm";
echo "Deployment Model: $(\awk -F ',' '/^Deployment Model/ {print $2}' $file)";
echo "State: $(\awk -F ',' '/^State/ {print $2}' $file)";
echo "Current Power State: $(\awk -F ',' '/^Current Power State/ {print $2}' $file)";
echo "Region: $(\awk -F ',' '/^Region/ {print $2}' $file)";
echo "OS: $(\awk -F ',' '/^GuestOSVersion/ {print $2}' $file)";
echo "OS Created From: $(\awk -F ',' '/^OS Created From/ {print $2}' $file)";
echo "Size: $(\awk -F ',' '/^Size/ {print $2}' $file)";
echo "Guest Agent Status: $(\awk -F ',' '/^Guest Agent Status/ {print$2}' $file)";
echo "Guest Agent Message: $(\awk -F ',' '/^Guest Agent Message/ {print$2}' $file)";
echo "Guest Agent Version: $(\awk -F ',' '/^Guest Agent Version/ {print$2}' $file)";
echo -e "\n \n";
echo -e "CX VERBATIM\n";
echo -e "=============================================================";
echo -e "\n \n";
echo -e "TROUBLESHOOTING\n";
echo -e "=============================================================";
echo -e "\n \n";
echo -e "CX COMMUNICATIONS\n";
echo -e "=============================================================";
echo -e "\n \n";
echo -e "INTERNAL COMMUNICATIONS\n";
echo -e "=============================================================";
echo -e "\n \n";
echo -e "NEXT STEPS\n";
echo -e "=============================================================";
echo -e "Who has action:\nWhat is the action:\nWhen is the next contact:\n";
echo -e "\n \n";
echo -e "MITIGATION\n";
echo -e "=============================================================";
echo -e "\n \n";
echo -e "RISK ASSESSMENT\n";
echo -e "=============================================================";
echo -e "TIMELY RESPONSE: Commitment missed/SLA missed/Callback task missed?\n \nNO RESOLUTION: Customer self-resolved it without our help/Unresponsive customer/Close with no solution/Customer rejected the solution/Not supported scenario?\n \nSCOPE: Request is out of scope and customer has concerns about the same?\n \nPRODUCT: Product limitation with no workaround/Code bug/SIE/Customer concern about our public documents?\n \nCOLLABORATION: Handover happened and there was delay or unsmooth transition/More than 3 CaseOwners or Collaboration Owners/Collaboration delay happened or insufficient support from other team?\n \nOTHER CONCERN: Revenue loss for the customer/Production business impact for the customer/Any other concerns the customer presented?\n \nDUPLICATED: Duplicated case, the other case has been unattended?\n \n3rd PARTY: Situation is dependable on a tool that doesn't belongs to Microsoft?\n";
echo -e "\n \n";
echo -e "LINKS USED\n";
echo -e "=============================================================";
}

#This performs the checks for whether a basic template or extended template is needed, default is no and any other input will default to a no as well unless y or Y is provided
case $extemplate in

[nN] )

basic_template ;;

[yY] )

extended_template ;;


* )

basic_template ;;

esac
