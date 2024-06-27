#!/bin/bash

# Function to print messages
print_msg() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Start of the script
print_msg "Starting system update..."

# Reconfigure dpkg
print_msg "Reconfiguring dpkg..."
dpkg --configure -a
if [ $? -ne 0 ]; then
  print_msg "dpkg reconfiguration failed."
  exit 1
fi

# Update package lists
print_msg "Updating package lists..."
apt update
if [ $? -ne 0 ]; then
  print_msg "apt update failed."
  exit 1
fi

# Upgrade packages
print_msg "Upgrading packages..."
apt upgrade -y
if [ $? -ne 0 ]; then
  print_msg "apt upgrade failed."
  exit 1
fi

# Uncomment the following lines to update Flatpak packages
# print_msg "Updating Flatpak packages..."
# flatpak update -y
# if [ $? -ne 0 ]; then
#   print_msg "Flatpak update failed."
#   exit 1
# fi

# Fix broken dependencies
print_msg "Fixing broken dependencies..."
apt install -f
if [ $? -ne 0 ]; then
  print_msg "Fixing broken dependencies failed."
  exit 1
fi

# Clean up
print_msg "Cleaning up unnecessary packages and files..."
apt clean
apt autoclean
apt autoremove -y
if [ $? -ne 0 ]; then
  print_msg "Clean up failed."
  exit 1
fi

# Auto reboot if needed
if [ -f /var/run/reboot-required ]; then
  print_msg "Reboot required. Rebooting now..."
  reboot
else
  print_msg "System update completed successfully. No reboot required."
fi

# End of the script
print_msg "Script finished."
