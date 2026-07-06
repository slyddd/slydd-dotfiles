local mainMod = "SUPER"

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
