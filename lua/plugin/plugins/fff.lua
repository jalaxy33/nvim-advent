-- `fff.nvim` using vim.pack
--
-- Fuzzy finder, extremely fast.
--
-- New commands
--  `:FFFScan`                            - Rescan files.
--  `:FFFRefreshGit`                      - Refresh git status.
--  `:FFFClearCache [all|frecency|files]` - Clear caches
--  `:FFFHealth`                          - Health check
--  `:FFFDebug [on|off|toggle]`           - Toggle the scoring display.
--  `:FFFOpenLog`                         - Open `~/.local/state/nvim/log/fff.log`
--
-- If failed on first run, run the following command manually:
--
--  :lua require('fff.download').download_or_build_binary()
--

vim.pack.add({
  'https://github.com/dmtrKovalenko/fff.nvim'
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('fff.nvim') end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

--- Setup ---
require("fff").setup({})

--- Keymaps ---
local FFF = require("fff")

vim.keymap.set('n', '<leader>ff', function() FFF.find_files() end, { desc = 'FFFind files' })
vim.keymap.set('n', '<leader>fg', function() FFF.live_grep() end, { desc = 'LiFFFe Grep' })
vim.keymap.set('n', '<leader>fz',
  function() FFF.live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end, { desc = 'Live fffuzy Grep' })
vim.keymap.set({ 'n', 'x' }, '<leader>fw', function() FFF.live_grep_under_cursor() end,
  { desc = 'Search current word / selection' })


--- Autocmds ---

-- Temporarily disable builtin autocomplete in FFF ui (which is annoying)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'fff_input',
  callback = function(ev)
    if vim.fn.exists('&autocomplete') ~= 1 then return end -- skip if option is unavailable
    local saved = vim.o.autocomplete
    vim.o.autocomplete = false
    vim.api.nvim_create_autocmd('BufWipeout', {
      buffer = ev.buf,
      once = true,
      callback = function()
        vim.o.autocomplete = saved
      end,
    })
  end,
})
