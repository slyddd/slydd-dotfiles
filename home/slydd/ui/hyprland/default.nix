{ config, ... }:
{
  imports = [
    ./config
    ./binds
    ./services
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };

    settings = {
      monitor = [ ",preferred,auto,auto" ];

      input = {
        kb_layout = "us";
        kb_variant = "altgr-intl";
        numlock_by_default = true;
        follow_mouse = 0;
        sensitivity = 0.0;

        touchpad = {
          natural_scroll = true;
        };
      };
    };

    extraConfig = ''
      source = ~/.config/hypr/dms/colors.conf
      source = ~/.config/hypr/dms/layout.conf
      source = ~/.config/hypr/dms/outputs.conf
    '';
  };
}
