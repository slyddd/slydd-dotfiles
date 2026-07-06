#!/bin/bash

DATA=$(ai-usagebar --vendor openrouter --icon '󱚝  ' --format '{or_balance} · {session_pct}%' --json)

# Extract fields with jq
TEXT=$(echo "$DATA" | jq -r '.text')
TOOLTIP=$(echo "$DATA" | jq -r '.tooltip')

# Remove text span format with sed
TEXT=$(echo "$TEXT" | sed -E 's/<span[^>]*>//g' | sed -E 's/<\/span>//g')

# Remove '|' characters from TOOLTIP
TOOLTIP=$(echo "$TOOLTIP" | sed -E 's/│//g')

# Join fields in DATA
DATA=$(echo "$DATA" | jq -r --arg text "$TEXT" '.text = $text')
DATA=$(echo "$DATA" | jq -r --arg tooltip "$TOOLTIP" '.tooltip = $tooltip')

# Output modified DATA
jq -r '.' --unbuffered --compact-output <<< "$DATA"
