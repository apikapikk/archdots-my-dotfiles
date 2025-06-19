#!/bin/bash

# Jalankan wlogout lewat XWayland agar punya app_id
env XDG_CURRENT_DESKTOP=sway wlogout --protocol layer-shell &

