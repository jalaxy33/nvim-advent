-- `blink.cmp` using vim.pack
--
-- https://github.com/saghen/blink.cmp
--

-- early return when using native_autocomplete
if vim.g.native_autocomplete then return end

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo('saghen/blink.lib'),
  get_repo('saghen/blink.cmp'),
})

--- Setup ---

-- lazy load on first insert mode entry (may not necessary)
local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = group,
  once = true,
  callback = function()
    local cmp = require("blink.cmp")
    cmp.build():pwait()
    cmp.setup({
      completion = {
        trigger = { show_on_insert = true, },
        ghost_text = { enabled = true },
        documentation = { auto_show = true, },
      },
      signature = { enabled = true, },
    })
  end,
})
