{
  pkgs,
  ...
}:
{
  imports = [
    ./zed
    ./yazi
    ./dev

    ./obs.nix
    ./nvim.nix
    ./games.nix
    ./browsers/zen
    ./browsers/chromium.nix
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
    enpass
    ferdium
    brightnessctl
    spotify
    scrcpy
    qtscrcpy
    nodejs
    discord
  ];

  services.kdeconnect.enable = true;
}
