{
  programs.zed-editor.userKeymaps = [
    {
      context = "Editor && vim_mode == normal";
      bindings = {
        "space e" = "project_panel::ToggleFocus";
        "space space" = "tab_switcher::Toggle";
        "space c" = "editor::ToggleComments";
      };
    }
    {
      context = "Editor && vim_mode == visual";
      bindings = {
        "space c" = "editor::ToggleComments";
      };
    }
    {
      context = "Workspace";
      bindings = {
        "shift shift" = "file_finder::Toggle";
        "ctrl-t" = "terminal_panel::ToggleFocus";
      };
    }
    {
      context = "ProjectPanel && not_editing";
      bindings = {
        "a" = "project_panel::NewFile";
        "d" = "project_panel::Delete";
        "r" = "project_panel::Rename";
        "y" = "project_panel::Copy";
        "p" = "project_panel::Paste";
        "x" = "project_panel::Cut";
      };
    }
    {
      context = "TabSwitcher";
      bindings = {
        "j" = "tab_switcher::Toggle";
        "x" = "tab_switcher::CloseSelectedItem";
        "k" = [
          "tab_switcher::Toggle"
          {
            select_last = true;
          }
        ];
      };
    }
  ];
}
