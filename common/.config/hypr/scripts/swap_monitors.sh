#!/usr/bin/env bash
active=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true) | "\(.id) \(.activeWorkspace.name)"');
inactive=$(hyprctl -j monitors | jq -r '.[] | select(.focused == false) | "\(.id) \(.activeWorkspace.name)"');

read activeMonitor activeWorkspace <<< $active
read inactiveMonitor inactiveWorkspace <<< $inactive

commands=(
    "dispatch moveworkspacetomonitor $inactiveWorkspace $activeMonitor"
    "dispatch moveworkspacetomonitor $activeWorkspace $inactiveMonitor"
    "dispatch workspace $inactiveWorkspace"
    "dispatch workspace $activeWorkspace"
)

IFS=';'
hyprctl --batch "${commands[*]}"
