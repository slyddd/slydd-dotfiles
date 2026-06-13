hl.on("hyprland.start", function()
  -- Initialize D-Bus session
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- Start xdg-desktop-portal main service
  hl.exec_cmd("sleep 0.5 && /usr/lib/xdg-desktop-portal &")
  hl.exec_cmd("sleep 1 && /usr/lib/xdg-desktop-portal-hyprland &")

  -- Start noctalia shell
  hl.exec_cmd("qs -c noctalia-shell")
end)
