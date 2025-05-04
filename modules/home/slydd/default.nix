{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    kitty
    vivaldi
    enpass
    libreoffice
  ];

  imports = [
    # Configuration files
    ./zed
    ./git

    # Home directory configuration
    ./home.nix
  ];
}
