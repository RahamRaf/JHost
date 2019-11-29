#!/bin/bash

# This script logs the output and print it on screen too
# It's useful for times that you want to have more elements
#   on screen but not in the log file.

# Log folder Initiation
if [ ! -d $LOGDIR ]; then
        sudo mkdir -p ${LOGDIR}
	      echo "Logs folder '${LOGDIR}' has been created."
fi

#Write log to file and screen function
jlogger(){

  #check if there is msg to log
  if [ ! "$1" ]; then
      echo
  else
      #logfile:
      LOGFIL=${LOGDIR}"/log_`date +%F`.log"

      echo "[ `date +%T` ] $1" >> $LOGFIL

      # Don't print into the screen if the second var is set
      if [ ! "$2" ]; then
        #trim it for showing on screen
        TMP=${1#INFO: }
        TMP=${TMP#WARNING: }
        TMP=${TMP#FATAL: }
        echo ${TMP}
      fi

    fi
}
