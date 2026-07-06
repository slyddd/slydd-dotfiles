hl.on("hyprland.start", function()
  -- Initialize D-Bus session
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- Start xdg-desktop-portal main service
  hl.exec_cmd("sleep 0.5 && /usr/lib/xdg-desktop-portal &")
  hl.exec_cmd("sleep 1 && /usr/lib/xdg-desktop-portal-hyprland &")

  -- Start Utils
  hl.exec_cmd("kdeconnect-indicator")
  hl.exec_cmd("bitwarden-desktop")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprsunset")

  -- Poolkit agent
  hl.exec_cmd("systemctl --user start hyprpolkitagent")

  -- Start ui apps
  hl.exec_cmd("waybar")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("swayosd-server")
end)
