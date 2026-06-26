-- `mini.nvim` using vim.pack
--
--  A library of 45+ independent lua modules like statusline.
--
local M = {}

M.setup = function()
  vim.pack.add({
    -- 'https://github.com/nvim-mini/mini.statusline',
    'https://github.com/nvim-mini/mini.nvim'
  })

  -- statusline
  require('mini.statusline').setup()
end

return M
