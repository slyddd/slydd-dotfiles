{ ... }:
{
  imports = [
    ./extensions.nix
    ./keybinds.nix
    ./settings.nix
    ./theme.nix
  ];

  programs.zed-editor.enable = true;
}
