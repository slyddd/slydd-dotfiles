{ pkgs, modulesPath, ... }:
{
  networking.hostName = "DEV2DIE";

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./disk.nix
    ./kernel.nix
    ./users.nix
  ];

  # Fix keyboard lock
  environment.etc."systemd/system-sleep/99-lenovo-kbd-fix" = {
    mode = "0755";
    text = ''
      #!${pkgs.bash}/bin/bash
      case "$1" in
        post)
          for drvctl in /sys/bus/serio/devices/serio*/drvctl; do
            [ -e "$drvctl" ] && echo reconnect > "$drvctl" 2>/dev/null || true
          done
          ;;
      esac
    '';
  };

  system.stateVersion = "25.11";
}
