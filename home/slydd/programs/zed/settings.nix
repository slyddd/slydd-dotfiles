{ ... }:
{
  programs.zed-editor.userSettings = {
    autosave = "off";
    restore_on_startup = "empty_tab";

    buffer_font_features.calt = true;

    buffer_font_size = 12;
    buffer_font_family = "FiraCode Nerd Font";

    ui_font_size = 14;
    ui_font_family = "Roboto";

    vim_mode = true;
    diagnostics.inline.enabled = true;

    scrollbar.show = "never";
    toolbar = {
      quick_actions = false;
      selections_menu = false;
      agent_review = false;
    };

    tab_size = 2;

    agent = {
      inline_assistant_model = {
        provider = "copilot_chat";
        model = "gpt-4.1";
      };
      default_model = {
        provider = "copilot_chat";
        model = "gpt-5-mini";
      };
      model_parameters = [ ];
    };

    edit_predictions.provider = "copilot";

    project_panel = {
      button = false;
      default_width = 200;
      indent_size = 10;
      scrollbar.show = "never";
    };

    languages.Nix = {
      language_servers = [ "nil" ];
      formatter.external.command = "nixfmt";
      format_on_save = "on";
    };

    vim = {
      toggle_relative_line_numbers = true;
      use_system_clipboard = "always";
    };

    semantic_tokens = "combined";

    terminal = {
      blinking = "on";
      line_height = "comfortable";
      scrollbar.show = "never";
    };

    lsp = {
      eslint.settings.rulesCustomizations = [
        {
          rule = "prettier";
          severity = "warn";
        }
      ];
      package-version-server.binary.path = "package-version-server";
    };
  };
}
