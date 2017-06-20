#!/bin/bash
# Author: m33k
# Date: 6-16-2017 -- Friday Night Scripting
# Description: Script installs Exim and Dovecot on CentOS7
# Version: 0.1


# Variable Declaration
BACKUPDIR="/home/.backup/original"

#read -p "Please enter ticket number" $FQDN

# EPEL Repo Added and OS Update

yum install epel-release -y

yum update -y


yum install file perl-Mail-SPF.noarch openssl

# Checking and Creating Directories

if [ ! -d "$BACKUPDIR" ]; then
 echo "....creating backup directory"
 mkdir -pv $BACKUPDIR;
 chmod 600 $BACKUPDIR;
fi

# SSL Cert
#
mkdir /root/SSL/"$FQDN" -p
#cd /root/SSL/"$FQDN"
#openssl req -nodes -x509 -newkey rsa:2048 -keyout "$FQDN".key -out "$FQDN".crt -days 365
#

yum install exim -y

cp -prv /etc/exim "$BACKUPDIR"

yum install dovecot -y

cp -prv /etc/dovecot "$BACKUPDIR"

echo "You may now configure Exim and Install SSL Certificates"

