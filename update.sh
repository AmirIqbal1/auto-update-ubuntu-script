#!/bin/bash
dpkg --configure -a &&
apt update &&
apt upgrade -y &&
apt install -f &&
apt clean &&
apt autoclean &&
apt autoremove -y &&

#remove bottom lines for auto reboot is needed 
#if [ -f /var/run/reboot-required ]; then
#  reboot
#fi
