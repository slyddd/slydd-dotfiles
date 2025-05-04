{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    kitty
    vivaldi
    enpass
    gh
  ];

  programs.git = {
    enable = true;
    userName = "slyddd";
    userEmail = "dayvidnavarrete@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  imports = [
    # Configuration files
    ./zed

    # Home directory configuration
    ./home.nix
  ];
}
