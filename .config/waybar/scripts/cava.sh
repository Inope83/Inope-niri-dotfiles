#!/bin/bash

CHARS=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

cava -p ~/.config/waybar/cava.ini | while IFS=';' read -ra values; do
    output=""
    for val in "${values[@]}"; do
        val="${val//[$'\t\r\n ']/}"
        if [[ "$val" =~ ^[0-7]$ ]]; then
            output+="${CHARS[$val]}"
        fi
    done
    [[ -n "$output" ]] && printf '{"text":"%s","class":"cava"}\n' "$output"
done
