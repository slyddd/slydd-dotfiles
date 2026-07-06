local mainMod = "SUPER"

-- Window Binds
hl.bind(mainMod .. " + W", hl.dsp.window.close())

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
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(mainMod .. " + LEFT", hl.dsp.layout("focus left"))
hl.bind(mainMod .. " + RIGHT", hl.dsp.layout("focus right"))
hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.layout("swapcol r"))

hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.layout("promote"))

hl.bind(mainMod .. " + T", hl.dsp.window.pin())

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
