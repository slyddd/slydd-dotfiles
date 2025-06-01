{ config, ... }:
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
      default_open_ai_model = "gpt-4.1";
      default_model = {
        provider = "copilot_chat";
        model = "gpt-4.1";
      };
    };

    features = {
      edit_prediction_provider = "copilot";
    };

    project_panel = {
      button = false;
      default_width = 200;
      indent_size = 10;
      scrollbar.show = null;
    };

    theme =
      let
        inherit (config.theme.colorscheme) mode;

        theme = if mode == "dark" then "Catppuccin Mocha (Blur)" else "Catppuccin Latte (Blur)";
      in
      theme;

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

    "experimental.theme_overrides" =
      let
        inherit (config.theme) colorscheme;
      in
      {
        background = "${colorscheme.base}CC";
        "surface.background" = "${colorscheme.base}CC";
        "status_bar.background" = "${colorscheme.base}CC";
        "title_bar.background" = "${colorscheme.base}CC";
      };

    terminal = {
      alternate_scroll = "off";
      blinking = "terminal_controlled";
      copy_on_select = false;
      dock = "bottom";
      default_width = 640;
      default_height = 320;
      detect_venv = {
        on = {
          directories = [
            ".env"
            "env"
            ".venv"
            "venv"
          ];
          activate_script = "default";
        };
      };
      env = {
        TERM = "kitty";
      };
      line_height = "comfortable";
      button = true;
      shell = {
        program = "zsh";
      };
      toolbar = {
        breadcrumbs = false;
        title = true;
      };
      working_directory = "current_project_directory";
      scrollbar = {
        show = null;
      };
    };

    lsp = {
      eslint = {
        settings = {
          rulesCustomizations = [
            {
              rule = "prettier";
              severity = "warn";
            }
          ];
        };
      };

      package-version-server = {
        binary = {
          path = "package-version-server";
        };
      };
    };
  };
}
