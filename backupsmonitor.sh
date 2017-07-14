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
# this script also needs to check if the last nights backups failed and if so then send email to level2. 
# cron for script needs to run after backups
# script could also notify level2 if backups are still running after 12-16 hours
# Title could be like: [server.ondine.net.co] FAILED ⛔: httpd (198.136.49.170)
# use ansible to deploy the script
CRITICALDISKUSAGE="85" 
BACKUPDISKUSAGE=$(df -Ph | grep "/backup" | awk '{print $5}' | cut -d% -f1)

if [ $BACKUPDISKUSAGE -gt $CRITICALDISKUSAGE ]; then
echo "Test Email" | mail -n -s "Sending Test eMail" root
fi

# Backups running on system
BACKUPPROC="ps -elF | grep cpanel/bin/backup | grep -v grep | wc -l"
# If backup is still running

# Sample of cpanel backups failing
#[2017-07-13 05:54:40 -0400] info [backup] Queuing transport of file: /backup/2017-07-13/backup_incomplete
#[2017-07-13 05:54:40 -0400] info [backup] Pruning backup directory: /backup/2017-07-13
#[2017-07-13 06:52:53 -0400] info [backup] Queuing prune operation for remote destination daily backups
#[2017-07-13 06:53:08 -0400] info [backup] Queuing transport reporter
#[2017-07-13 06:53:23 -0400] info [backup] Completed at Thu Jul 13 06:53:23 2017
#[2017-07-13 06:53:23 -0400] info [backup] Final state is Backup::PartialFailure (0)
#[2017-07-13 06:53:23 -0400] info [backup] Sent Backup::PartialFailure notification.
