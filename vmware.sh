#!/bin/bash

# Get VMWare versionnumber
vmware_version=$(vmware -v)

version_number=$(echo "$vmware_version" | grep -oP '(?<=Workstation\s)\d+(\.\d+)*(?=\sbuild)')

# Clone git repo mkubeck
git clone https://github.com/mkubecek/vmware-host-modules.git

cd vmware-host-modules

git checkout workstation-$version_number

# Build and install modules
make

sudo make install

sudo /etc/init.d/vmware start

# Thanks for using this script by r03n
