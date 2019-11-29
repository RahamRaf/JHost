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
