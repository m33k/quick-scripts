#!/bin/bash
# Author: m33k
# Date: 3-25-2017 -- Saturday Night Scripting
# Description: An interactive script to monitor files and directories using auditd on RHEL7/CentOS7.
# Version: 0.1

# Start of Script

# Variable Declarations
auditOff=`systemctl status auditd | grep -i dead | awk '{print $3}'`
auditFailed=`systemctl status auditd | head -3 | grep failed | awk {'print $2'}`

# Check if Audit is installed

type auditd > /dev/null 2>&1 || { echo >&2 "This script requires the audit rpm to be installed. Please install it and run the script. Program Terminated..."; }
exit 1;

# Check if audit is running

if [ "$auditOff" == "(dead)" ]; then
  echo "auditd is not running."
  exit 0;

elif [ "$auditFailed" == failed ]; then
  echo "auditd has failed! Please Check Logs."
  exit 1;
fi
