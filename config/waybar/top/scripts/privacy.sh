#!/usr/bin/env bash
# privacy dots for Waybar
set -euo pipefail

mic=0
cam=0
screen=0

mic="$(
  pw-dump | jq -r '
      [ .[]
        | select(.type=="PipeWire:Interface:Node")
        | select((.info.props."media.class"=="Audio/Source" or .info.props."media.class"=="Audio/Source/Virtual"))
        | select((.info.state=="running") or (.state=="running"))
      ] | (if length>0 then 1 else 0 end)
    ' 2>/dev/null || echo 0
  )"

cam="$(
  pw-dump | jq -r '
    [ .[]
      | select(.type=="PipeWire:Interface:Node")
      | select(.info.props."media.class"=="Video/Source")
      | select(
          (
            (.info.props."node.name" // "")
            | startswith("xdg-desktop-portal")
          ) | not
        )
      | select((.info.state=="running") or (.state=="running"))
    ] | (if length>0 then 1 else 0 end)
  ' 2>/dev/null || echo 0
  )"

if [ "$cam" -eq 0 ]; then
  for dev in /dev/video*; do
    [ -e "$dev" ] || continue
    if fuser "$dev" >/dev/null 2>&1; then
      cam=1
      break
    fi
  done
fi

screen="$(
  pw-dump | jq -r '
    [ .[]
      | select(.type=="PipeWire:Interface:Node")
      | select(.info.props."media.class"=="Video/Source")
      | select(
          (.info.props."node.name" // "")
          | test("^xdg-desktop-portal")
      )
    ] | (if length>0 then 1 else 0 end)
  ' 2>/dev/null || echo 0
  )"

dot() {
  local on="$1" icon=$2
  if [[ "$on" -eq 1 ]]; then
    echo "$icon"
  else
    echo ""
  fi
}

text="$(dot "$mic" "  ")$(dot "$cam" "󰄀  ")$(dot "$screen" "󰄘  ")"
tooltip="Mic: $([[ $mic -eq 1 ]] && echo on || echo off) | Cam: $([[ $cam -eq 1 ]] && echo on || echo off) | Screen Sharing: $([[ $screen -eq 1 ]] && echo on || echo off)"

echo "{\"text\":\"$text\",\"tooltip\":\"$tooltip\"}"
