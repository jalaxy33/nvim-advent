-- `blink.cmp` using vim.pack
--
-- https://github.com/saghen/blink.cmp
--

-- early return when disable or unable to use
if vim.g.native_autocomplete then return end
if vim.fn.executable("cargo") == 0 then
  vim.g.s_autocomplete_fallback = true
  return
end


--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo('saghen/blink.lib'),
  get_repo('saghen/blink.cmp'),
})


--- Setup ---
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
