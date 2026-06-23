#!/bin/bash

OUTPUT_FILE="network_info"

echo "===== Network Interfaces =====" > $OUTPUT_FILE
ip link show >> $OUTPUT_FILE

echo -e "\n===== IP Addresses =====" >> $OUTPUT_FILE
ip addr show >> $OUTPUT_FILE

echo -e "\n===== Default Gateway =====" >> $OUTPUT_FILE
ip route | grep default >> $OUTPUT_FILE

echo -e "\n===== DNS Servers =====" >> $OUTPUT_FILE
cat /etc/resolv.conf | grep nameserver >> $OUTPUT_FILE

echo "Information saved in $OUTPUT_FILE"