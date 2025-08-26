#!/data/data/com.termux/files/usr/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Reset

read -p "enter ip :" ip

while true; do
    ping_result=$(ping -c 1 -W 1 $ip | grep 'time=')

    if [[ $ping_result == *"time="* ]]; then
        time_ms=$(echo $ping_result | grep -oP 'time=\K[0-9.]+')
        echo -ne "\r$ip --> ${GREEN}${time_ms} ms${NC}"
    else
        echo -ne "\r$ip --> ${RED}❌ The device is not responding${NC}"
    fi

    sleep 0.5
done
