#!/bin/bash

# Get battery capacity and status
BAT=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)
TIME=$(date +'%H:%M')

# Logic Hierarchy
if [ "$STATUS" = "Charging" ]; then
    CLASS="iris"
elif [ "$BAT" -ge 70 ]; then
    CLASS="foam"
elif [ "$BAT" -ge 30 ]; then
    CLASS="rose"
else
    CLASS="love"
fi

echo "{\"text\": \"$TIME\", \"class\": \"$CLASS\"}"
