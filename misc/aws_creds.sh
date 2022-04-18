#!/bin/bash
#script to make setting aws creds easier

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
