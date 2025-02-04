# This script will loop through all wallpapers in the wallpapers directory and change the wallpaper every 5 minutes

# Dependencies: waypaper

# Variables
wallpapers_dir="$HOME/Pictures/Wallpapers"
wallpaper_path="$wallpapers_dir/.bg"

function get_wallpapers {
    wallpapers=()
    for wallpaper in $(ls "$wallpapers_dir" | shuf); do
        wallpapers+=("$wallpapers_dir/$wallpaper")
    done
}


# Loop through wallpapers
function loop {
    for wallpaper in "${wallpapers[@]}"; do
        rm $wallpaper_path/bg.jpg
        cp "$wallpaper" "$wallpaper_path/bg.jpg"
        waypaper --backend swww --wallpaper $wallpaper_path/bg.jpg
        sleep 300 # Todo: add an interrupt to change wallpaper
    done
}


# On all loops, wallpaper array will be updated
while true; do
    get_wallpapers
    loop
done
