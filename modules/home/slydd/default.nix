{
  pkgs,
  inputs,
  self,
  ...
}:
let
  androidSdk = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "9.0";
    buildToolsVersions = [ "34.0.0" ];
    platformVersions = [ "34" ];
    ndkVersion = "23.1.7779620";
    includeEmulator = false;
    includeSystemImages = false;
  };
in
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
    wl-clipboard-rs
    androidSdk.androidsdk

    teams-for-linux
    pwvucontrol
    spotify
    libcanberra-gtk3
    libnotify

    inputs.zen-browser.packages."${system}".default
    self.packages.${pkgs.system}.lightctl
    self.packages.${pkgs.system}.networkctl
    self.packages.${pkgs.system}.volumectl
    self.packages.${pkgs.system}.cliphist-fuzzel
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
