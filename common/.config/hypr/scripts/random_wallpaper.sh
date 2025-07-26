#!/usr/bin/env bash
WALLPAPER_LIST="$HOME/.config/hypr/scripts/wallpaper"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(cat "$WALLPAPER_LIST" | grep -wv "$CURRENT_WALL" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"
