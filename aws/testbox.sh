#!/bin/bash

#create/destroy test box
function testbox()
{
    SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    BACK_DIR=$(pwd)

    #states include pending, running, stopping, stopped, shutting-down, terminated
    box_info=$(aws ec2 describe-instances --filters 'Name=tag:Name, Values=testbox' 'Name=instance-state-name, Values=pending,running,stopping,stopped')


    for i in "$@"; do
        case $i in
            -c|--create)
            box_state=$(echo $box_info | jq -r .Reservations[0].Instances[0].State.Name)
            
            if [ $box_state == null ]; then # if there is no box, create one
                cd $SCRIPT_DIR
                terraform init
                terraform apply
                cd $BACK_DIR

                # fetch the IP and update the file
                bash $SCRIPT_DIR/updatessh.sh
            elif [ $box_state == "stopped" ]; then # if there is a stopped box, turn it on
                testbox -t
            else
                testbox -l # if there is a live box, log into it
            fi
            ;;
            -d|--destroy)
            instance_id=$(echo $box_info | jq -r .Reservations[0].Instances[0].InstanceId)
            aws ec2 terminate-instances --instance-ids=$instance_id
            ;;
            -l|--login)
            box_ip=$(echo $box_info | jq -r .Reservations[0].Instances[0].PublicIpAddress)
            ssh -i ~/access\ keys/bot-server-ssh-keypair.pem ubuntu@$box_ip
            ;;
            -i|--identify)
            box_ip=$(echo $box_info | jq -r .Reservations[0].Instances[0].PublicIpAddress)
            echo Box IP is $box_ip
            box_status=$(echo $box_info | jq -r .Reservations[0].Instances[0].State.Name)
            echo Box status is $box_status
            ;;
            -t|--toggle)
            instance_state=$(echo $box_info | jq -r .Reservations[0].Instances[0].State.Name)
            instance_id=$(echo $box_info | jq -r .Reservations[0].Instances[0].InstanceId)
            if [ $instance_state == "running" ] || [ $instance_state == "pending" ]; then
                aws ec2 stop-instances --instance-ids=$instance_id
                echo stopped testbox
            else
                aws ec2 start-instances --instance-ids=$instance_id
                bash $SCRIPT_DIR/updatessh.sh
                echo started testbox
            fi
            ;;
        esac
    done
}