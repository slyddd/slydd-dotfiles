-- Window Binds
hl.bind(MainMod .. " + W", hl.dsp.window.close())

hl.bind(MainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(MainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(MainMod .. " + LEFT", hl.dsp.layout("focus left"))
hl.bind(MainMod .. " + RIGHT", hl.dsp.layout("focus right"))
hl.bind(MainMod .. " + SHIFT + LEFT", hl.dsp.layout("swapcol l"))
hl.bind(MainMod .. " + SHIFT + RIGHT", hl.dsp.layout("swapcol r"))

hl.bind(MainMod .. " + SHIFT + UP", hl.dsp.layout("promote"))

hl.bind(MainMod .. " + T", hl.dsp.window.pin())

-- Move/resize windows with MainMod + LMB/RMB and dragging
hl.bind(MainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
