#!/bin/bash
# Author: m33k
# Date: 3-17-2017 -- Friday Night Scripting
# Description: A small function that checks and repairs necessary MySQL Databases on a cPanel Server
# Version: 0.1

# Start of Script

# Variable Declarations:
WORKDIR=/home/.hd/ticket/
TICKETDIR=/home/.hd/ticket/$TICKETID
# Ask User for Ticket ID
read "Please enter ticket id: " TICKETID

# Checking and Creating Directories
if [ ! -d "$WORKDIR" ]; then
 echo "....creating HD working directory"
 mkdir -pv $WORKDIR;
 chmod 600 $WORKDIR;
fi

if [ ! -d "$TICKETDIR" ]; then
 mkdir -pv $TICKETDIR;
fi 

# Check and Repair MySQL Databases
# 
