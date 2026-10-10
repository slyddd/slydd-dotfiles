return { 'RRethy/base16-nvim',
  lazy = false,
  config = function()
    local apply = function()
      local ok, matugen = pcall(require, 'matugen')
      if ok then matugen.setup() end
    end

    -- base46 reapplies its palette after lazy.setup (build hook) and on each
    -- User FilePost (gitsigns, treesitter, ...); reapply on top so the
    -- matugen theme wins.
    local grp = vim.api.nvim_create_augroup('matugen-apply', { clear = true })
    vim.api.nvim_create_autocmd('VimEnter', { group = grp, callback = apply })
    vim.api.nvim_create_autocmd('User', { group = grp, pattern = 'FilePost', callback = apply })
    apply()
    vim.schedule(apply)
  end,
}
