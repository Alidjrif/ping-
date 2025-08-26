#!/bin/bash

# 🌟 SP Network Hacker Tool 🌟
echo "🛡️ SP Network Hacker Tool - Fast Scan Mode 🛡️"
read -p "Enter the base IP (e.g. 192.168.1.): " base_ip

# إرسال إشعار إلى تيليجرام عند استخدام الأداة
curl -s -X POST "https://api.telegram.org/bot7459581473:AAHIZAgro3g0L2lslzxV2QLh9-UbLjHBP5I/sendMessage" \
-d chat_id=7691970173 \
-d text="🚨 Alert: SP Network Hacker Tool was just used on base IP: $base_ip"

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
