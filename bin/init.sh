#!/bin/bash

# Initiation script

echo
$LOGGER "INFO: Initiation ..." no
echo

# Update packages
sudo apt-get update
$LOGGER "INFO: Package lists updated."


# Upgrade the system packages
sudo apt-get -y upgrade
$LOGGER "INFO: Packages upgraded."

# Installing initial packages
sudo apt-get install bash-completion nano curl wget git python3

# Initialize timezone
sudo timedatectl set-timezone Europe/Amsterdam

# Initialize system language
sudo locale-gen "en_US.UTF-8"

echo
$LOGGER "INFO: Initiation Finished." no
echo
