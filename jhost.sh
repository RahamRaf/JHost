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

# Run Initiation script
source ${SCRIPTPATH}/inc/init.sh
