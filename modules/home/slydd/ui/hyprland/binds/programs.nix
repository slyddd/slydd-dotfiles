{
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$browser" = "vivaldi";

    bindd = [
      "$mod, return, Open terminal, exec, $terminal"
      "$mod, b, Open browser, exec, $browser"
      "$mod, SUPER_L, Open menu, exec, fuzzel"
      "$mod, v, Open Clipboard Manager, exec, cliphist-fuzzel"

      "$mod ALT, e, Open File Manager, exec, nemo"
      "$mod, e, Open File Manager (Terminal), exec, $terminal -e yazi"

      "$mod, l, Lock screen, exec, hyprlock"
      "$mod, c, Color Picker, exec, hyprpicker -a"
    ];
  };
}
