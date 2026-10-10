-- base46 theme fed by the Noctalia/matugen colors in lua/matugen.lua,
-- parsed at compile time so Noctalia theme changes propagate.
local M = {}

local path = vim.fn.resolve(vim.fn.stdpath "config" .. "/lua/matugen.lua")
local colors = {}
for _, line in ipairs(vim.fn.readfile(path)) do
  local k, v = line:match "base(%x%x)%s*=%s*['\"](#%x%x%x%x%x%x)['\"]"
  if k then colors["base" .. k:upper()] = v end
end

-- fresh clones lack the generated file; fall back to a builtin palette
if vim.tbl_isempty(colors) then
  colors = require("base46.themes.espresso").base_16
end

local l = require("base46.colors").change_hex_lightness

M.base_16 = colors

M.base_30 = {
  white         = colors.base05,
  darker_black  = l(colors.base00, -6),
  black         = colors.base00,
  black2        = colors.base01,
  one_bg        = l(colors.base00, 10),
  one_bg2       = l(colors.base01, 8),
  one_bg3       = l(colors.base02, 6),
  grey          = l(colors.base00, 17),
  grey_fg       = colors.base03,
  grey_fg2      = l(colors.base03, 5),
  light_grey    = l(colors.base03, 25),
  red           = colors.base08,
  baby_pink     = l(colors.base08, 30),
  pink          = l(colors.base08, 15),
  line          = l(colors.base00, 15),
  green         = colors.base0B,
  vibrant_green = l(colors.base0B, 8),
  nord_blue     = colors.base0D,
  blue          = colors.base0D,
  yellow        = colors.base0A,
  sun           = l(colors.base0A, 8),
  purple        = colors.base0E,
  dark_purple   = l(colors.base0E, -8),
  teal          = colors.base0C,
  orange        = colors.base09,
  cyan          = colors.base0C,
  statusline_bg = l(colors.base00, 2),
  lightbg       = colors.base01,
  pmenu_bg      = colors.base0D,
  folder_bg     = colors.base0D,
}

M.type = "dark"

M = require("base46").override_theme(M, "noctalia")

return M
