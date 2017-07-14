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


# Part 1 of Backups Monitor


CRITICALDISKUSAGE="85" 
BACKUPDISKUSAGE=$(df -Ph | grep "/backup" | awk '{print $5}' | cut -d% -f1)

if [ $BACKUPDISKUSAGE -gt $CRITICALDISKUSAGE ]; then
echo "Team, the backups drive on $HOSTNAME has reached a critical level. Please investigate." | mail -n -s "[ALERT] Backup Drive on $HOSTNAME" root
fi



# Part 2 of Backups Monitor

# Backups running on system
BACKUPPROC=$(ps -elF | grep cpanel/bin/backup | grep -v grep | wc -l)
# If backup is still running alert level2 and tell them backups have been running for this many hours.
# idea: check the head of backup log and capture the time backups started. Get current time and do some math and print how long backups have been running. 
# now if backups have been running for over x (7) hours, alert level2




# Part 3 of Backups Monitor (Partial & Full Failure)
# tail latest backup log and if backup log matches PartialFailure string send alert to level2 so they can look into it.
# Need to find a way to say this: check latest backup log for this string and if it mataches send failure email
BACKUPPARTFAIL="Backup::PartialFailure"
BACKUPFAIL="Backup::Failure"
BACKUPFINALSTATUS=$(perl -lne 'print $1 if /Final state is (.*)/' /usr/local/cpanel/logs/cpbackup/$LATESTBACKUPLOG | cut -d'(' -f1)
LATESTBACKUPLOG=$(ls -Art /usr/local/cpanel/logs/cpbackup/ | tail -n 1)
if [ $BACKUPFINALSTATUS == $BACKUPPARTFAIL ] ; then
  echo "Team, the backups on $HOSTNAME have completed with a partial failure. Please investigate." | mail -n -s "[ALERT] Backups Partially Failed on $HOSTNAME" root
fi

if [ $BACKUPFINALSTATUS == $BACKUPFAIL ] ; then
  echo "Team, the backups on $HOSTNAME have completed with a full failure. Please investigate." | mail -n -s "[CRITICAL] Backups Failed on $HOSTNAME" root
fi

# Sample of cpanel backups partial failing
#[2017-07-13 05:54:40 -0400] info [backup] Queuing transport of file: /backup/2017-07-13/backup_incomplete
#[2017-07-13 05:54:40 -0400] info [backup] Pruning backup directory: /backup/2017-07-13
#[2017-07-13 06:52:53 -0400] info [backup] Queuing prune operation for remote destination daily backups
#[2017-07-13 06:53:08 -0400] info [backup] Queuing transport reporter
#[2017-07-13 06:53:23 -0400] info [backup] Completed at Thu Jul 13 06:53:23 2017
#[2017-07-13 06:53:23 -0400] info [backup] Final state is Backup::PartialFailure (0)
#[2017-07-13 06:53:23 -0400] info [backup] Sent Backup::PartialFailure notification.

# Full backups failure
# [2015-10-16 02:00:02 -0300] info [Autodie] Final state is Backup::Failure (0)
