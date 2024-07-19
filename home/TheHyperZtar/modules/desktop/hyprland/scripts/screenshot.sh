#!/usr/bin/env bash
export GRIMBLAST_EDITOR="swappy -f"

option2="󰋫  Selected area"
option3="󰍹  Fullscreen"
option4="󰍺  All Screens"

options="$option2\n$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -no-show-icons -p "Take Screenshot" -theme "~/.local/share/rofi/themes/catppuccin-macchiato-compat.rasi")

case $choice in
    $option2)
        sleep 1
        grimblast --cursor edit area
    ;;

    $option3)
        sleep 1
        grimblast --cursor edit output
    ;;
    $option4)
        sleep 1
        grimblast --cursor edit screen
    ;;
esac
