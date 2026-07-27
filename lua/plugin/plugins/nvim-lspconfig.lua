-- `nvim-lspconfig` using vim.pack
-- 
-- Quickstart configs for nvim LSP
--
-- https://github.com/neovim/nvim-lspconfig
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo("neovim", "nvim-lspconfig")
})
