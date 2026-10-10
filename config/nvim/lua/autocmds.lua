require "nvchad.autocmds"

-- Noctalia sends SIGUSR1 after regenerating lua/matugen.lua; recompile base46
-- so the UI follows the new theme (matugen.lua reapplies its base16 colors).
local sig = vim.uv.new_signal()
sig:start("sigusr1", vim.schedule_wrap(function()
  pcall(function() require("base46").load_all_highlights() end)
end))
