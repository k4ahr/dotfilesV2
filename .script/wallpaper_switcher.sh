#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/wallpaper-switcher/wallpaper"

# List all image files in the directory and store both full paths and processed filenames
WALLPAPERS=($(ls "$WALLPAPER_DIR"/*.{jpg,jpeg,png} 2> /dev/null))
FILENAMES=("Random") # Add "Random" as the first option

for WALLPAPER in "${WALLPAPERS[@]}"; do
    BASENAME=$(basename "$WALLPAPER")
    FILENAME_WITHOUT_EXT="${BASENAME%.*}"
    CAPITALIZED_NAME=$(echo "$FILENAME_WITHOUT_EXT" | sed 's/.*/\u&/')
    FILENAMES+=("$CAPITALIZED_NAME")
done

# If no wallpapers are found, exit the script
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Use wofi to select a wallpaper (showing capitalized filenames without extensions)
SELECTED_NAME=$(printf "%s\n" "${FILENAMES[@]}" | wofi --dmenu --prompt="Select a wallpaper")

# Handle the "Random" option or map the selected name back to the corresponding full path
if [ "$SELECTED_NAME" == "Random" ]; then
    SELECTED=${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}
else
    for i in "${!FILENAMES[@]}"; do
        if [ "${FILENAMES[$i]}" == "$SELECTED_NAME" ]; then
            SELECTED="${WALLPAPERS[$i-1]}" # Subtract 1 because "Random" shifts indices
            break
        fi
    done
fi

# Debugging output
echo "Selected wallpaper: $SELECTED" >> /tmp/wallpaper_switcher.log

# If a wallpaper was selected, set it using swww, apply the colors with pywal, and update spicetify
if [ -n "$SELECTED" ]; then
    swww img "$SELECTED" >> /tmp/wallpaper_switcher.log 2>&1
    wal -i "$SELECTED" >> /tmp/wallpaper_switcher.log 2>&1
    pywal-spicetify >> /tmp/wallpaper_switcher.log 2>&1
    pywalfox update >> /tmp/wallpaper_switcher.log 2>&1
    sh .config/dunst/update-theme.sh
else
    echo "No wallpaper selected." >> /tmp/wallpaper_switcher.log
fi
