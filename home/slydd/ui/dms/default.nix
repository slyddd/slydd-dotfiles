{ inputs, config, ... }:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms-plugin-registry.modules.default

    ./settings
    ./plugins.nix
    ./service.nix
  ];

  wayland.systemd.target = "hyprland-session.target";

  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };

    session.wallpaperPath = config.theme.wallpaper;
  };

  xdg.configFile."hypr/dms/colors.conf".text = "";
  xdg.configFile."hypr/dms/layout.conf".text = "";
  xdg.configFile."hypr/dms/outputs.conf".text = "monitor = eDP-1, 1920x1200@60.003, 0x0, 1, vrr, 0";
}
