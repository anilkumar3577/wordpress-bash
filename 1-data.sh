#!/bin/bash

# Check if docker-compose is installed
if ! [ -x "$(command -v docker-compose)" ]; then
  # Install docker-compose if not present
  echo "Installing Docker Compose..."
  sudo yum -y update
  sudo yum -y install docker
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo chmod 666 /var/run/docker.sock
  sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

# Check if site name argument was provided
if [ -z "$1" ]; then
  echo "Please provide a site name as an argument."
  exit 1
fi
# Entry in /etc/hosts
site_name="$1"
echo "127.0.0.1:8000 $site_name" >> /etc/hosts

