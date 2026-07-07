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

-- extend a/i behaviors
require("mini.ai").setup({})

-- surround actions (starts with s)
--  add surround: `sa`
--  delete surround: `sd`
--  replace surround: `sr`
--  find surround: `sf` or `sF` (right or left)
--  highlight surround: `sh`
--
-- After above actions:
--  `f` - function call
--  `t` - tag
--  `?` - interative
require('mini.surround').setup({})

-- highlighting of word under cursor
require('mini.cursorword').setup({})

-- Show indent scope
require('mini.indentscope').setup({})

-- icons
local Icons = require('mini.icons')
Icons.setup({})
Icons.mock_nvim_web_devicons() -- apply to plugins like `neo-tree`

-- TODO highlight
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})


-- completion & signature help
if not vim.g.native_autocomplete then
  require("mini.completion").setup({})
end
