{
  programs.zed-editor.userSettings = {
    autosave = "off";
    restore_on_startup = "none";

    buffer_font_features.calt = true;

    buffer_font_size = 11;
    buffer_font_family = "FiraCode Nerd Font";

    vim_mode = true;
    diagnostics.inline.enabled = true;

    scrollbar.show = "never";
    tab_bar.show = false;
    toolbar = {
      breadcrumbs = false;
      quick_actions = false;
      selections_menu = false;
      agent_review = false;
    };

    tab_size = 2;

    assistant = {
      enabled = true;
      version = "2";
      default_open_ai_model = "gpt-4o";
      default_model = {
        provider = "copilot_chat";
        model = "gpt-4o";
      };
    };

    project_panel = {
      button = false;
      default_width = 200;
      indent_size = 10;
      scrollbar.show = null;
    };

    theme = "Catppuccin Mocha";
    icon_theme = "Material Icon Theme";

    languages = {
      Nix = {
        language_servers = [
          "nil"
        ];
        formatter = {
          external = {
            command = "nixfmt";
          };
        };
        format_on_save = "on";
      };
    };

    vim = {
      toggle_relative_line_numbers = true;
      use_system_clipboard = "always";
    };
  };
}
