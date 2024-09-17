#!/bin/bash

box_ip=$(aws ec2 describe-instances --filters 'Name=tag:Name, Values=testbox' 'Name=instance-state-name, Values=pending,running,stopping,stopped' | jq -r .Reservations[0].Instances[0].PublicIpAddress)

while [ $box_ip == null ]
do
    sleep 5
    box_ip=$(aws ec2 describe-instances --filters 'Name=tag:Name, Values=testbox' 'Name=instance-state-name, Values=pending,running,stopping,stopped' | jq -r .Reservations[0].Instances[0].PublicIpAddress)
done

sed -i -z "s/Host testbox\n  HostName.*\n  User alspal/Host testbox\n  HostName ${box_ip}\n  User alspal/g" /mnt/c/Users/finla/.ssh/config