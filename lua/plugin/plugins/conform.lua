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
  get_repo("stevearc/conform.nvim")
})

--- Setup ---

local Conform = require("conform")

-- set formatters
Conform.setup({
  formatters_by_ft = {
    -- shell
    sh = { "shfmt" },
    zsh = { "shfmt" },
    fish = { "fish_indent" },
    -- languages
    markdown = { "rumdl" },
    python = { "ruff_format" },
    -- all-in-one (prettier/oxfmt)
    css = { "oxfmt" },
    html = { "oxfmt" },
    javascript = { "oxfmt" },
    javascriptreact = { "oxfmt" },
    typescript = { "oxfmt" },
    typescriptreact = { "oxfmt" },
    json = { "oxfmt" },
    vue = { "oxfmt" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  -- format on save when `vim.g.format_on_save` is enabled
  format_on_save = function(_)
    if not vim.g.format_on_save then
      return nil
    end
    return {
      timeout_ms = 500,
      lsp_format = "fallback",
    }
  end,
})

-- formatter additional configs
Conform.formatters = {
  shfmt = {
    -- set bash/zsh indent to % spaces
    append_args = { "-i", "2" },
  }

}


--- Keymaps ---

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
