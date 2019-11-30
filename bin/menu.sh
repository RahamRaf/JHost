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

  case ${TMPCMD[0]} in
    b )
      if [[ ${TMPCMD[1]} ]]; then
        jlogger "FATAL: -b (runbackup) doesn't accept any arguments."
        exit 0
        break
      else
        source ${SCRIPTPATH}/bin/backup.sh
      fi
      ;;
    h )
      cat ${SCRIPTPATH}/inc/man
      if [[ ${TMPCMD[1]} ]]; then
        jlogger "FATAL: -h (help) doesn't accept any arguments."
        exit 0
        break
      fi
      ;;
    v )
      echo "J-Host Version: 1"
      if [[ ${TMPCMD[1]} ]]; then
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
