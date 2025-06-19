#!/bin/bash
swaymsg -t get_tree | \
    jq -r '.. | objects | select(.focused? == true) | .app_id // .window_properties.class // "N/A"'
