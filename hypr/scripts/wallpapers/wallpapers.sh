#!/bin/bash

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

while true; do
    sleep 10m
    "$script_dir/next_wallpaper.sh"
done
