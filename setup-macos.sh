#!/bin/bash
# script to bootstrap setting up a mac with ansible 

echo "===================================================="
echo "Setting up your mac using chaudhryjunaid/setup-macos"
echo "This scrips installs pre-requisites and runs ansible"
echo "====================================================\n"

if ! xcode-select -p >/dev/null; then
    echo "Installing XCode Command-line Tools..."
	xcode-select --install
	read -p "Press [Enter] when Command-line Tools have been installed..."
else
    echo "✓ XCode Command-line Tools are already installed"
fi

if ! xcode-select -p >/dev/null; then
    echo "Command-line Tools could not be installed. Please try running this script again!"
fi

if ! hash brew 2>/dev/null; then
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "✓ Homebrew is already installed"
fi

if ! hash brew 2>/dev/null; then
    echo "Homebrew could not be installed. Please try running this script again!"
fi

if ! hash ansible 2>/dev/null; then
    echo "Installing ansible..."
    brew install ansible
else
    echo "✓ Ansible is already installed"
fi

if ! hash ansible 2>/dev/null; then
    echo "Ansible could not be installed. Please try running this script again!"
fi

installdir=~/macos-setup
echo "Checking $installdir..."

if [ ! -d "$installdir" ]; then
    echo "Creating $installdir..."
    mkdir -p $installdir
fi

if [ -z $(ls -A -- "$installdir") ]; then
    echo "Cloning setup repo into $installdir"
    git clone https://github.com/chaudhryjunaid/setup-macos.git $installdir
else if [ ! -d "$installdir/.git" ]; then
    echo "Error: $installdir already contains some other files. Please empty this directory and try again!"
    exit 1
else if [ ! -f "${installdir}/macos-setup.yml"]; then
    echo "Failed to find setup-macos (probably git clone failed or directory already contained something else)."
    exit 1
else
    echo "Existing setup repo found. Updating sources..."
    git pull
    echo "✓ Playbook exists and has been updated"
fi

echo "Starting playbook..."
cd $installdir 
#time ansible-playbook macos-setup.yml --verbose
echo "Ansible finished. See  logs for status."

exit 0
