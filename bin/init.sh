#!/bin/bash

# Initiation script

echo
logger "INFO: Initiation ..."
echo

# Update packages
sudo apt-get update
logger "INFO: Package lists updated."


# Upgrade the system packages
sudo apt-get -y upgrade
logger "INFO: Packages upgraded."

# Installing initial packages
sudo apt-get install bash-completion nano curl wget git python3

# Initialize timezone
sudo timedatectl set-timezone Europe/Amsterdam

# Initialize system language
sudo locale-gen "en_US.UTF-8"


echo
logger "INFO: Initiation Finished."
echo
