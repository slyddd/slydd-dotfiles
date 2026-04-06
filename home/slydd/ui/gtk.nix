{ config, pkgs, ... }:
let
  pointer = config.home.pointerCursor;
in
{
  gtk = {
    enable = true;

    theme =
      let
        orchis = pkgs.orchis-theme.override {
          border-radius = 5;
          tweaks = [
            "compact"
            "black"
            "macos"
          ];
        };
      in
      {
        name = "Orchis-Dark";
        package = orchis;
      };

    iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
    };

    cursorTheme = {
      name = pointer.name;
      size = pointer.size;
      package = pkgs.bibata-cursors;
    };

    font = {
      name = "Roboto";
      size = 10;
    };

    gtk2 = {
      extraConfig = "gtk-application-prefer-dark-theme = true";
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    };

    gtk3 = {
      bookmarks = [
        "file://${config.home.homeDirectory}/Dev"
        "file://${config.home.homeDirectory}/Documents"
        "file://${config.home.homeDirectory}/Downloads"
        "file://${config.home.homeDirectory}/Music"
        "file://${config.home.homeDirectory}/Pictures"
        "file://${config.home.homeDirectory}/Videos"
      ];
      extraConfig.gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  xdg.configFile."gtk-3.0/gtk.css".text = ''@import url("dank-colors.css");'';
  xdg.configFile."gtk-4.0/gtk.css".text = ''@import url("dank-colors.css");'';

  dconf.settings = {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/desktop/sound".event-sounds = true;
  };
}
