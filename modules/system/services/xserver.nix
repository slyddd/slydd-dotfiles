{
  services.xserver = {
    enable = true;

    desktopManager.cinnamon.enable = true;
    xkb.layout = "latam";
  };

  services.libinput.enable = true;

  programs.hyprland.enable = true;
  programs.dconf.enable = true;
  security.rtkit.enable = true;
}
