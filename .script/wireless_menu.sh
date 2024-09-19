#!/bin/bash

chosen=$(echo -e "Wifi setting\nBluetooth setting\nCreate a hotspot" | wofi --dmenu --prompt "Wireless Settings")

case "$chosen" in
    "Wifi setting")
        kitty nmtui
        ;;
    "Bluetooth setting")
        kitty bluetui
        ;;
    "Create a hotspot")
        wihotspot
        ;;
    *)
        exit 1
        ;;
esac
