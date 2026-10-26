-- `efmls-configs-nvim` using vim.pack
--
-- An unofficial collection of linters and formatters configured for efm-langserver for neovim.
--
-- https://github.com/creativenull/efmls-configs-nvim
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo('creativenull/efmls-configs-nvim')
})
