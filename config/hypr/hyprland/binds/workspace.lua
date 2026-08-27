for i = 1, 6 do
  local key = i % 6
  hl.bind(MainMod .. " + " .. key, hl.dsp.focus({ workspace = "m~" .. i, on_current_monitor = true }))
  hl.bind(MainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = "m~" .. i }))
end

-- Special workspace (scratchpad)
hl.bind(MainMod .. " + S", hl.dsp.workspace.toggle_special("minimize"))
hl.bind(MainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:minimize" }))
hl.bind(MainMod .. " + CTRL + S", function()
  hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
  hl.dispatch(hl.dsp.window.move({ workspace = "+0" }))
  hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
  hl.dispatch(hl.dsp.window.move({ workspace = "special:minimize" }))
  hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
end)

-- Scroll through existing workspaces with MainMod + scroll
hl.bind(MainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(MainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(MainMod .. " + Prior", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MainMod .. " + Next", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(MainMod .. " + SHIFT + Prior", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(MainMod .. " + SHIFT + Next", hl.dsp.window.move({ workspace = "e-1" }))
