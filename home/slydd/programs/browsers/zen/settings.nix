{ config, ... }:
{
  programs.zen-browser.profiles.default = {
    settings = {
      browser = {
        warnOnQuit = false;
        startup.page = 1;
        ctrlTab.sortByRecentlyUsed = true;
      };
      layout.css.prefers-color-scheme.content-override = 0;
      font = {
        name.sans-serif.x-western = "Roboto";
        size.variable.x-western = 13;
      };
      zen.view = {
        use-single-toolbar = false;
        sidebar-expanded = false;

        compact = {
          hide-tabbar = true;
          hide-toolbar = true;
        };
      };
      toolkit.legacyUserProfileCustomizations.stylesheets = true;
    };

    userChrome = ''
      @import url("file://${config.xdg.configHome}/DankMaterialShell/zen.css");
    '';
  };
}
