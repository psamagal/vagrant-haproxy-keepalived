#!/usr/bin/env bash

yum install -y epel-release
yum install -y telnet ansible net-tools unzip

sudo -u vagrant cp /vagrant/.ssh/* /home/vagrant/.ssh/

sudo -u vagrant cat /vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

sudo -u vagrant echo "export ANSIBLE_HOST_KEY_CHECKING=False" >> /home/vagrant/.bashrc