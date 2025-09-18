#!/bin/bash

VM=$(hostname)
HOST_COUNT=$(awk '/192/ {print $2}' /etc/hosts | wc -l)

echo "###ESTABLISH SSH CONNECTION FROM: $VM ###"
echo
for ((i=1; i<=$HOST_COUNT; i++)); do
    HOSTS=$(awk '/192/ {print $2}' /etc/hosts | awk -v n="$i" 'NR==n') 
    echo
    echo "Connecting to: $HOSTS"
    echo
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -q 
    echo
    ssh-copy-id devops@$HOSTS
    ssh devops@$HOSTS "sudo yum install vim git wget zip unzip httpd -y"
    echo

    echo "####INSTALL COMPLETED#####"
    sleep 2
    ssh devops@$HOSTS "sudo systemctl start httpd"
    ssh devops@$HOSTS "sudo systemctl enable httpd"
    sleep 2
    echo

    ssh devops@$HOSTS "sudo systemctl is-active httpd"
    sleep 2
    echo

    ssh devops@$HOSTS "sudo systemctl is-enabled httpd"
    sleep 2
    echo
    echo "#####CONNECTION ESTABLISHED FOR $HOSTS"

    
done    
