#!/bin/bash

sudo apt update
sudo apt install apache2 -y
sudo apt install php -y
sudo apt-get install php-mysqli -y
sudo apt install mysql-client -y

# Enable rewrite 
sudo a2enmod rewrite

# Enable module
sudo sed -i 's/;extension=mysqli/extension=mysqli/' /etc/php/8.1/apache2/php.ini
sudo sed -i 's/;extension=mbstring/extension=mbstring/' /etc/php/8.1/apache2/php.ini


sudo systemctl restart apache2.service 