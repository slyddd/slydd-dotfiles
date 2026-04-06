{...}:
{
  imports = [
    ./bars/top.nix
    ./bars/bottom.nix

    ./appearance.nix
    ./animations.nix
    ./clock.nix
    ./weather.nix
    ./bar-widgets.nix
    ./control-center.nix
    ./workspace.nix
    ./launcher.nix
    ./notifications.nix
    ./osd.nix
    ./power.nix
    ./fonts.nix
    ./sounds.nix
    ./theming.nix
    ./misc.nix
  ];

  programs.dank-material-shell = {
    enableDynamicTheming = true;
    enableClipboardPaste = true;
  };
}
