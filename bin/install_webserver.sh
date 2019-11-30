#!/bin/bash

# Installing system-wide webserver based on user input


# Install system packages based on requeted webserver
if [[ "$1" -eq "nginx" ]] || [[ "$1" -eq "n" ]]; then
  # Install system based on Nginx webserver
  # Nginx
  sudo apt-get install nginx

  # Certbot for SSL Certificates
  sudo apt-get install certbot python-certbot-nginx

elif [[ "$1" -eq "apache" ]] || [[ "$1" -eq "a" ]]; then
  # Install system based on Apache webserver
  # Apache
  sudo apt-get install apache2 libapache2-mod-php

  # Certbot for SSL Certificates
  sudo apt-get install certbot python-certbot-apache

else
  # Unsupported input
  jlogger "FATAL: Unsupported webserver ($1)"
  exit 0

fi

# MariaDB
sudo apt-get install mariadb-server mariadb-client mariadb-common

# PHP
sudo apt-get install php-common php-fpm php-gd php-mysql php-memcached php-memcache php-mbstring php-mail php-imagick php-uuid
