#!/bin/bash
#add fix to exercise5-server1 here
sudo apt-get install -y sshpass
sed -i "2i192.168.100.11  server2" /etc/hosts
sed -i "3i192.168.100.10  server1" /etc/hosts
echo "Host *
    StrictHostKeyChecking no" > /home/vagrant/.ssh/config
mkdir ~/.ssh
echo "Host *
   StrictHostKeyChecking no" > ~/.ssh/config
ssh-keygen -q -t rsa -N '' -f /home/vagrant/.ssh/id_rsa
cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant /home/vagrant/.ssh/id_rsa /home/vagrant/.ssh/id_rsa.pub
chgrp vagrant /home/vagrant/.ssh/id_rsa /home/vagrant/.ssh/id_rsa.pub
	while ! sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@server2
do
    echo "Trying again..."
done &


