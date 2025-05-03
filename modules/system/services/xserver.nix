{
  services.xserver = {
    enable = true;

    desktopManager.cinnamon.enable = true;
    displayManager.lightdm.enable = true;

    xkb.layout = "latam";
  };

  services.libinput.enable = true;
}
