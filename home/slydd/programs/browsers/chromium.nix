{ pkgs, config, ... }:
let
  c = config.theme.colorscheme;

  hexToRgb =
    hex:
    let
      h = builtins.substring 1 6 hex;

      hexCharToInt =
        char:
        let
          map = {
            "0" = 0;
            "1" = 1;
            "2" = 2;
            "3" = 3;
            "4" = 4;
            "5" = 5;
            "6" = 6;
            "7" = 7;
            "8" = 8;
            "9" = 9;
            "a" = 10;
            "A" = 10;
            "b" = 11;
            "B" = 11;
            "c" = 12;
            "C" = 12;
            "d" = 13;
            "D" = 13;
            "e" = 14;
            "E" = 14;
            "f" = 15;
            "F" = 15;
          };
        in
        map.${char} or 0;

      toI =
        s:
        let
          first = hexCharToInt (builtins.substring 0 1 s);
          second = hexCharToInt (builtins.substring 1 1 s);
        in
        first * 16 + second;
    in
    [
      (toI (builtins.substring 0 2 h))
      (toI (builtins.substring 2 2 h))
      (toI (builtins.substring 4 2 h))
    ];

  chromiumTheme = pkgs.runCommand "matugen-chromium-theme" { } ''
        mkdir -p $out
        cat > $out/manifest.json <<EOF
    {
      "manifest_version": 2,
      "name": "Matugen Theme",
      "version": "1.0",
      "theme": {
        "colors": {
          "frame": ${builtins.toJSON (hexToRgb c.base)},
          "frame_inactive": ${builtins.toJSON (hexToRgb c.base)},
          "toolbar": ${builtins.toJSON (hexToRgb c.base)},
          "tab_text": ${builtins.toJSON (hexToRgb c.text)},
          "bookmark_text": ${builtins.toJSON (hexToRgb c.text)},
          "ntp_background": ${builtins.toJSON (hexToRgb c.base)},
          "ntp_text": ${builtins.toJSON (hexToRgb c.text)},
          "button_background": ${builtins.toJSON (hexToRgb c.accent)}
        }
      }
    }
    EOF
  '';
in
{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--ozone-platform-hint=auto"
      "--load-extension=${chromiumTheme}"
      "--disable-extensions-except=${chromiumTheme}"
    ];
  };
}
