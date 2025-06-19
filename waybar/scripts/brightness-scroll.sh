#!/bin/bash

DIRECTION=$1
STEP=5

# Ambil brightness saat ini
MAX=$(brightnessctl m)
CUR=$(brightnessctl g)
PERCENT=$(( CUR * 100 / MAX ))

# Hitung nilai baru
if [[ "$DIRECTION" == "up" ]]; then
    NEW=$(( PERCENT + STEP ))
    [[ $NEW -gt 100 ]] && NEW=100
else
    NEW=$(( PERCENT - STEP ))
    [[ $NEW -lt 1 ]] && NEW=1
fi

# Set brightness
brightnessctl s "${NEW}%"

# Tampilkan notifikasi dengan tofi
(
  echo "🔆 Brightness: ${NEW}%" | tofi \
    --prompt-text "" \
    --width 200 \
    --height 40 \
    --anchor top-right \
    --margin-top 30 \
    --margin-right 20 \
    --font "JetBrainsMono Nerd Font:size=12" \
    --background-color "#1e1e2e" \
    --text-color "#cdd6f4" \
    --selection-color "#89b4fa" \
    --selection-background "#313244" \
    --hide-cursor \
    --fuzzy-match false &
  sleep 0.6 && pkill -f "tofi --prompt-text"
) &
