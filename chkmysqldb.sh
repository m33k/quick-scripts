#!/bin/bash
# Author: m33k
# Date: 3-17-2017 -- Friday Night Scripting
# Description: A small function that checks and repairs necessary MySQL Databases on a cPanel Server
# Version: 0.1
# Features to add: Check if this bash instance is running in screen

# Start of Script

# Variable Declarations:
WORKDIR=/home/.hd/ticket/
TICKETDIR=/home/.hd/ticket/$TICKETID
SCREENID=ticket.$TICKETID

# Ask User for Ticket ID
read -p "Please enter ticket id: " TICKETID

# Checking and Creating Directories
if [ ! -d "$WORKDIR" ]; then
 echo "....creating HD working directory"
 mkdir -pv $WORKDIR;
 chmod 600 $WORKDIR;
fi

if [ ! -d "$TICKETDIR" ]; then
 echo ".... creating working directory for ticket: "$TICKETID
 mkdir -pv $TICKETDIR;
fi 

# Check and Repair MySQL Databases
if ! screen -list | grep -q "$SCREENID"; 
then

 echo ".....Running Checks and Repairs on MYISAM Tables"
 nice -19 find /var/lib/mysql/ -type f -name '*.MYI' | xargs nice -19 myisamchk -r | tee -a /home/.hd/ticket/$TICKETID/myisamchk.$(date +%b%d-%H.%M).log

 echo ".....Running Checks and Repairs on InnoDB Tables"
 nice -19 mysqlcheck -A --auto-repair | tee -a /home/.hd/ticket/$TICKETID/mysqlchk.$(date +%b%d-%H.%M).log
 echo "Checks and Repairs Completed! Please check logs for more details."

else 

 echo "No Screen Detected! Please run this script in screen. Exiting Program..."
 exit 0
fi
