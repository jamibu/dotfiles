#!/usr/bin/env bash
WALLPAPER_LIST="$HOME/.config/hypr/scripts/wallpaper"

# Just get a random wallpaper
WALLPAPER=$(cat "$WALLPAPER_LIST" | shuf -n 1)

# Preload and set the wallpaper
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper ",$WALLPAPER"

# Optional: unload all unused wallpapers
hyprctl hyprpaper unload unused
