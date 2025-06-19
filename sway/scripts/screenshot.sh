#!/bin/bash

choice=$(tofi --prompt-text="Screenshot Mode:" <<EOF
Area (Edit)
Area (Save)
Fullscreen
Cancel
EOF
)

case "$choice" in
  "Area (Edit)") grim -g "$(slurp)" - | swappy -f - ;;
  "Area (Save)") grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%s).png ;;
  "Fullscreen") grim ~/Pictures/screenshot-$(date +%s).png ;;
  *) exit ;;
esac
