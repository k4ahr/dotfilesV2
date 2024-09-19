#!/bin/bash

# Get current hour and minute to determine greeting and display time
HOUR=$(date +"%H")
MINUTE=$(date +"%M")
CURRENT_TIME=$(date +"%H:%M")

if [ $HOUR -lt 12 ]; then
    GREETING="Good morning"
elif [ $HOUR -lt 18 ]; then
    GREETING="Good afternoon"
else
    GREETING="Good evening"
fi

# Combine greeting with the current time
PROMPT="$GREETING, it's $CURRENT_TIME"

# Create the Wofi menu options
options="File Manager\nPower Options\nChange Wallpaper\nTerminal\nApp Search\nWireless Settings"

# Display the Wofi menu with the dynamic greeting and time
selection=$(echo -e "$options" | wofi --prompt "$PROMPT" --dmenu)

# Handle the user's selection
case "$selection" in
    "App Search")
        wofi --show drun
        ;;
    "File Manager")
        kitty ranger
        ;;
    "Wireless Settings")
        sh ~/.script/wireless_menu.sh
        ;;
    "Power Options")
        ~/.script/power-menu.sh
        ;;
    "Change Wallpaper")
        ~/.script/wallpaper_switcher.sh
        ;;
    "Terminal")
        kitty
        ;;
    *)
        echo "Invalid option"
        ;;
esac
