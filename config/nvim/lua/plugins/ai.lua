return {
  -- inline completion (ghost text) via Codestral FIM
  {
    "milanglacier/minuet-ai.nvim",
    event = "InsertEnter",
    config = function()
      require("minuet").setup {
        provider = "codestral",
        virtualtext = {
          auto_trigger_ft = { "*" },
          keymap = {
            accept = "<A-A>",
            accept_line = "<A-a>",
            accept_n_lines = "<A-z>",
            next = "<A-]>",
            prev = "<A-[>",
            dismiss = "<A-e>",
          },
        },
        provider_options = {
          codestral = {
            optional = {
              max_tokens = 256,
              stop = { "\n\n" },
            },
          },
        },
      }
    end,
  },

  -- agent chat + quick actions via the real OpenCode TUI/API
  {
    "nickjvandyke/opencode.nvim",
    lazy = false,
    config = function()
      -- bottom-split OpenCode TUI, toggled with <leader>o; also used by the
      -- plugin to start its server
      local panel = { win = nil, buf = nil }
      local function toggle_panel()
        if panel.win and vim.api.nvim_win_is_valid(panel.win) then
          vim.api.nvim_win_hide(panel.win)
          panel.win = nil
          return
        end
        vim.cmd "rightbelow vsplit"
        vim.cmd("vertical resize " .. math.max(40, math.floor(vim.o.columns * 0.3)))
        if not (panel.buf and vim.api.nvim_buf_is_valid(panel.buf)) then
          vim.cmd "term opencode"
          panel.buf = vim.api.nvim_get_current_buf()
          -- jk leaves terminal mode, same as their insert-mode escape;
          -- alt+h/l jump to the editor and back from inside the TUI
          vim.api.nvim_buf_set_keymap(panel.buf, "t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })
          vim.api.nvim_buf_set_keymap(panel.buf, "t", "<A-h>", "<C-\\><C-n><C-w>h", { desc = "Focus window left" })
          vim.api.nvim_buf_set_keymap(panel.buf, "t", "<A-l>", "<C-\\><C-n><C-w>l", { desc = "Focus window right" })
        else
          vim.cmd("buffer " .. panel.buf)
        end
        panel.win = vim.api.nvim_get_current_win()
      end

      vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Focus window left" })
      vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Focus window right" })

      vim.g.opencode_opts = {
        server = { start = toggle_panel },
      }

      local oc = require("opencode")
      vim.keymap.set({ "n", "x" }, "<leader>a", function()
        oc.ask "@this: "
      end, { desc = "OpenCode: ask about selection" })
      vim.keymap.set({ "n", "x" }, "<leader>o", toggle_panel, { desc = "OpenCode: toggle panel" })
      vim.keymap.set({ "n", "x" }, "<leader>as", function()
        oc.select()
      end, { desc = "OpenCode: prompt menu" })
      vim.keymap.set({ "n", "x" }, "<leader>ae", function()
        oc.ask "Explain @this and its context"
      end, { desc = "OpenCode: explain" })
      vim.keymap.set({ "n", "x" }, "<leader>ar", function()
        oc.ask "Review @this for correctness and readability"
      end, { desc = "OpenCode: review" })
      vim.keymap.set({ "n", "x" }, "<leader>af", function()
        oc.ask "Fix @diagnostics"
      end, { desc = "OpenCode: fix" })
      vim.keymap.set({ "n", "x" }, "<leader>at", function()
        oc.ask "Add tests for @this"
      end, { desc = "OpenCode: test" })
      vim.keymap.set({ "n", "x" }, "<leader>ao", function()
        oc.ask "Optimize @this for performance and readability"
      end, { desc = "OpenCode: optimize" })
    end,
  },
}
