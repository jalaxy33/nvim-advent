-- `mini.nvim` using vim.pack
--
--  A library of 45+ independent lua modules like statusline.
--

vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',

  -- optional dependencies for `mini.snippets`
  'https://github.com/rafamadriz/friendly-snippets',
})


local module_dir = "plugin.plugins.mini.modules"

--- Helper Functions ---

local function load_module(name)
  require(module_dir .. "." .. name)
end


--- Setup ---

-- statusline
require('mini.statusline').setup()

-- autopairs
require("mini.pairs").setup()

-- extend a/i behaviors
require("mini.ai").setup()

-- command line completion
require("mini.cmdline").setup({
  autocorrect = { enable = false },
})

-- surround actions (starts with 's')
require('mini.surround').setup()

-- highlighting of word under cursor
require('mini.cursorword').setup()

-- Show indent scope
require('mini.indentscope').setup()

-- icons
load_module("mini-icons")

-- TODO highlight
load_module("mini-hipatterns")

-- completion & signature help
if not vim.g.native_autocomplete then
  load_module("mini-completion")
end

-- snippets
load_module("mini-snippets")

-- which-key (Show next key clues)
load_module("mini-clue")
