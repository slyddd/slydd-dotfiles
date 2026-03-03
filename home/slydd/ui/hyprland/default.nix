{ config, ... }:
{
  imports = [
    ./config
    ./binds
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      monitor = [ ",preferred,auto,auto" ];

      input = {
        kb_layout = "us";
        kb_variant = "altgr-intl";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0.0;

        touchpad = {
          natural_scroll = true;
        };
      };
    };
  };
}
