{
  programs.zed-editor.userKeymaps = [
    {
      context = "Editor && vim_mode == normal";
      bindings = {
        "space e" = "project_panel::ToggleFocus";
      };
    }
    {
      context = "Workspace";
      bindings = {
        "shift shift" = "file_finder::Toggle";
      };
    }
  ];
}
