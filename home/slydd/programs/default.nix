{ pkgs, ... }:
{
  imports = [
    ./zed
    ./yazi
    ./dev
    ./vscode
    ./browsers/zen
    ./browsers/firefox

    ./obs.nix
    ./nvim.nix
    ./games.nix
    ./spotify.nix
  ];

  home.packages = with pkgs; [
    chafa
    cliphist
    glow
    jq
    ouch
    wev
    obsidian
    inkscape
    bitwarden-desktop
    ferdium
    brightnessctl
    scrcpy
    qtscrcpy
    nodejs
    discord
    gnome-network-displays
    iw
  ];

  services.kdeconnect.enable = true;
}
