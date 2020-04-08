#!/bin/bash
dpkg --configure -a
apt-get update -y
apt-get upgrade -y
apt-get install -f
apt-get clean
apt-get autoclean
apt-get autoremove -y

echo "cleaning bash"
rm .bash_history
