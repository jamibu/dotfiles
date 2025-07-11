#!/usr/bin/env bash
workspace=$1
currentMonitor=$(hyprctl -j activeworkspace | jq -r '.monitor');

hyprctl --batch "dispatch moveworkspacetomonitor $workspace $currentMonitor ; dispatch workspace $workspace"
