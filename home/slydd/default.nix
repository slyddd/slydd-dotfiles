{ pkgs, ... }:
{
  imports = [
    ./home.nix
    ./cursor.nix
    ./ui
    ./shell
  ];

  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.kitty.enable = true;
  programs.neovim.enable = true;
  programs.chromium.enable = true;
  programs.zen-browser.enable = true;
  programs.zed-editor.enable = true;
}
