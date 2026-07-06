local mainMod = "SUPER"

local function getCords(direction, velocity)
  local x = 0
  local y = 0

  if direction == "up" then
    y = -velocity
  elseif direction == "down" then
    y = velocity
  elseif direction == "left" then
    x = -velocity
  elseif direction == "right" then
    x = velocity
  end

  return { x = x, y = y, relative = true }
end

hl.bind(mainMod .. " + R", function()
  hl.dispatch(hl.dsp.window.float({ action = "enable" }))
  hl.dispatch(hl.dsp.submap("resize"))
end)

hl.define_submap("resize", function()
  local keys = {
    h = "left",
    j = "down",
    k = "up",
    l = "right",
  }

  for key, value in pairs(keys) do
    -- VI MODE
    hl.bind(key, hl.dsp.window.resize(getCords(value, 10)), { repeating = true })
    hl.bind("SHIFT + " .. key, hl.dsp.window.resize(getCords(value, 30)), { repeating = true })
    hl.bind("CTRL + " .. key, hl.dsp.window.resize(getCords(value, 5)), { repeating = true })

    -- NORMAL MODE
    hl.bind(value, hl.dsp.window.resize(getCords(value, 10)), { repeating = true })
    hl.bind("SHIFT + " .. value, hl.dsp.window.resize(getCords(value, 30)), { repeating = true })
    hl.bind("CTRL + " .. value, hl.dsp.window.resize(getCords(value, 5)), { repeating = true })
  end

  hl.bind("Space", hl.dsp.submap("move"))

  hl.bind("Escape", hl.dsp.submap("reset"))
end)
