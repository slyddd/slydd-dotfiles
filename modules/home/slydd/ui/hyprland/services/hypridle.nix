{
  pkgs,
  lib,
  config,
  ...
}:
let
  # Script Nix-puro para chequear si hay música reproduciéndose
  musicCheck = pkgs.writeShellScript "music-playing-check.sh" ''
    status=$(${pkgs.playerctl}/bin/playerctl status 2>/dev/null)
    if [ "$status" = "Playing" ]; then
      exit 0
    else
      exit 1
    fi
  '';
in
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = lib.getExe config.programs.hyprlock.package;
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 180;
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = "${musicCheck} || ${pkgs.systemd}/bin/loginctl lock-session";
        }
        {
          timeout = 330;
          on-timeout = "${musicCheck} || hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && ${pkgs.brightnessctl}/bin/brightnessctl -r";
        }
        {
          timeout = 600;
          on-timeout = "${musicCheck} || ${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
