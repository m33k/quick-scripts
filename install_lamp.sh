#!/bin/bash
# Author: m33k
# Date: 4-16-2017 -- Sunday Night Scripting
# Description: A small script that installs a lamp stack: (httpd 2.4.x) (mariadb-5.5.x) (php 5.4.x)
# Version: 0.1


# Updating OS
yum update -y

# Installing httpd
yum install httpd -y && systemctl start httpd

# Installing MariaDB
yum install mariadb-server mariadb -y && systemctl start mariadb

# Securing MariaDB (How can I automate this section?)
# mysql_secure_installation

# Installing PHP
yum install php php-mysql -y && systemctl restart httpd

# Check to make sure all services are running and enabled.

# Add TCP port 80 to firewall
firewall-cmd --zone=public --add-service=http --permanent
