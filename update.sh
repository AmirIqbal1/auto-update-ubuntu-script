#!/bin/bash
dpkg --configure -a
apt update -y
apt upgrade -y
apt install -f
apt clean
apt autoclean
apt autoremove -y

echo "cleaning bash"
rm .bash_history
