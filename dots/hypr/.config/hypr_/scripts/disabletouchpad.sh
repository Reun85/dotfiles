#!/usr/bin/bash
device_name=$(hyprctl devices | rg "touchpad" | awk '{$1=$1;printf("device:%s:enabled",$1)}')
new_status=$(hyprctl getoption "$device_name" | awk -F': ' '/int/{if ($2 == "1") print "0"; else if ($2 == "0") print "1"}')
hyprctl keyword "$device_name" "$new_status"
if [[ $new_status == "1" ]]; then
	notify-send "Touchpad has been enabled"
else
	notify-send "Touchpad has been disabled"
fi
