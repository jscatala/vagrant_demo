#!/usr/bin/env bash

echo "Updating machine and installing Apache2"
apt-get update
apt-get install -y apache2

echo "sync directories"
rm -rf /var/www/html
ln -fs /vagrant /var/www/html

