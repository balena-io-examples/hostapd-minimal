#!/usr/bin/env bash

sleep 15s

echo 'Unmanage WiFi interface'

python -c "import NetworkManager; NetworkManager.NetworkManager.GetDeviceByIpIface('wlan0').Managed = False"

sleep 5s

echo 'Set ip address'

ip addr flush dev wlan0
ip addr add 192.168.42.1/24 dev wlan0

sleep 5s

echo 'Start dnsmasq & hostapd'

systemctl unmask dnsmasq
systemctl restart dnsmasq

systemctl unmask hostapd
systemctl restart hostapd
