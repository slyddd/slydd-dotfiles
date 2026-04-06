{inputs, config, ...}:
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
}
