-- `conform.nvim` using vim.pack
--
-- Lightweight yet powerful formatter plugin for Neovim
--
-- Check supported formatters by `:h conform-formatters`, or visit
--    https://github.com/stevearc/conform.nvim#formatters
--
-- New Commands:
--    :ConformInfo  - check formatter status
--

vim.pack.add({
  'https://github.com/stevearc/conform.nvim'
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
    vim.lsp.buf.format()
  end

  -- notify formatting message
  local filepath = vim.fn.expand("%")
  vim.notify(filepath .. " formatted (or failed).")
end, { remap = true, desc = 'Format Buffer' })
