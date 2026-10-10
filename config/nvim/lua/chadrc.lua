-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "noctalia",
  transparency = false,

  -- base46 paints the file tree panel darker (darker_black); keep it
  -- consistent with the editor background
  hl_override = {
    NvimTreeNormal = { bg = "black" },
    NvimTreeNormalNC = { bg = "black" },
    NvimTreeEndOfBuffer = { fg = "black", bg = "black" },
    NvimTreeWinSeparator = { fg = "black", bg = "black" },
  },
}

M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
