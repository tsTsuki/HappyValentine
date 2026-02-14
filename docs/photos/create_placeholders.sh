#!/bin/bash

# This script creates placeholder images for the website
# Requires ImageMagick (convert command)

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "Error: ImageMagick is not installed."
    echo "Please install it with: sudo apt-get install imagemagick"
    exit 1
fi

# Colors for each photo (Valentine's themed)
colors=("#ff69b4" "#ff1493" "#ff6b9d" "#c71585" "#db7093" "#ff82ab" "#ff4da6" "#ff69b4" "#ff1493" "#ff6b9d" "#db7093")

# Create JPG placeholders
photos_jpg=(1 3 4 5 6 7)
for i in "${!photos_jpg[@]}"; do
    num="${photos_jpg[$i]}"
    color="${colors[$i]}"
    convert -size 800x600 "xc:${color}" \
        -gravity center \
        -pointsize 80 \
        -fill white \
        -stroke black \
        -strokewidth 2 \
        -annotate +0+0 "Photo ${num}" \
        "photo${num}.jpg"
    echo "Created photo${num}.jpg"
done

# Create PNG placeholders
photos_png=(8 9 10 11 12)
for i in "${!photos_png[@]}"; do
    num="${photos_png[$i]}"
    idx=$((6 + i))
    color="${colors[$idx]}"
    convert -size 800x600 "xc:${color}" \
        -gravity center \
        -pointsize 80 \
        -fill white \
        -stroke black \
        -strokewidth 2 \
        -annotate +0+0 "Photo ${num}" \
        "photo${num}.png"
    echo "Created photo${num}.png"
done

echo ""
echo "All placeholder images created successfully!"
echo "Replace these with your actual photos when ready."
