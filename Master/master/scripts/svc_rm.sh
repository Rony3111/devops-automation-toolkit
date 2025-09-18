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
    ssh devops@$HOSTS yum remove vim git wget zip unzip httpd -y
    echo

    echo "####INSTALL COMPLETED#####"
    sleep 5
    systemctl start httpd
    systemctl enable httpd
    sleep 5
    echo

    echo "###Checking services#######"
    echo
    systemctl is-active httpd
    systemctl is-enabled httpd
    echo
    date
done
