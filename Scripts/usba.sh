#!/bin/bash
# enp0s20f0u2 Link encap:Ethernet  HWaddr 1a:55:89:a2:69:42
interface=wlp4s0
iptables -t nat -A POSTROUTING -s 10.0.0.1/32 -o $interface -j MASQUERADE
