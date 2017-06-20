#!/bin/bash
# Author: m33k
# Date: 6-20-2017 -- Tuesday Afternoon Scripting
# Description: Script checks if the IP has an active CloudLinux or Kernel care license.
# Version: 0.1


# Variable Declaration


read -p "Please enter IP Address: " IP

curl -s https://cln.cloudlinux.com/clweb/public/license-lookup.xhtml?ip="$IP" | grep "License for IP:" | sed 's/\<strong>//g' | sed 's/<//g' | tr -d '/'
# ORIG - curl -s https://cln.cloudlinux.com/clweb/public/license-lookup.xhtml?ip=162.213.255.27 | grep "License for IP:" | sed 's/\<strong>//g' | sed 's/<//g' | tr -d '/'
