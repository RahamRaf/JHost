#!/bin/bash

# Backup script for the system or (a) host(s)

# Create backup from a web host (input)
if [ $1 ]; then
	WEBHOST="$1"

	# Server type
	$SRVT=`cat ${ETCDIR}/server`

	if [[ ! ${SRVT} ]]; then
		# Webserver is not available
	  jlogger "FATAL: Can't create backup for host '${WEBHOST}'. Webserver settings '${SRVT}' is not found."
	  exit 0

	fi

	# Host root folder
	$HOSTSET=/var/www/${WEBHOST}

	# Check specific host
	if [ ! -d $HOSTSET ]; then
		# host is not available
	  jlogger "FATAL: Can't find the host folder '${HOSTSET}'."
	  exit 0

	fi

  # Backup folder
	$BCKFOL=${HOSTSET}/backups

	if [ ! -d $BCKFOL ]; then
		# Create backup folder
		sudo mkdir -p $BCKFOL
	  jlogger "INFO: Backup folder for host '${WEBHOST}' is created."

	fi

	# Set backup file name
	BCKFILE="${BCKFOL}/backup.${WEBHOST}.`date +%F`.tgz"

	# Backup webroot
	if [ ! -f ${BCKFILE} ]; then

    jlogger "INFO: Creating host backup '${BCKFILE}'"
  	sudo tar cpzf ${BCKFILE} --directory=${HOSTSET} --exclude=${BCKFOL}

  else
		# Backup file existed. No overwrite
  	jlogger "FATAL: Host backup can't be created. File '${BCKFILE}' is already existed!"
		exit 0

  fi
	
	# ######################################
  # Make backup from database

else # Create system wide backup

  # Backup folder
  if [ ! -d $BKDIR ]; then
    sudo mkdir -p ${BKDIR}
    jlogger "INFO: Backup's folder '${BKDIR}' has been created."
  fi

  # Set backup file name
  BCKFILE="${BKDIR}/backup-full.`cat /etc/hostname`.`date +%F`.tgz"

  # Create backup if the backup file for today doesn't exists
  if [ ! -f ${BCKFILE} ]; then

    jlogger "INFO: Creating system backup '${BCKFILE}'"
  	sudo tar cpzf ${BCKFILE} --directory=/ --exclude=/proc --exclude=/tmp --exclude=/lost+found --exclude=${BKDIR} --exclude=/mnt --exclude=/sys --exclude=/var/spool --exclude='*/sock/*' --exclude='*.sock' /

  else
		# Backup file existed. No overwrite
  	jlogger "FATAL: Backup doesn't created. Backup file '${BCKFILE}' is already existed!"
		exit 0

  fi

fi
