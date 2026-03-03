{...}:
{
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
  };

  services.libinput.enable = true;

  programs.hyprland.enable = true;
  programs.dconf.enable = true;
  security.rtkit.enable = true;
}
