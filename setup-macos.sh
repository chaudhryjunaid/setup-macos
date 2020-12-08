#!/bin/bash
# script to bootstrap setting up a mac with ansible 

echo "===================================================="
echo "Setting up your mac using chaudhryjunaid/setup-macos"
echo "This scrips installs pre-requisites and runs ansible"
echo "===================================================="

# Check if console tools installed
if ! xcode-select -p >/dev/null; then
	xcode-select --install
	read -p "Press [Enter] when install finished..."
fi

if ! xcode-select -p >/dev/null; then
    echo "Command-line tools could not be installed. Please try running this script again!"
fi

if ! hash ansible 2>/dev/null; then
    brew install ansible
fi

if ! hash ansible 2>/dev/null; then
    echo "Ansible could not be installed. Please try running this script again!"
fi

installdir=~/tmp/setup-macos
if [ ! -d $installdir ]; then
    mkdir -p $installdir
    git clone https://github.com/chaudhryjunaid/setup-macos.git $installdir
fi

if [ ! -d "${installdir}/.git" ]; then
    echo "Failed to find setup-macos (git clone failed)."
    exit 1
fi

cd $installdir 
ansible-playbook -K -i ./hosts macos-setup.yml --verbose

echo "MacOS setup is now complete! Enjoy!"

exit 0
