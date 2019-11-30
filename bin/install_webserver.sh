#!/bin/bash

# Installing system-wide webserver based on user input


# Install system packages based on requeted webserver
if [[ "$1" -eq "nginx" ]] || [[ "$1" -eq "n" ]]; then
  # Install system based on Nginx webserver

elif [[ "$1" -eq "apache" ]] || [[ "$1" -eq "a" ]]; then
  # Install system based on Apache webserver

else
  # Unsupported input
  jlogger "FATAL: Unsupported webserver ($1)"
  exit 0
fi
