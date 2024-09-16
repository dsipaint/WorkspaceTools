#!/bin/bash

#create/destroy test box
function testbox()
{
    SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    BACK_DIR=$(pwd)


    for i in "$@"; do
        case $i in
            -c|--create)
            #TODO what to do if we create
            cd $SCRIPT_DIR
            terraform init
            terraform apply
            cd $BACK_DIR
            ;;
            -d|--destroy)
            instance_id=$(aws ec2 describe-instances --filters 'Name=tag:Name, Values=testbox' 'Name=instance-state-name, Values=pending,running' | jq -r .Reservations[0].Instances[0].InstanceId)
            aws ec2 terminate-instances --instance-ids=$instance_id
            ;;
            -l|--login)
            box_ip=$(aws ec2 describe-instances --filters 'Name=tag:Name, Values=testbox' 'Name=instance-state-name, Values=pending,running' | jq -r .Reservations[0].Instances[0].PublicIpAddress)
            ssh -i ~/access\ keys/bot-server-ssh-keypair.pem ubuntu@$box_ip
            ;;
            -i|--identify)
            box_ip=$(aws ec2 describe-instances --filters 'Name=tag:Name, Values=testbox' 'Name=instance-state-name, Values=pending,running' | jq -r .Reservations[0].Instances[0].PublicIpAddress)
            echo Box IP is $box_ip
            ;;
        esac
    done
}