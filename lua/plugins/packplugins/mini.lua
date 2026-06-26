-- `mini.nvim` using vim.pack
local M = {}

M.setup = function()
  vim.pack.add({
    'https://github.com/nvim-mini/mini.nvim'
  })

  -- statusline
  require('mini.statusline').setup()
end

return M
