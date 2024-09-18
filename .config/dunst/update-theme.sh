#!/bin/sh

# Source Pywal's generated color palette
. "${HOME}/.cache/wal/colors.sh"

# Path to the Dunst configuration file
conffile="${XDG_CONFIG_HOME:-$HOME/.config}/dunst/dunstrc"

# Ensure the config file exists
if [ ! -f "$conffile" ]; then
    echo "Dunst configuration file not found at $conffile"
    exit 1
fi

# Map Pywal colors to Dunst's urgency block color properties
declare -A urgency_blocks
urgency_blocks=(
    ["low"]="$color0"
    ["normal"]="$color1"
    ["critical"]="$color2"
)

# Foreground and frame color
foreground="$color15"
frame_color="$color3"

# Function to update colors in the specific urgency blocks
update_urgency_block() {
    block_name=$1
    background_color=$2

    sed -i "/^\[urgency_${block_name}\]/,/^\[/{s/background = .*/background = \"$background_color\"/; s/foreground = .*/foreground = \"$foreground\"/; s/frame_color = .*/frame_color = \"$frame_color\"/}" "$conffile"
}

# Update colors for urgency_low, urgency_normal, and urgency_critical blocks
update_urgency_block "low" "${urgency_blocks["low"]}"
update_urgency_block "normal" "${urgency_blocks["normal"]}"
update_urgency_block "critical" "${urgency_blocks["critical"]}"

# Restart Dunst to apply the changes
killall dunst
dunst &

echo "Dunst color palette updated using Pywal."
