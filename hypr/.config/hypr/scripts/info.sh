#!/bin/bash

TIME=$(date "+%H:%M")

BATTERY=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')

# Send the notification
notify-send "$TIME" "$BATTERY" -i info
