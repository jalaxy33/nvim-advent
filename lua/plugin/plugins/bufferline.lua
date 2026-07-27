-- `bufferline.nvim` using vim.pack
--
-- https://github.com/akinsho/bufferline.nvim
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo("akinsho/bufferline.nvim")
})

--- Setup ---
vim.opt.termguicolors = true
require("bufferline").setup({
  options = {
    mode = "buffers",
    right_mouse_command = false,
    middle_mouse_command = "bdelete! %d",
    always_show_bufferline = false,
  }
})
