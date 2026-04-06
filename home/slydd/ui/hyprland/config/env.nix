{config, ...}:
{
  wayland.windowManager.hyprland.settings =
    let
      pointer = config.home.pointerCursor;
    in
    {
      env = [
        "CLUTTER_BACKEND,wayland"
        "GDK_BACKEND,wayland,x11,*"
        "SDL_VIDEODRIVER,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_STYLE_OVERRIDE,kvantum"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "GTK_THEME,${config.gtk.theme.name}"
        "XCURSOR_THEME,${pointer.name}"
        "XCURSOR_SIZE,${toString pointer.size}"
        "GRIMBLAST_HIDE_CURSOR,0"
      ];
    };
}
