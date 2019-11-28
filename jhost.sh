#!/bin/bash

# Main script for the JHost application

clear

# Show fancy title for terminal users
echo "-----------------------------------------------------------------"
echo "-----------------------      J-Host      ------------------------"
echo "-----------------------------------------------------------------"
echo

# Set env vars
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
LOGDIR=/var/log/jhost

# Include require libraries
source ${SCRIPTPATH}/bin/logger.sh

# Run Initiation script
source ${SCRIPTPATH}/bin/init.sh
