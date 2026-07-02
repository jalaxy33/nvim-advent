-- `mini.nvim` using vim.pack
--
--  A library of 45+ independent lua modules like statusline.
--

vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim'
})


--- Setup ---

-- statusline
require('mini.statusline').setup({})

-- autopairs
require("mini.pairs").setup({})

-- icons
local Icons = require('mini.icons')
Icons.setup({})
Icons.mock_nvim_web_devicons() -- apply to plugins like `neo-tree`

-- completion & signature help
if not vim.g.native_autocomplete then
  require("mini.completion").setup({})
end
