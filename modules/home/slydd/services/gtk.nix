{ pkgs, config, ... }:
{
  gtk = {
    enable = true;
    font = {
      package = pkgs.geist-font;
      name = "Geist";
      size = 9;
    };

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
  dconf.settings = {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/desktop/sound".event-sounds = true;
  };
}
