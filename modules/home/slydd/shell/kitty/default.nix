{ config, ... }:
let
  inherit (config.theme) colorscheme;

  theme = if colorscheme.mode == "dark" then "Catppuccin-Mocha" else "Catppuccin-Latte";
in
{
  programs.kitty = {
    enable = true;

    font = {
      name = "Fira Code Nerd Font";
      size = 9;
    };

    themeFile = theme;

    shellIntegration.enableZshIntegration = true;

    settings = {

      # Cursor Settings
      cursor_shape = "beam";
      cursor_blink = true;
      cursor_beam_thickness = 0.8;
      cursor_blink_interval = "1 ease-in-out";
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.2";
      cursor_trail_start_threshold = 1;

      # ScrollBack
      scrollback_lines = 500;
      scrollback_indicator_opacity = 0.0;

      # UI
      background_opacity = 0.8;
      background = colorscheme.base;
      foreground = colorscheme.text;
      background_blur = 1;
      window_padding_width = 20;

      # Tabs
      tab_bar_edge = "bottom";
      tab_bar_margin_height = "2.0 2.0";
      tab_bar_style = "powerline";
      tab_bar_align = "center";
      tab_powerline_style = "round";
      tab_title_template = "{activity_symbol}{fmt.fg.tab}{tab.last_focused_progress_percent}{title}";
      tab_bar_background = "none";

    };
  };
}
