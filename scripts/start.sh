#!/bin/bash
set -euo pipefail  # Exit on error, catch unset variables — recommended

echo "Running environment setup..."

# Example: Create some files/directories the learner will use
mkdir -p /home/user/workshop
echo "Welcome to the Container Terminal lab!" > /home/user/workshop/README.md
echo "Container ID: $(hostname)" >> /home/user/workshop/README.md

# Example: Install a small tool if needed (Ubuntu image usually has apt)
apt-get update -qq
apt-get install -y tree  # or curl, jq, whatever your lab needs

# Example: Create a test file for the learner to find/modify
touch /root/secret.txt
echo "This is a secret file - do not delete!" > /root/secret.txt

echo "Setup complete - lab environment is ready."
exit 0