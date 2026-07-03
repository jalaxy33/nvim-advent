-- `bufferline.nvim` using vim.pack

vim.pack.add({
  'https://github.com/akinsho/bufferline.nvim'
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
