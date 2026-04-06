{ pkgs, ... }:
let
  wallpaper = ./assets/background.jpg;
  schemeType = "scheme-neutral";
  logo = ./assets/logo.jpg;

  generatedColors = import ../theme/getColors.nix {
    inherit pkgs;
    wallpaper = wallpaper;
    mode = "dark";
    schemeType = schemeType;
  };
in
{
  imports = [
    ./home.nix
    ./cursor.nix

    ./ui
    ./shell
    ./programs
  ];

  home.file.".face".source = logo;
  home.file.".face.icon".source = logo;

  theme = {
    colorscheme = generatedColors;
    schemeType = schemeType;
    wallpaper = wallpaper;
    logo = logo;
  };
}
