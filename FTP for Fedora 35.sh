#!/bin/bash
#install web server on fedore (apache2)

sudo dnf -y install httpd
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload
sudo systemctl start httpd
sudo systemctl enable httpd
#sudo systemctl status httpd
#To check Ip Address
#hostname -I | awk '{print $1}'
#To check apache
#http://local.server.ip
#firefox $echo $(hostname -I | awk '{print $1}')

#to stop apache
#sudo systemctl stop httpd

#now install php


sudo dnf install php
php -v

#if generate any error uncomment next line
#cd

cd /usr/share/httpd/noindex/

#sudo nano index.php 

echo '<?php phpinfo(); ?>' > index.php
sudo nano /etc/httpd/conf.d/welcome.conf
#change index.html to index.php

systemctl restart httpd.service
firefox $echo $(hostname -I | awk '{print $1}')

#install mysql on fedora

sudo dnf install https://repo.mysql.com//mysql80-community-release-fc35-1.noarch.rpm
sudo dnf install mysql-community-server

sudo systemctl restart mysqld.service
sudo systemctl enable mysqld.service

sudo grep -i " password" /var/log/mysqld.log

echo "The password is written at end of the above command"
mysql -u root -p

#to change password
#inside mysql type
#ALTER USER 'root'@'localhost' IDENTIFIED BY'{your new password}'

