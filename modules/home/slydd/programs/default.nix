{
  pkgs,
  inputs,
  self,
  ...
}:
{
  imports = [
    ./zed
    ./dev
    ./fuzzel.nix
    ./obs.nix
    ./yazi.nix
  ];

  home.packages = with pkgs; [
    # browser
    vivaldi
    inputs.zen-browser.packages."${system}".default

    # utilities
    neovim
    enpass
    libreoffice
    scrcpy
    unzip
    teams-for-linux
    hyprpicker

    # media
    pwvucontrol
    spotify

    # system tools
    package-version-server
    xorg.xev
    wev
    wl-clipboard-rs
    libcanberra-gtk3
    libnotify
    upower

    # own packages
    self.packages.${pkgs.system}.lightctl
    self.packages.${pkgs.system}.networkctl
    self.packages.${pkgs.system}.volumectl
    self.packages.${pkgs.system}.cliphist-fuzzel
  ];
}
