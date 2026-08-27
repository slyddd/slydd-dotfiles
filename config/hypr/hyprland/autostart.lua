hl.on("hyprland.start", function()
  -- Start Utils
  hl.exec_cmd("kdeconnect-indicator")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")

  -- Poolkit agent
  hl.exec_cmd("systemctl --user start hyprpolkitagent")

  -- Start ui apps
  hl.exec_cmd("waybar")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("swayosd-server")
  hl.exec_cmd("mako")
end)
