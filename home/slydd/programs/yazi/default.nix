{ pkgs, ... }:

{
  imports = [
    ./plugins.nix
    ./settings.nix
    ./keymap.nix
  ];

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";

    initLua = ''
      require("full-border"):setup()

      local catppuccin_theme = require("yatline-catppuccin"):setup("mocha")
      require("yatline"):setup({ theme = catppuccin_theme })
      require("yatline-githead"):setup()

      require("starship"):setup()
    '';

    extraPackages = with pkgs; [
      file
      xdg-utils

      poppler-utils
      p7zip

      ffmpeg
      ffmpegthumbnailer
      mediainfo

      rich-cli

      libreoffice

      jq
      fd
      ripgrep
      fzf
      zoxide
      resvg
      imagemagick
    ];
  };
}
