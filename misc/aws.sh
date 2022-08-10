#!/bin/bash

#script to make setting aws creds easier
function aws_creds()
{
    echo AWS Access Key ID:
    read ACCESS_KEY

    echo AWS Secret Access Key:
    read -s SECRET_KEY

    echo AWS region:

    read REGION

    export AWS_ACCESS_KEY_ID=$ACCESS_KEY
    export AWS_SECRET_ACCESS_KEY=$SECRET_KEY
    export AWS_DEFAULT_REGION=$REGION

    echo AWS credentials set!   
}

# this script will allow password authentication on an AWS EC2 instance, in case you either want
# to use a password or want to use the VSC ssh editor on the EC2 instance
function aws_ssh_pass()
{
    sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    sudo passwd ubuntu
    sudo service sshd restart
    echo "You can now login as \"ubuntu\" using the password you set on this machine"
}
