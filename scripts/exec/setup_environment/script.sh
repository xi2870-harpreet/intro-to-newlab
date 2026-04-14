#!/bin/bash
#set -e

mkdir -p /home/user/workshop
echo "Welcome to the Container Terminal lab!" > /home/user/workshop/README.md
echo "Container ID: $(hostname)" >> /home/user/workshop/README.md

apt-get update -y
apt-get install -y tree curl

touch /root/secret.txt
echo "This is a secret file - do not delete!" > /root/secret.txt

#echo "Setup complete"

echo "Installing Docker..."

apt-get update -y
apt-get install -y docker.io

echo "Starting Docker..."
dockerd > /var/log/docker.log 2>&1 &

# Wait for Docker to be ready
for i in {1..10}; do
  docker info && break
  sleep 2
done

echo "Running NGINX container..."
docker run -d -p 80:80 --name nginx nginx

echo "Setup complete"
