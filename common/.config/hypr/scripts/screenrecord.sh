#!/usr/bin/env bash
recordingFolder="$HOME/Videos/screenrecordings"

case $1 in
    'region')
        filename=$(date +'%Y%m%d%H%M%S-region.mkv')
        wf-recorder -g "$(slurp)" -f "$recordingFolder/$filename"
        ;;

    'stop')
        pkill 'wf-recorder' -SIGINT
        latestfile=$(exa $recordingFolder --sort newest | tail -n 1)
        notify-send "Recording Stopped" "$latestfile"
        ;;
esac
