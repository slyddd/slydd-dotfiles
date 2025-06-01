{ pkgs, ... }:
{

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
