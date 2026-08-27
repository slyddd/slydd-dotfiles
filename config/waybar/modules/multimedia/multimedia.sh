#!/bin/bash
format='{"artist": "{{ artist }}", "album": "{{ album }}", "title": "{{ title }}", "artUrl": "{{ mpris:artUrl }}", "status": "{{ status }}"}'
metadata=$(playerctl metadata -p spotify --format "$format")

# Convert album art to circle using ImageMagick
convert_art() {
  file=$1
  image_metadata=$(exiftool -s -s -s "$file")
  image_size=$(echo "$image_metadata" | grep -oP '(\d+)x(\d+)')
  image_width=$(echo "$image_size" | cut -d'x' -f1)
  image_height=$(echo "$image_size" | cut -d'x' -f2)

  if [[ -z $image_width || -z $image_height ]]; then
    echo "$file"
    exit
  fi

  if [[ $image_width -gt $image_height ]]; then
    image_width=$image_height
    magick "$file" -resize "${image_width}x${image_height}" "/tmp/cover.jpeg"
    file="/tmp/cover.jpeg"
  fi

  magick "$file"  \
    \( -size ${image_width}x${image_height} xc:black \
       -fill white \
       -draw "circle 320,320 320,0" \) \
    -alpha off \
    -compose CopyOpacity \
    -composite \
    "/tmp/cover_circle.png"

  echo "/tmp/cover_circle.png"
}

get_album_art() {
  album_art=$(echo "$metadata" | jq -r '.artUrl')
  album=$(echo "$metadata" | jq -r '.album')
  if [[ -z $album_art ]] then
    album_art="$HOME/.face"
    album="$USER@$HOSTNAME"
  else
    curl -s  "${album_art}" --output "/tmp/cover.jpeg"
    album_art="/tmp/cover.jpeg"
  fi

  # Resize and crop to circle using convert_art function created before
  converted=$(convert_art "$album_art")
  echo "$converted"
  echo "$album"
}

get_music_info() {
  artist=$(echo "$metadata" | jq -r '.artist')
  album=$(echo "$metadata" | jq -r '.album')
  title=$(echo "$metadata" | jq -r '.title')
  status=$(echo "$metadata" | jq -r '.status')

  if [[ $status == "" ]]; then
    text="$USER"
    echo "{\"text\": \"$text\", \"tooltip\": \"\", \"alt\": \"\", \"class\": \"\"}"
    exit
  fi

  title_short=$(echo "$title" | cut -c1-20) # Permit only 20 characters
  text="$artist - $title_short"
  tooltip="$title\n$album\n$artist"
  alt=$(echo "$status" | tr '[:upper:]' '[:lower:]' | sed 's/ //g')
  class="$status"

  echo "{\"text\": \"$text\", \"tooltip\": \"$tooltip\", \"alt\": \"$alt\", \"class\": \"$class\"}"
}

if [[ $1 == "--info" ]] then
  get_music_info
fi

if [[ $1 == "--cover" ]] then
  get_album_art
fi
