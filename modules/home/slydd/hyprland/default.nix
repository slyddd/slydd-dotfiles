{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, return, exec, kitty"
        "$mod, b, exec, vivaldi"
      ];
    };
  };
}
