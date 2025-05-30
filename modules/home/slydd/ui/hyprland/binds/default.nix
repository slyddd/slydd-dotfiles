{
  imports = [
    ./programs.nix
    ./workspaces.nix
    ./windows.nix
    ./extrakeys.nix
  ];

  wayland.windowManager.hyprland.settings."$mod" = "SUPER";
}
