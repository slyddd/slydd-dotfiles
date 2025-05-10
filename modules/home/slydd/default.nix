{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    vivaldi
    enpass
    libreoffice
  ];

  imports = [
    # Configuration files
    ./zed
    ./git
    ./kitty
    ./zsh

    # Desktop Manager
    ./hyprland

    # Home directory configuration
    ./home.nix
  ];
}
