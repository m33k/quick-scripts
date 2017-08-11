#!/bin/bash
# Date: 2017-08-11
# Description: Install VirtualBox 5.1

curl -o /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

yum update -y && yum install epel-release -y

yum install binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-PAE-devel dkms -y

yum install VirtualBox-5.1 -y

/usr/lib/virtualbox/vboxdrv.sh setup

usermod -a -G vboxusers root
