#!/bin/bash

# Installing system-wide webserver based on user input


# Install system packages based on requeted webserver
if [[ "$1" -eq "nginx" ]] || [[ "$1" -eq "n" ]]; then
  # Install system based on Nginx webserver
  # Nginx
  jlogger "INFO: Installing Nginx"
  sudo apt-get install nginx

  # Certbot for SSL Certificates
  jlogger "INFO: Installing Certbot"
  sudo apt-get install certbot python-certbot-nginx

elif [[ "$1" -eq "apache" ]] || [[ "$1" -eq "a" ]]; then
  # Install system based on Apache webserver
  # Apache
  jlogger "INFO: Installing Apache2"
  sudo apt-get install apache2 libapache2-mod-php

  # Certbot for SSL Certificates
  jlogger "INFO: Installing Certbot"
  sudo apt-get install certbot python-certbot-apache

else
  # Unsupported input
  jlogger "FATAL: Unsupported webserver ($1)"
  exit 0

fi

# MariaDB
jlogger "INFO: Installing MariaDB"
sudo apt-get install mariadb-server mariadb-client mariadb-common

# PHP
jlogger "INFO: Installing PHP"
sudo apt-get install php-common php-fpm php-gd php-mysql php-memcached php-memcache php-mbstring php-mail php-imagick php-uuid

# Webserver installation is finished.
echo
jlogger "INFO: Webserver installation is finished."
echo
exit 1
