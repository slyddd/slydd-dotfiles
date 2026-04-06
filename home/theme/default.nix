{ lib, ... }:
let
  inherit (lib) mkOption;
  inherit (lib.types) attrsOf path str;
in
{
  options.theme = {
    colorscheme = mkOption {
      type = attrsOf str;
      description = "Colors from wallpaper";
    };

    schemeType = mkOption {
      type = str;
      default = "scheme-neutral";
      description = "Scheme type";
    };

    wallpaper = mkOption {
      type = path;
      description = ''
        Wallpaper image.
      '';
    };

    logo = mkOption {
      type = path;
      description = ''
        Logo image.
      '';
    };
  };
}
