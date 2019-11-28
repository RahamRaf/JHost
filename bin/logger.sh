#!/bin/bash

# This script logs the output and print it on screen too
# It's useful for times that you want to have more elements
#   on screen but not in the log file.

# Set log folder path
LOGDIR=/var/log/jhost

# Create log folder if not exists
if [ ! -d $LOGDIR ]; then
        sudo mkdir -p ${LOGDIR}
	      echo "Logs folder '${LOGDIR}' has been created."
fi


#Write log to file and screen function
logger(){
  #logfile:
  LOGFIL=${LOGDIR}"/log_`date +%F`.log"

  echo "[ `date +%T` ] $1" >> $LOGFIL

  #If true print on scree otherwise don't
  if [ $2 = true ]; then
    #trim it for showing on screen
    TMP=${1#INFO: }
    TMP=${TMP#WARNING: }
    TMP=${TMP#FATAL: }
    echo ${TMP}
  fi
}

#set default for print on screen which is true
if [ "$2" ]; then
        ECHOO=false
else
        ECHOO=true
fi


#check if there is msg to log
if [ "$1" ]; then
        logger "$1" $ECHOO
else
        echo "Void string has been sent to be logged!"
fi
