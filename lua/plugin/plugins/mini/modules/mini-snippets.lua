-- `mini.snippets`  |  Manage and expand snippets
--
-- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-snippets.md
--

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



