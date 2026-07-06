--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
  --- Fix some dragging issues with XWayland
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

--- Remove opacity on fullscreen inactive
hl.window_rule({
  name    = "fullscreen-opacity",
  match   = { fullscreen = true },
  opacity = 1.0,
  no_dim  = true,
})

--- Blur Rofi
hl.layer_rule({
  name         = "rofi",
  match        = { namespace = "rofi" },
  blur         = true,
  ignore_alpha = 0.5,
  blur_popups  = true,
  dim_around   = true
})

--- Smart gaps
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })

--- Floating windows
local floating_windows = {
  "Bitwarden",
  "com.saivert.pwvucontrol",
  "blueman-manager",
  "org.kde.kdeconnect.app",
  "waypaper",
  "nm-connection-editor"
}
hl.window_rule({
  name   = "floating-windows",
  match  = { class = table.concat(floating_windows, "|") },
  float  = true,
  center = true,
  pin    = true,
  size   = { 500, 500 },
})

--- Decrease opacity on zen browser
hl.window_rule({
  name    = "zen-browser",
  match   = { class = "zen" },
  opacity = 0.98,
})

--- Persistend workspaces
for i = 1, 5 do
  hl.workspace_rule({
    workspace  = string.format(i),
    persistent = true,
  })
end

--- blur waybar
hl.layer_rule({
  name         = "waybar",
  match        = { class = "waybar" },
  blur         = true,
  blur_popups  = true,
  ignore_alpha = 0.2,
})
