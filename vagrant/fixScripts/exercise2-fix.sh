#!/bin/bash
#add fix to exercise2 here
#to include in pull request
sudo apt-get install -y curl
sudo sed -i '/127.0.0.1/d' /etc/hosts
