{ pkgs, ... }:
let
  lockscreen = ./lockscreen.jpg;

  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
    themeConfig = {
      Background = "${lockscreen}";
    };
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [ kdePackages.qtmultimedia ];
    theme = "sddm-astronaut-theme";
  };

  environment.systemPackages = [
    sddm-astronaut
  ];
}
