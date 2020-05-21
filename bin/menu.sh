#!/bin/bash

# Main menu

# Read input arguments
IFS='-' read -ra OPTIS <<< "$@"

# Check requested feature (input)
if [ ${#OPTIS[@]} -lt 1 ]; then

  #show man
  cat ${SCRIPTPATH}/inc/man

  #if not options read from input
  read -p "What would you like to do today? (nothing? press ctrl+c) " TMPOPTIS
  IFS='-' read -ra OPTIS <<< "${TMPOPTIS}"

fi


# Set the user input (arguments/options)
OPTNUM=${#OPTIS[@]}
i=0

while [[ ! $OPTNUM -eq 0 ]]
do

  # Break the options into sub-options
  IFS=' ' read -ra TMPOPT <<< "${OPTIS[$i]}"

  case ${TMPOPT[0]} in
    i ) # Initiate host server
      # Ask user input for webserver
      if [[ ! ${TMPOPT[1]} ]]; then
        read -p "Specify the webserver (Nginx/Apache): " TMPWEB
        TMPOPT[1]=${TMPWEB}
      fi

      # Lower case the input
      TMPWEB=`echo ${TMPOPT[1]} | sed -e 's/\(.*\)/\L\1/'`
      # Proceed installing webserver
      sudo ${SCRIPTPATH}/bin/install_webserver.sh ${TMPWEB}
      ;;
    b ) # Backup
      if [[ ${TMPOPT[1]} ]]; then
        # Backup specific host
        source ${SCRIPTPATH}/bin/backup.sh ${TMPOPT[1]}
      else
        # Backup system
        source ${SCRIPTPATH}/bin/backup.sh system
      fi
      ;;
    h ) # Help
      cat ${SCRIPTPATH}/inc/man
      if [[ ${TMPOPT[1]} ]]; then
        jlogger "FATAL: -h (help) doesn't accept any arguments."
        exit 0
        break
      fi
      ;;
    v ) # Version
      echo "J-Host Version: 0.1"
      if [[ ${TMPOPT[1]} ]]; then
        jlogger "FATAL: -h doesn't accept any arguments."
        exit 0
        break
      fi
      ;;
    esac

  #pass from the argument to next one
  let i++
  let OPTNUM--

done
