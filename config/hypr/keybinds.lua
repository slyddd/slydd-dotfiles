local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

-- Default programs
local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "hyprlauncher"
local browser     = "zen-browser"
local monitor     = "kitty -e btop"
local noctalia    = "qs -c noctalia-shell ipc call "

-- Noctalia
hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd(noctalia .. "launcher toggle"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctalia .. "launcher clipboard"))
hl.bind(mainMod .. " + Period", hl.dsp.exec_cmd(noctalia .. "launcher emoji"))
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd(noctalia .. "sessionMenu toggle"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(noctalia .. "lockScreen lock"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(noctalia .. "sessionMenu lockAndSuspend"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(noctalia .. "systemMonitor toggle"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(noctalia .. "settings open"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(noctalia .. "controlCenter toggle"))

--- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctalia .. "volume increase"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctalia .. "volume decrease"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctalia .. "volume muteOutput"))
hl.bind(mainMod .. " + XF86AudioMute", hl.dsp.exec_cmd(noctalia .. "volume openPanel"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctalia .. "volume muteInput"))

--- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctalia .. "brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctalia .. "brightness decrease"), { locked = true, repeating = true })

--- Keyboard Brightness
hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctalia .. "brightness increase"))
hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd(noctalia .. "brightness decrease"))
hl.bind("SHIFT + XF86AudioMute", hl.dsp.exec_cmd(noctalia .. "nightLight toggle"))

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })


-- App Binds
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd(monitor))

-- Window Binds
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + F", function()
  local w = hl.get_active_window()
  if w == nil then
    return
  end
  local layout = w.layout
  if layout == nil then
    return
  end
  local width = layout.column.width
  if width == 1.0 then
    hl.dispatch(hl.dsp.layout("colresize 0.5"))
  else
    hl.dispatch(hl.dsp.layout("colresize 1"))
  end
end)
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 6 do
  local key = i % 6
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("minimize"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:minimize" }))
hl.bind(mainMod .. " + CTRL + S", function()
  hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
  hl.dispatch(hl.dsp.window.move({ workspace = "+0" }))
  hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
  hl.dispatch(hl.dsp.window.move({ workspace = "special:minimize" }))
  hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
end)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--- Zoom
local zoom = {}

function zoom:toggle(state)
  hl.config({ cursor = { zoom_factor = state and 1.5 or 1 } })
end

function zoom:set(offset)
  local current = hl.get_config("cursor.zoom_factor") + (offset or 0)
  current = math.max(1, math.min(3, current))
  hl.config({ cursor = { zoom_factor = current } })
end

hl.bind(mainMod .. " + Z", function()
  zoom:toggle(true)
  hl.dispatch(hl.dsp.submap("zoom"))
end)

hl.define_submap("zoom", function()
  hl.bind("XF86AudioRaiseVolume", function() zoom:set(0.5) end)
  hl.bind("XF86AudioLowerVolume", function() zoom:set(-0.5) end)
  hl.bind(mainMod .. " + Z", function()
    zoom:toggle(false)
    hl.dispatch(hl.dsp.submap("reset"))
  end)
end)
