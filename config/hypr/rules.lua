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

--- Blur noctalia
hl.layer_rule({
  name         = "noctalia",
  match        = { namespace = "noctalia-background-.*$" },
  blur         = true,
  ignore_alpha = 0.5,
  blur_popups  = true,
})

--- Smart gaps
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })

--- Floating windows
hl.window_rule({
  name   = "floating-windows",
  match  = { class = "Bitwarden|com.saivert.pwvucontrol|blueman-manager" },
  float  = true,
  center = true,
  pin    = true,
})
