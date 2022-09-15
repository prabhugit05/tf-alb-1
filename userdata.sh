#!/bin/bash
sudo apt-get update
sudo apt-get -y install nginx
sudo ufw allow 'nginx HTTP'
sudo ufw allow 'nginx https'
sudo ufw allow 'nginx full'
sudo chown -R ubuntu:ubuntu /var/www/html
sudo chmod -R 755 /var/www
echo 'Cisco SPL' >> /var/www/html/index.html
sudo systemctl start nginx
sudo systemctl enable nginx
