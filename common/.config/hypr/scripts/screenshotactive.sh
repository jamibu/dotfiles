screenshotFolder="$HOME/Pictures/screenshots"
activeWindow=$(hyprctl -j activewindow | jq -r '(.class)')
filename="$(date +'%Y%m%d%H%M%S')-$activeWindow.png"

hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - "$screenshotFolder/$filename"

if [ -e $screenshot_filename ]; then
    notify-send -i "$screenshotFolder/$filename" "Screenshot Saved" "$filename"
fi
