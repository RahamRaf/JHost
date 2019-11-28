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

# Include require libraries
LOGGER=${SCRIPTPATH}/bin/logger.sh

# Run Initiation script
source ${SCRIPTPATH}/bin/init.sh
