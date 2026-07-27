-- `conform.nvim` using vim.pack
--
-- Lightweight yet powerful formatter plugin for Neovim
--
-- https://github.com/stevearc/conform.nvim
--
-- Check supported formatters by `:h conform-formatters`, or visit
--    https://github.com/stevearc/conform.nvim#formatters
--
-- New Commands:
--    :ConformInfo  - check formatter status
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo("stevearc/conform.nvi")
})

--- Setup ---
require("conform").setup({
  -- set formatters
  formatters_by_ft = {
    markdown = { "prettierd" },
    json = { "prettierd" },
    sh = { "shfmt" },
    zsh = { "shfmt" },
    fish = { "fish_indent" },
  },

  -- additional settings
  formatters = {
    -- set bash/zsh indent to % spaces
    shfmt = {
      append_args = { "-i", "2" },
    },
  }
})


--- Keymaps ---
local Conform = require("conform")

-- format buffer
vim.keymap.set({ 'n', 'x', 'i' }, "<A-F>", function()
  -- only format filetypes in `formatters_by_ft` list
  if #Conform.list_formatters(0) > 0 then
    Conform.format({ async = true })
  else
    vim.lsp.buf.format({ async = true })
  end

  -- notify formatting message
  local filepath = vim.fn.expand("%")
  vim.notify(filepath .. " formatted (or failed).")
end, { remap = true, desc = 'Format Buffer' })
