#!/bin/bash

### This script changes the wallpaper to the next wallpaper in the wallpapers directory

wallpapers_dir="$HOME/Pictures/Wallpapers"
wallpaper_path="$wallpapers_dir/.bg"
index_file="$HOME/.config/dots/hypr/scripts/wallpapers/current_wallpaper_index.txt"

# Create the index file if it doesn't exist
function verify_index_file {
    if [ ! -f "$index_file" ]; then
        echo 0 > "$index_file"
    fi
}

# Import wallpapers from the wallpapers directory to a wallpapers array
function get_wallpapers {
    wallpapers=()
    for wallpaper in "$wallpapers_dir"/*; do
        wallpapers+=("$wallpaper")
    done
}

# Change the wallpaper to the next wallpaper in the wallpapers array
function next_wallpaper {
    if [ "$1" == "previous" ]; then
        if [ $current_wallpaper -ge 2 ]; then
            current_wallpaper=$((current_wallpaper - 2))
        elif [ $current_wallpaper -eq 1 ]; then
            current_wallpaper=$((total_wallpapers - 1))
        else
            current_wallpaper=$((total_wallpapers - 2))
        fi
    fi
    if [ $current_wallpaper -ge $total_wallpapers ]; then
        current_wallpaper=0
    fi
    rm -f "$wallpaper_path/bg.jpg"
    cp "${wallpapers[$current_wallpaper]}" "$wallpaper_path/bg.jpg"
    waypaper --backend swww --wallpaper "$wallpaper_path/bg.jpg"
    current_wallpaper=$((current_wallpaper + 1))
    echo $current_wallpaper > "$index_file"
}

# Main
verify_index_file
get_wallpapers
total_wallpapers=${#wallpapers[@]}
current_wallpaper=$(cat "$index_file")

next_wallpaper "$1"