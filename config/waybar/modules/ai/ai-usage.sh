#!/bin/bash

API=$(echo $OPENROUTER_ADMIN_API_KEY)
DATA=$(curl https://openrouter.ai/api/v1/credits \
  -H "Authorization: Bearer $OPENROUTER_ADMIN_API_KEY" -s | jq .)

CREDITS=$(echo $DATA | jq .data.total_credits)
USAGE=$(echo $DATA | jq .data.total_usage)

PERCENTAGE=$(echo "scale=2; ($USAGE * 100) / $CREDITS" | bc)
LEFT=$(echo "scale=2; ($CREDITS - $USAGE) / 1" | bc)

text="󰚩   $PERCENTAGE%"
if [[ $1 == "--coin" ]]; then
  text="\$$LEFT"
fi

tooltip="Total:\t\$$CREDITS"

if [ $(echo "$PERCENTAGE > 85" | bc) -eq 1 ]; then
  class="warn"
fi

echo "{\"text\": \"$text\", \"tooltip\": \"$tooltip\", \"class\": \"$class\"}"
