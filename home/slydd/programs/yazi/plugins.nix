{ pkgs, ... }:

let
  office = pkgs.stdenvNoCC.mkDerivation {
    pname = "office.yazi";
    version = "41ebef8";
    src = pkgs.fetchFromGitHub {
      owner = "macydnah";
      repo = "office.yazi";
      rev = "41ebef8";
      sha256 = "sha256-QFto48D+Z8qHl7LHoDDprvr5mIJY8E7j37cUpRjKdNk=";
    };
    dontBuild = true;
    installPhase = ''
      mkdir -p $out
      cp -R $src/. $out/
      if [ -f "$out/main.lua" ] && [ ! -f "$out/init.lua" ]; then
        cp "$out/main.lua" "$out/init.lua"
      fi
    '';
  };
in
{
  programs.yazi.plugins = {
    inherit (pkgs.yaziPlugins)
      mount
      mime-ext
      full-border
      yatline
      yatline-catppuccin
      yatline-githead
      starship
      vcs-files
      ouch
      mediainfo
      rich-preview
      ;

    office = office;
  };
}
