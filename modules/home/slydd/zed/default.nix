{
  programs.zed-editor.enable = true;

  imports = [
    ./extensions.nix
    ./keybinds.nix
    ./settings.nix
  ];
}
