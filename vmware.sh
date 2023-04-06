#!/bin/bash
# This script is created with the information found at 
# https://github.com/mkubecek/vmware-host-modules
# Created by Michal Kubeček 
 
# Get VMWare versionnumber
vmware_version=$(vmware -v)
version_number=$(echo "$vmware_version" | grep -oE '[[:digit:]]+.[[:digit:]]+.[[:digit:]]+'| head -n1)

# Clone git repo mkubeck
git clone https://github.com/mkubecek/vmware-host-modules.git

cd vmware-host-modules

git checkout workstation-$version_number

# Build and install modules
make

sudo make install

sudo /etc/init.d/vmware start

# Thanks for using this script created by r03n
