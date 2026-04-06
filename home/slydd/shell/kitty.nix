{ ... }:
{
  programs.kitty = {
    enable = true;

    extraConfig = ''
      include dank-tabs.conf
      include dank-theme.conf
    '';

    font = {
      name = "FiraCode Nerd Font";
      size = 9.0;
    };

    shellIntegration.enableZshIntegration = true;

    settings = {

      detect_urls = "yes";
      url_style = "curly";

      shell = "zsh";
      enable_audio_bell = "no";

      # Cursor Settings
      cursor_shape = "beam";
      cursor_beam_thickness = 0.8;
      cursor_blink_interval = "1 ease-in-out";
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.2";
      cursor_trail_start_threshold = 1;

      # ScrollBack
      scrollback_lines = 500;
      scrollback_indicator_opacity = 0.0;

      # UI
      background_opacity = 0.9;
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

      # Mouse
      mouse_hide_wait = 3.0;

      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = "yes";
    };

    keybindings = {
      "ctrl+left" = "neighboring_window left";
      "ctrl+right" = "neighboring_window right";
      "ctrl+up" = "neighboring_window up";
      "ctrl+down" = "neighboring_window down";
      "ctrl+shift+z" = "toggle_layout stack";
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+t" = "new_tab_with_cwd";
    };
  };
}
