#!/bin/bash

# Initiation script

echo
jlogger "INFO: Initiation ..."
echo

# Initialize application folders
# Settings folder Initiation
if [ ! -d $ETCDIR ]; then
        sudo mkdir -p ${ETCDIR}
	      jlogger "INFO: Settings folder '${ETCDIR}' has been created."
fi

# Update packages
sudo apt-get update
jlogger "INFO: System package lists updated."


# Upgrade the system packages
sudo apt-get -y upgrade
jlogger "INFO: System packages upgraded."

# Installing initial packages
sudo apt-get install bash-completion nano curl wget git python3

# Initialize timezone
sudo timedatectl set-timezone Europe/Amsterdam

# Initialize system language
sudo locale-gen "en_US.UTF-8"

# Register the application to be used system wide
sudo ln -s ${SCRIPTPATH}/jhost.sh /usr/bin/jhost

echo
jlogger "INFO: Initiation Finished."
echo
