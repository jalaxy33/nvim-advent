-- `gitsigns.nvim` using vim.pack
--
-- Git integration for buffers
--
-- https://github.com/lewis6991/gitsigns.nvim
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo("lewis6991", "gitsigns.nvim")
})

--- Setup ---
require("gitsigns").setup({})
