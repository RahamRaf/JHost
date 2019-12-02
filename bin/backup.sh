#!/bin/bash

# Backup script for the system or hosts

# Create backup from a web host (input)
if [ $1 ]; then
	WEBHOST="$1"
  # ###############################
  # Make backup in website folder e.g. /var/www/site.com/backup
  # Make backup from webroot
  # Make backup from database

else # Create system wide backup

  # Backup folder
  if [ ! -d $BKDIR ]; then
          sudo mkdir -p ${BKDIR}
  	      jlogger "INFO: Backup's folder '${BKDIR}' has been created."
  fi

  # Set backup file name
  BCKFILE="${BKDIR}/backup.`cat /etc/hostname`.`date +%F`.tgz"

  # Create backup if the backup file for today doesn't exists
  if [ ! -f ${BCKFILE} ]; then

    jlogger "INFO: Creating system backup '${BCKFILE}'"
  	sudo tar cpzf ${BCKFILE} --directory=/ --exclude=/proc --exclude=/tmp --exclude=/lost+found --exclude=${BKDIR} --exclude=/mnt --exclude=/sys --exclude=/var/spool --exclude='*/sock/*' --exclude='*.sock' /

  else
  	jlogger "FATAL: Backup doesn't created. Backup file '${BCKFILE}' is already existed!"
  fi

fi
