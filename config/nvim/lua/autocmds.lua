require "nvchad.autocmds"

-- nvim <dir>: cd into the argument so the file tree roots there
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    if vim.fn.isdirectory(data.file) == 1 then
      vim.cmd.cd(data.file)
      vim.cmd.enew()
    end
  end,
})

-- Noctalia sends SIGUSR1 after regenerating lua/matugen.lua; recompile base46
-- so the UI follows the new theme (matugen.lua reapplies its base16 colors).
local sig = vim.uv.new_signal()
sig:start("sigusr1", vim.schedule_wrap(function()
  pcall(function() require("base46").load_all_highlights() end)
end))
