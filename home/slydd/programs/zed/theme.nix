{ config, ... }:
{
  programs.zed-editor.userSettings =
    let
      c = config.theme.colorscheme;

      bg = c.base;
      accent = c.accent;
      muted = c.secondary or c.accent;

      aMain = "D7";
      aSurf = "D0";
      aElem = "A0";
      aAct = "B0";

      themeName = "Catppuccin Mocha (Blur)";
    in
    {
      theme = themeName;
      icon_theme = "Material Icon Theme";

      theme_overrides = {
        ${themeName} = {
          "background.appearance" = "blurred";
          "background" = "#${builtins.substring 1 6 bg}${aMain}";
          "status_bar.background" = "#${builtins.substring 1 6 bg}${aMain}";
          "title_bar.background" = "#${builtins.substring 1 6 bg}${aMain}";
          "surface.background" = "#${builtins.substring 1 6 bg}${aSurf}";

          "panel.background" = "#00000000";
          "panel.overlay_background" = bg;
          "tab_bar.background" = "#00000000";
          "toolbar.background" = "#00000000";
          "terminal.background" = "#00000000";
          "editor.background" = "#00000000";
          "editor.gutter.background" = "#00000000";

          "tab.active_background" = "#${builtins.substring 1 6 bg}${aAct}";
          "ghost_element.hover" = "#${builtins.substring 1 6 bg}${aAct}";
          "ghost_element.selected" = "#${builtins.substring 1 6 accent}${aElem}";
          "drop_target.background" = "#${builtins.substring 1 6 accent}${aElem}";

          "editor.active_line_number" = "#${builtins.substring 1 6 accent}${aAct}";
          "editor.line_number" = "#${builtins.substring 1 6 muted}${aElem}";
          accents = [
            accent
            muted
          ];
        };
      };
    };
}
