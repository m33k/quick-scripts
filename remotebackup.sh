#!/bin/bash
# Author: m33k
# Date: 7-2-2017 -- Sunday Night Scripting
# Description: Check if backup drive is 85% full or higher then send email to notify. Run's nightly 
# Version: 0.1

# Start of Script

# Variable Declarations

# Goals for script
# 1. Check Disk Usage and if it too large for the backup alert admin
# 2. If backups can generate, start taring file(s) to be backed up & date it for transport -- create log of tar
# 3. Once file is tar'd, rsync or scp the file to the remote server -- create log of rsync
# 4. Remove tar'd file from local server
# 5. Alert Admin Backup Succeeded
CRITICALDISKUSAGE="85" 
BACKUPDISKUSAGE=$(df -Ph | grep "/backup" | awk '{print $5}' | cut -d% -f1)

DATE=$(date +%F)
DIR2BACKUP="#ADD DIR ABSOLUTE PATH HERE"
FILE2BACKUP="#ADD FILE ABSOLUTE PATH HERE"

if [ BACKUPDISKUSAGE -gt CRITICALDISKUSAGE ]; then
 #send email to admin
#echo "Backups Log" | mail -n -s "Backups Report for $HOSTNAME" root@localhost
fi

