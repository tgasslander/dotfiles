#!/bin/bash

# IP_ADDRESS=$(hostname -i | awk '{print " " $1}')
# IP_ADDRESS=$(hostname -i | awk '{print " " $1}')
# IP_ADDRESS=$(hostname -i | awk '{print " " $1}')
IP_ADDRESS=$(hostname -I | awk '{print " " $1}')

if ip link show wg0 up &>/dev/null; then
    printf "\\UFE0E $IP_ADDRESS"
else
    printf "\\UFE0E $IP_ADDRESS"
fi
