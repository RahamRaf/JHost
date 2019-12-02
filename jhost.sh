#!/bin/bash

# Main script for the JHost application

clear

# Show fancy title for terminal users
echo "-----------------------------------------------------------------"
echo "-----------------------      J-Host      ------------------------"
echo "-----------------------------------------------------------------"
echo

# Set env vars
# Log directory
LOGDIR=/var/log/jhost
# Settings directory
ETCDIR=/etc/jhost

# Get system vars/Info
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Include require libraries
source ${SCRIPTPATH}/bin/logger.sh

# Run Initiation script
source ${SCRIPTPATH}/bin/init.sh

# Menu & Options
source ${SCRIPTPATH}/bin/menu.sh
