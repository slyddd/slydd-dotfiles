# ╔═╗┬ ┬ ┬┌┬┐┌┬┐  ┌┬┐┌─┐┌┬┐┌─┐
# ╚═╗│ └┬┘ ││ ││───│││ │ │ └─┐
# ╚═╝┴─┘┴ ─┴┘─┴┘  ─┴┘└─┘ ┴ └─┘
# Power Menu for Rofi
hibernate=''
shutdown='󰐥'
reboot='󰜉'
lock='󰌾'
suspend=''
logout='󰍃'

case "$ROFI_RETV" in
  0)
    echo $hibernate
    echo $shutdown
    echo $reboot
    echo $lock
    echo $suspend
    echo $logout
    ;;
  1)
case "$1" in
  "$hibernate")
    systemctl hibernate &>/dev/null
    ;;
  "$shutdown")
    systemctl poweroff &>/dev/null
    ;;
  "$reboot")
    systemctl reboot &>/dev/null
    ;;
  "$lock")
    hyprlock &>/dev/null
    ;;
  "$suspend")
    systemctl suspend &>/dev/null
    ;;
  "$logout")
    loginctl terminate-session $XDG_SESSION_ID &>/dev/null
    ;;
  esac
  ;;
esac
