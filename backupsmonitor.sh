#!/bin/bash
# Author: m33k
# Date: 5-15-2017 -- Monday Night Scripting
# Description: Check if backup drive is 85% full or higher then send email to notify. Run's nightly 
# Version: 0.1

# Start of Script

# Variable Declarations


# assign backup usage variable and cut out percent
# compare it to 85 using -gt
# then send out email to level2 for them to check into it.
# future may want to check disk usage of both main partition and backup drive
# use ansible to deploy the script
CRITICALDISKUSAGE="85" 
BACKUPDISKUSAGE=$(df -Ph | grep "/backup" | awk '{print $5}' | cut -d% -f1)

if [ BACKUPDISKUSAGE -gt CRITICALDISKUSAGE ]; then
 #send email to level two

#echo "Test Email" | mail -n -s "Sending Test eMail" root@localhost
fi

