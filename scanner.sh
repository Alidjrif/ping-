#!/bin/bash

# 🌟 شعار rro مميز
echo "██████╗ ██████╗  ██████╗ "
echo "██╔══██╗██╔══██╗██╔═══██╗"
echo "██████╔╝██████╔╝██║   ██║"
echo "██╔═══╝ ██╔═══╝ ██║   ██║"
echo "██║     ██║     ╚██████╔╝"
echo "╚═╝     ╚═╝      ╚═════╝  rro"
echo "🌐 Network Scanner Tool (Fast Mode) 🌐"

read -p "Enter the base IP (e.g. 192.168.1.): " base_ip

active_count=0

for i in $(seq 1 254); do
    (
        ip="${base_ip}${i}"
        ping -c 1 -W 1 "$ip" > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "✅ Active: $ip"
            ((active_count++))
        fi
    ) &
done

wait
echo "✅ Scan complete."
