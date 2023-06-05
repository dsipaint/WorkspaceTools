#!/bin/bash

sudo apt-get install gnupg

curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
	   sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
	      --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

sudo wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb

sudo apt-get update

sudo apt-get install -y mongodb-org
