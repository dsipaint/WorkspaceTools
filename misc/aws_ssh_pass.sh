#!/bin/bash

# this script will allow password authentication on an AWS EC2 instance, in case you either want
# to use a password or want to use the VSC ssh editor on the EC2 instance

sudo sed 's/PasswordAuthentication: no/PasswordAuthentication: yes' /etc/ssh/sshd_config
sudo passwd ubuntu
sudo service sshd restart
echo You can now login as ubuntu using the password you set on this machine
