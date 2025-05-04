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

    # Home directory configuration
    ./home.nix
  ];
}
