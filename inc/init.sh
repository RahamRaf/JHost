#!/bin/bash

# Initiation script

echo
echo "INFO: Initiation ..."
echo

# Update packages
sudo apt-get update

# Upgrade the system packages
sudo apt-get -y upgrade

# Installing initial packages
sudo apt-get install bash-completion nano curl wget git python3

# Initialize timezone
sudo timedatectl set-timezone Europe/Amsterdam

# Initialize system language
sudo locale-gen "en_US.UTF-8"

echo
echo "INFO: Initiation Finished."
echo
