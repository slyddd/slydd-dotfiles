{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      obs-studio-plugins.droidcam-obs
      obs-studio-plugins.obs-composite-blur
    ];
  };
}
