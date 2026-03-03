{ inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  home.username = "slydd";
  home.homeDirectory = "/home/slydd";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
