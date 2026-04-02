#!/bin/bash
set -e

mkdir -p /home/user/workshop
echo "Welcome to the Container Terminal lab!" > /home/user/workshop/README.md
echo "Container ID: $(hostname)" >> /home/user/workshop/README.md

apt-get update -y
apt-get install -y tree

touch /root/secret.txt
echo "This is a secret file - do not delete!" > /root/secret.txt

echo "Setup complete"