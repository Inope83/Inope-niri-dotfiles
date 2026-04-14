#!/bin/bash

# Cek apakah file tema rofi dari pywal ada
if [ -f ~/.cache/wal/colors-rofi-pywal.rasi ]; then
    rofi -dmenu -i -p " KEYBINDS" -theme ~/.cache/wal/colors-rofi-pywal.rasi < ~/.config/niri/keybinds.txt
else
    # Fallback ke tema manual jika pywal belum jalan
    rofi -dmenu -i -p " KEYBINDS" \
        -theme-str 'window {width: 48%; background-color: #1e1e2e; border-radius: 16px;}' \
        -theme-str 'element selected.normal {background-color: #cba6f7;}' \
        -theme-str 'element-text {text-color: #cdd6f4;}' \
        < ~/.config/niri/keybinds.txt
fi
