#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  >&2 echo "usage: $0 FILENAME[:LINENO][:IGNORED]"
  exit 1
fi

file=${1/#\~\//$HOME/}

center=0
if [[ ! -r $file ]]; then
  if [[ $file =~ ^(.+):([0-9]+)\ *$ ]] && [[ -r ${BASH_REMATCH[1]} ]]; then
    file=${BASH_REMATCH[1]}
    center=${BASH_REMATCH[2]}
  elif [[ $file =~ ^(.+):([0-9]+):[0-9]+\ *$ ]] && [[ -r ${BASH_REMATCH[1]} ]]; then
    file=${BASH_REMATCH[1]}
    center=${BASH_REMATCH[2]}
  fi
fi

type=$(file --brief --dereference --mime -- "$file")

if [[ ! $type =~ image/ ]]; then
  # uses mdcat to markdown files
  if [[ $type =~ text/markdown || $file =~ \.md$ || $file =~ \.markdown$ ]]; then
      mdcat "$file"
      exit
  fi

  # uses eza to preview folders
  if [[ $type =~ =binary ]]; then
    eza -lha --icons --color=always --git -- "$file"
    exit
  fi

  # uses bat to preview text files
  ext="${file##*.}"
  lang=$(bat --list-languages | grep -iwE "zshrc" | cut -d: -f1)
  if [[ $lang == "" ]]; then
    lang="txt"
  fi
  bat --color=always --style=full --language="$lang" --theme="Catppuccin Mocha" -- "$file"
  exit
fi

# uses kitty's icat to preview images
dim=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}
if [[ $dim == x ]]; then
  dim=$(stty size < /dev/tty | awk '{print $2 "x" $1}')
elif ! [[ $KITTY_WINDOW_ID ]] && ((FZF_PREVIEW_TOP + FZF_PREVIEW_LINES == $(stty size < /dev/tty | awk '{print $1}'))); then
  dim=${FZF_PREVIEW_COLUMNS}x$((FZF_PREVIEW_LINES - 1))
fi

kitten icat --clear --transfer-mode=memory --unicode-placeholder --stdin=no --place="$dim@0x0" "$file" | sed '$d' | sed $'$s/$/\e[m/'
