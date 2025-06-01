{ config, pkgs, ... }:
let
  inherit (config.theme) colorscheme sounds;
in
{
  services.mako = {
    enable = true;
    anchor = "top-right";
    backgroundColor = "${colorscheme.base}ff";
    borderRadius = 8;
    width = 150;
    borderSize = 0;
    defaultTimeout = 5000;
    font = "FiraCode Nerd Font 8";

    extraConfig = ''
      on-notify=exec ${pkgs.libcanberra-gtk3}/bin/canberra-gtk-play -f "${sounds.notification}"

      [urgency=critical]
      background-color=#711421ff
      ignore-timeout=1
      default-timeout=0

      [app-name=VOLUMECTL]
      on-notify=exec echo null > /dev/null

      [app-name=LIGHTCTL]
      on-notify=exec echo null > /dev/null
    '';
  };
}
