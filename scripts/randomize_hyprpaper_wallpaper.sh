#!/usr/bin/env bash

CURRENT_WALL=$(hyprctl hyprpaper listloaded)

WALLPAPER_DIR="$HOME/wallpapers"

# File‑names only ─ easier to maintain
WALLPAPERS=(
    "aesthetic.jpg"
    "artificial-valley.jpg"
    "asian-village.png"
    "astronaut.png"
    "biking-sunset.jpg"
    "black-hole.png"
    "bluehour.jpg"
    "cabin-2.jpg"
    "cabin-4.png"
    "call-it-a-day.jpg"
    "castle.png"
    "city-horizon.jpg"
    "city-on-water.jpg"
    "clearing.png"
    "clouds-2.png"
    "clouds-3.jpg"
    "clouds-3.png"
    "corals-fish-underwater.jpg"
    "cottages-river.png"
    "crane.png"
    "dark-forest.jpg"
    "day-forest-path.png"
    "degirled.png"
    "desolate-city.jpg"
    "disco.png"
    "dominik-mayer-15.jpg"
    "dominik-mayer-18.png"
    "dominik-mayer-20.jpg"
    "dominik-mayer-21.jpg"
    "dominik-mayer-22.jpg"
    "dominik-mayer-7.jpg"
    "flower.jpg"
    "flying-comets-clouds.jpg"
    "girl-stars.png"
    "grandfather-tree.jpg"
    "hollow-knight.jpg"
    "horizon-2.jpg"
    "horizon.jpg"
    "lit-up-sky.png"
    "maji-no-tabitabi-3.jpg"
    "math.png"
    "misty-boat.jpg"
    "puffy-stars.jpg"
    "purple-horizon.jpg"
    "railroad-2.jpg"
    "rainy-window.jpeg"
    "serenity.jpg"
    "ship-2.png"
    "stormlight-archive.png"
    "sunset.jpg"
    "swirly-painting.jpg"
    "sword.jpg"
    "tower.png"
    "train-sideview.png"
    "tree.jpg"
    "van-chilling.png"
    "voyager-20.jpg"
    "voyager-8.jpg"
    "waves.png"
)

# Filter out the current wallpaper and pick a random one
AVAILABLE_WALLS=()
for wall in "${WALLPAPERS[@]}"; do
    # send notification if file doesnt exist
    if [[ ! -f "$WALLPAPER_DIR/$wall" ]]; then
        notify-send "Wallpaper not found" "$wall does not exist" --urgency=critical
    fi

    # add wallpaper to available wallpapers if it is not the current one
    if [[ "$WALLPAPER_DIR/$wall" != "$CURRENT_WALL" ]]; then
        AVAILABLE_WALLS+=("$WALLPAPER_DIR/$wall")
    fi
done

# Pick a random wallpaper
RANDOM_WALLPAPER="${AVAILABLE_WALLS[RANDOM % ${#AVAILABLE_WALLS[@]}]}"

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$RANDOM_WALLPAPER"
