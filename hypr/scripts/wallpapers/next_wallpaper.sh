#!/bin/bash

### This script changes the wallpaper to the next wallpaper in the wallpapers directory

wallpapers_dir="$HOME/Pictures/Wallpapers"
wallpaper_path="$wallpapers_dir/.bg"
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
index_file="$script_dir/current_wallpaper_index.txt"
current_bg="$wallpaper_path/bg.jpg"

# Create the index file if it doesn't exist
function verify_index_file {
  mkdir -p "$wallpaper_path"
  if [ ! -f "$index_file" ]; then
    echo 0 >"$index_file"
  fi
}

# Import wallpapers from the wallpapers directory to a wallpapers array
function get_wallpapers {
  wallpapers=()
  for wallpaper in "$wallpapers_dir"/*; do
    [ -f "$wallpaper" ] || continue
    wallpapers+=("$wallpaper")
  done
}

# Ask hyprpaper daemon to display the current image.
function apply_wallpaper {
  hyprctl hyprpaper preload "$current_bg" >/dev/null 2>&1
  hyprctl hyprpaper wallpaper ",$current_bg" >/dev/null 2>&1
  hyprctl hyprpaper unload unused >/dev/null 2>&1
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
  # If the current index isn't logic, reset to 0
  if [ $current_wallpaper -ge $total_wallpapers -o $current_wallpaper -lt 0 ]; then
    current_wallpaper=0
  fi
  rm -f "$current_bg"
  cp "${wallpapers[$current_wallpaper]}" "$current_bg"
  apply_wallpaper
  current_wallpaper=$((current_wallpaper + 1))
  echo $current_wallpaper >"$index_file"
}

# Main
verify_index_file
get_wallpapers
total_wallpapers=${#wallpapers[@]}
if [ "$total_wallpapers" -eq 0 ]; then
  echo "No wallpapers found in $wallpapers_dir"
  exit 1
fi
current_wallpaper=$(cat "$index_file")
if ! [[ "$current_wallpaper" =~ ^[0-9]+$ ]]; then
  current_wallpaper=0
fi

next_wallpaper "$1"

