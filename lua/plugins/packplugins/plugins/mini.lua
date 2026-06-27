-- `mini.nvim` using vim.pack
--
--  A library of 45+ independent lua modules like statusline.
--

vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim'
})

-- statusline
require('mini.statusline').setup({})
