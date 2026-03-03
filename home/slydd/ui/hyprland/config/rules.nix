{ ... }:
{
  wayland.windowManager.hyprland.extraConfig = ''
    layerrule {
      name = disable-animations-om-dms
      match:namespace = ^(dms)$
      no_anim = on
    }

    windowrule {
      name = pretty-fullscreen
      match:fullscreen = true
      no_dim = on
      no_blur = on
      opaque = on
    }

    windowrule {
      name = pretty-sticky
      match:pin = true
      no_dim = on
      no_blur = on
      opaque = on
    }

    windowrule {
      name = float-blueman-manager
      match:class = ^(blueman-manager|nemo|yazi|fkitty)$
      float = on
      size = 900 500
    }

    windowrule {
      name = float-dms
      match:class = ^(org\.quickshell)$
      float = on
    }
  '';
}
