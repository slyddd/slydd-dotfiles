{ pkgs, ... }:

let
  batteryNotifyScript = pkgs.writeShellScript "battery-low-warning.sh" ''
    battery=$(upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}' | tr -d '%')
    batteryStatus=$(upower -i $(upower -e | grep BAT) | grep state | awk '{print $2}')

    if [ "$battery" -le 10 ] && [ "$batteryStatus" = "discharging" ]; then
      ${pkgs.libnotify}/bin/notify-send -u critical \
      -h int:value:"$battery" \
      -h string:x-canonical-private-synchronous:"$battery" \
      "Battery Warning" \
      "Battery is at $battery%" \
      -i battery-caution-symbolic
    fi
  '';
in
{
  systemd.user.timers.battery-warning = {
    Unit = {
      Description = "Notify when battery is low";
    };
    Timer = {
      OnBootSec = "1min";
      OnUnitActiveSec = "1min";
      Unit = "battery-warning.service";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };

  systemd.user.services.battery-warning = {
    Unit = {
      Description = "Battery low warning";
    };
    Service = {
      Type = "oneshot";
      ExecStart = batteryNotifyScript;
    };
  };
}
