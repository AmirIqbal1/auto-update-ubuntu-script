# auto-update-ubuntu-script
This script auto updates Ubuntu 18.04 packages (hasn't been tested with 20.04 yet).

Run as root!

# chmod +x update.sh

# ./update.sh

This script will auto reconfigure dpkg if anything is wrong with it, update, upgrade and 
perform an "install -f" as well as, autoclean and autoremove any packages & downloaded files/ dependencies it doesn't need. 

It will also clean bash history. 

Great script for Ubuntu servers.
