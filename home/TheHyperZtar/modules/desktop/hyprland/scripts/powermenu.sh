#!/usr/bin/env bash
 
lock="  Lock"
logout="󰍃  Logout"
shutdown="⏻  Poweroff"
reboot="󰜉  Reboot"
sleep="󰒲  Suspend"
 
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu -i -p "Powermenu" \
		  -theme "~/.local/share/rofi/themes/catppuccin-macchiato-compat.rasi")

if [ "$selected_option" == "$lock" ]
then
  hyprlock
elif [ "$selected_option" == "$logout" ]
then
  swww kill ; killall waybar ; hyprctl dispatch exit
elif [ "$selected_option" == "$shutdown" ]
then
  systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
  systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
  loginctl suspend
else
  echo "No match"
fi
