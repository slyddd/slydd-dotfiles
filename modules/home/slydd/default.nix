{
  pkgs,
  inputs,
  self,
  ...
}:
{
  home.packages = with pkgs; [
    neovim
    vivaldi
    enpass
    libreoffice
    package-version-server
    scrcpy
    unzip
    xorg.xev
    wev

    teams-for-linux
    pwvucontrol
    spotify
    libcanberra-gtk3
    libnotify

    inputs.zen-browser.packages."${system}".default
    self.packages.${pkgs.system}.lightctl
    self.packages.${pkgs.system}.networkctl
    self.packages.${pkgs.system}.volumectl
  ];

  imports = [
    # Configuration files
    ./programs
    ./services
    ./shell
    ./ui

    # Home directory configuration
    ./home.nix
    ./cursor.nix
  ];

  # Catppuccin v0.1.3
  theme =
    let
      extractcolors = import ../theme/extract-colors.nix {
        inherit pkgs;
        wallpaper = ./assets/wallpaper.jpg;
      };

      generatedColors = import "${extractcolors}/colors.nix";
    in
    {
      colorscheme = generatedColors;
      wallpaper = ./assets/wallpaper.jpg;
      logo = ./assets/logo.jpg;
      sounds = {
        notification = ./assets/sounds/notification.wav;
      };
    };
}
