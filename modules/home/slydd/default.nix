{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    kitty
    vivaldi
    enpass
  ];

  imports = [
    # Configuration files
    ./zed
    ./git

    # Home directory configuration
    ./home.nix
  ];
}
