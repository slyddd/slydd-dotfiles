ICON_SMARTPHONE=''
ICON_TABLET=''

get_class () {
  if [ "$1" -lt 20 ] && [ "$1" -ne -1 ]
  then
    CLASS="low"
  elif [ "$1" -eq -1 ]
  then
    CLASS="disconnected"
  else
    CLASS=""
  fi
  echo $CLASS
}

get_icon () {
  if [ "$1" = "tablet" ]
  then
    icon=$ICON_TABLET
  else
    icon=$ICON_SMARTPHONE
  fi
  echo $icon
}


get_status() {
  DEVICES=$(qdbus --literal org.kde.kdeconnect /modules/kdeconnect org.kde.kdeconnect.daemon.devices)
  text=""
  tooltip=""
  class=""

  for device in $DEVICES; do
    deviceid=$(echo "$device" | awk -F'["|"]' '{print $2}')
    isreach="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$deviceid" org.kde.kdeconnect.device.isReachable)"
    ispaired="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$deviceid" org.kde.kdeconnect.device.isPaired)"
    if [ "$isreach" = "true" ] && [ "$ispaired" = "true" ]
    then
      battery="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$deviceid/battery" org.kde.kdeconnect.device.battery.charge)"
      name="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$deviceid" org.kde.kdeconnect.device.name)"
      icon=$(get_icon "$devicetype")
      text+="$icon $battery% "
      tooltip+="$name: $battery%\n"
      class=$(get_class "$battery")
    fi
  done

  # Remove trailing newline from tooltip & trailing space from text
  tooltip=$(echo "$tooltip" | sed '$s/\\n$//')
  text=$(echo "$text" | sed 's/[[:space:]]*$//')

  echo "{\"text\": \"$text\", \"tooltip\": \"$tooltip\", \"class\": \"$class\" }"
}

get_status

exit 0
