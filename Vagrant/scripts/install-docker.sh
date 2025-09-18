#!/bin/bash

echo "#################################"
echo
echo " Update system packages"
sudo yum update -y > /dev/null
echo
echo " Install required dependencies "
sudo yum install -y yum-utils device-mapper-persistent-data lvm2 > /dev/null
echo
echo " Add Docker CE repository "
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo > /dev/null
echo
echo " Install Docker CE "
sudo yum install -y docker-ce docker-ce-cli containerd.io > /dev/null
echo
echo " Start and enable Docker service "
sudo systemctl start docker
sudo systemctl enable docker
echo
echo "Docker service check"
echo
sudo systemctl is-active docker
echo
sudo systemctl is-enabled docker
echo
echo "Adding Vagrant user to devops group"
sudo usermod -aG docker vagrant
echo
sudo getent group docker
echo
date
echo
echo "###############################"
echo "Configuration is done here. you can ssh now"

