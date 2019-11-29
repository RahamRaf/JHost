#!/bin/bash

# Initiation script

echo
jlogger "INFO: Initiation ..."
echo

# Update packages
sudo apt-get update
jlogger "INFO: Package lists updated."


# Upgrade the system packages
sudo apt-get -y upgrade
jlogger "INFO: Packages upgraded."

# Installing initial packages
sudo apt-get install bash-completion nano curl wget git python3

# Initialize timezone
sudo timedatectl set-timezone Europe/Amsterdam

# Initialize system language
sudo locale-gen "en_US.UTF-8"


echo
jlogger "INFO: Initiation Finished."
echo
