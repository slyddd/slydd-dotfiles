{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
}
