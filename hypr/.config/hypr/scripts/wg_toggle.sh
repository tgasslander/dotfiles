#!/bin/bash

notify-send "Toggling WireGuard VPN..."

if ip link show wg0 up &>/dev/null; then
    # Tear down the WireGuard VPN connection
    sudo wg-quick down wg0 && \
    sudo dhclient -r && \
    sudo dhclient && \
    notify-send "WireGuard VPN disconnected"
else
    # Set up a WireGuard VPN connection using a /etc/wireguard/wg0.conf
    sudo wg-quick up wg0 && \
    sudo dhclient -r && \
    sudo dhclient && \
    notify-send "WireGuard VPN connected"
fi
