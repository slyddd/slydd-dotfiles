{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam-rom-manager
    prismlauncher
    heroic
    legendary-gl
    winetricks

    (retroarch.withCores (
      cores: with cores; [
        snes9x
        mgba
        nestopia
        melonds
        mupen64plus
      ]
    ))

    # Gamescope is a bit weird to kill, so we make a script for it
    (pkgs.writeShellScriptBin "exit-to-sddm" ''
      pkill gamescope || pkill -9 gamescope
    '')
  ];
}
