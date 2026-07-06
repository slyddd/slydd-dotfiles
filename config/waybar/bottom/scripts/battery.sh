BAT="/sys/class/power_supply/BAT0"
BAT_PERCENTAGE=$(/usr/bin/cat $BAT/capacity)
STATUS=$(/usr/bin/cat $BAT/status)
CYCLES=$(/usr/bin/cat $BAT/cycle_count)
CONSERVATION=$(/usr/bin/cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)

declare -a class=()
conservation_icon=""

get_icon() {
  if [ "$BAT_PERCENTAGE" -lt 20 ]; then
    echo ""
  elif [ "$BAT_PERCENTAGE" -lt 40 ]; then
    echo ""
  elif [ "$BAT_PERCENTAGE" -lt 60 ]; then
    echo ""
  elif [ "$BAT_PERCENTAGE" -lt 80 ]; then
    echo ""
  else
    echo ""
  fi
}

if [ "$CONSERVATION" -eq 1 ]; then
  conservation_icon="󰋑"
fi

if [ "$STATUS" = "Charging" ]; then
  class+=("\"charging\"")
fi

if [ "$BAT_PERCENTAGE" -lt 20 ]; then
  class+=("\"low\"")
fi

icon=""
if [ "$STATUS" = "Charging" ]; then
    icon=""
else
    icon=$(get_icon)
fi

class=$(IFS=,; echo "[${class[*]}]")

text="$icon $BAT_PERCENTAGE%"
tooltip="$BAT_PERCENTAGE%\t$CYCLES cycles $conservation_icon"
echo "{\"text\": \"$text\", \"tooltip\": \"$tooltip\", \"class\": $class}"
