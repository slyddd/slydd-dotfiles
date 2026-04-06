{ ... }:
{
  programs.yazi.keymap.mgr.prepend_keymap = [
    {
      on = [
        "g"
        "c"
      ];
      run = "plugin vcs-files";
      desc = "Git changes (vcs-files)";
    }
    {
      on = "M";
      run = "plugin mount";
      desc = "Mount / unmount";
    }
  ];
}
