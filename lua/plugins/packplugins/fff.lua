-- `fff.nvim` using vim.pack
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
local M = {}

M.setup = function()
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

  -- options
  require("fff").setup({})

  -- keymaps
  vim.keymap.set('n', '<leader>ff', function() require('fff').find_files() end, { desc = 'FFFind files' })
  vim.keymap.set('n', '<leader>fg', function() require('fff').live_grep() end, { desc = 'FFFind Live Grep' })
end

return M
