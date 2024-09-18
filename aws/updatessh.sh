#!/bin/bash

box_ip=$(aws ec2 describe-instances --filters 'Name=tag:Name, Values=testbox' 'Name=instance-state-name, Values=pending,running,stopping,stopped' | jq -r .Reservations[0].Instances[0].PublicIpAddress)

while [ $box_ip == null ]
do
    sleep 5
    box_ip=$(aws ec2 describe-instances --filters 'Name=tag:Name, Values=testbox' 'Name=instance-state-name, Values=pending,running,stopping,stopped' | jq -r .Reservations[0].Instances[0].PublicIpAddress)
done

old_ip=$(grep -A 3 --color=never "Host testbox" /mnt/c/users/finla/.ssh/config | grep --color=never -P -o '(\d{1,3}\.){3}\d{1,3}')
sed -i "s/${old_ip}/${box_ip}/g" /mnt/c/Users/finla/.ssh/config