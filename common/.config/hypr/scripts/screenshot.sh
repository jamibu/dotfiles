#!/usr/bin/env bash
screenshotFolder="$HOME/Pictures/screenshots"

case $1 in
    'active')
        activeWindow=$(hyprctl -j activewindow | jq -r '(.class)')
        filename="$(date +'%Y%m%d%H%M%S')-$activeWindow.png"
        hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' \
            | grim -g - - | tee "$screenshotFolder/$filename" | wl-copy
        ;;

    'region')
        filename=$(date +'%Y%m%d%H%M%S-region.png')
        slurp | grim -g - - | tee "$screenshotFolder/$filename" | wl-copy
        ;;
esac

if [ -e $screenshotFolder/$filename ]; then
    notify-send -i "$screenshotFolder/$filename" "Screenshot Saved" "$filename"
else
    notify-send "Screenshot Failed"
fi
