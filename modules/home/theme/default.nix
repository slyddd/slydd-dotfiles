# --------------------------------------------------------------------------
# DESCRIPTION: A modified version of theme module created by raexera
# AUTHOR ORIGINAL: raexera
# GITHUB: github.com/raexera
# FILE: https://github.com/raexera/yuki/blob/main/home/modules/theme/default.nix
# --------------------------------------------------------------------------

{ lib, ... }:
let
  inherit (lib) mkOption;
  inherit (lib.types) attrsOf path str;
in
{
  options.theme = {
    colorscheme = mkOption {
      type = attrsOf str;
      description = "Base, accent y text colors from wallpaper";
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

    sounds = mkOption {
      type = attrsOf path;
      default = { };
      description = ''
        Sounds to be used in the system.
        The keys are the sound names and the values are the paths to the sound files.
      '';
    };
  };
}
