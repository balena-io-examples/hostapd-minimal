#!/usr/bin/env bash

nmcli dev set wlan1 managed no

ip addr flush dev wlan1
ip addr add 192.168.42.1/24 dev wlan1

sleep 20s

systemctl unmask dnsmasq
systemctl restart dnsmasq

systemctl unmask hostapd
systemctl restart hostapd

sleep infinity
