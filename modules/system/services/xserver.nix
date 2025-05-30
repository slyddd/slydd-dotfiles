{ pkgs, ... }:
{
  services.xserver = {
    enable = true;

    desktopManager.cinnamon.enable = true;
    xkb.layout = "latam";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [ kdePackages.qtmultimedia ];
  };

  environment.systemPackages =
    let
      sddm-astronaut = pkgs.sddm-astronaut.override {
        embeddedTheme = "japanese_aesthetic";
      };
    in
    [
      sddm-astronaut
    ];

  services.libinput.enable = true;

  programs.hyprland.enable = true;
}
