-- `mini.nvim` using vim.pack
--
--  A library of 45+ independent lua modules like statusline.
--

vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',

  -- optional dependencies for `mini.snippets`
  'https://github.com/rafamadriz/friendly-snippets',
})


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
require('mini.surround').setup()

-- highlighting of word under cursor
require('mini.cursorword').setup()

-- Show indent scope
require('mini.indentscope').setup()

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
  local mini_completion = require("mini.completion")
  mini_completion.setup()

  -- set completion capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities,
    mini_completion.get_lsp_capabilities()
  )
  vim.lsp.config('*', { capabilities = capabilities })
end


-- snippets
local mini_snippets = require('mini.snippets')
local gen_loader = mini_snippets.gen_loader

mini_snippets.setup({
  snippets = { gen_loader.from_lang() },

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Expand snippet at cursor position. Created globally in Insert mode.
    expand = '<C-j>',

    -- Interact with default `expand.insert` session.
    -- Created for the duration of active session(s)
    jump_next = '<C-l>',
    jump_prev = '<C-h>',
    stop = '<C-c>',
  },

  -- Functions describing snippet expansion. If `nil`, default values
  -- are `MiniSnippets.default_<field>()`.
  expand = {
    -- Resolve raw config snippets at context
    prepare = nil,

    -- Match resolved snippets at cursor position
    match = nil,

    -- Possibly choose among matched snippets
    select = nil,

    -- Insert selected snippet
    insert = function(snippet) -- get rid of annoying snippet tabstops
      return mini_snippets.default_insert(snippet, {
        empty_tabstop = '',
        empty_tabstop_final = '',
      })
    end,
  },
})


-- miniclue (which-key)
local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = { 'n', 'x' }, keys = '<Leader>' },

    -- `[` and `]` keys
    { mode = 'n',          keys = '[' },
    { mode = 'n',          keys = ']' },

    -- Built-in completion
    { mode = 'i',          keys = '<C-x>' },

    -- `g` key
    { mode = { 'n', 'x' }, keys = 'g' },

    -- Marks
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },

    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },

    -- Window commands
    { mode = 'n',          keys = '<C-w>' },

    -- `z` key
    { mode = { 'n', 'x' }, keys = 'z' },

    -- insert mode
    { mode = { 'i' },      keys = '<C-x>' }
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },

  window = {
    delay = 250,
  }
})
