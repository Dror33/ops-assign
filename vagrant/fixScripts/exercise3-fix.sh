#!/bin/bash
#add fix to exercise3 here
sudo sed -i '/deny from all/c \allow from all' /etc/apache2/sites-enabled/000-default
sudo sed -i '/AllowOverride None/c \AllowOverride All' /etc/apache2/sites-enabled/000-default
sudo service apache2 restart