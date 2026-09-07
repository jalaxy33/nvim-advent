-- `blink.cmp` using vim.pack
--
-- https://github.com/saghen/blink.cmp
--

-- early return when using native_autocomplete
if vim.g.native_autocomplete then return end

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

if vim.fn.executable("cargo") == 1 then
  -- cargo exist -> use v2
  vim.pack.add({
    get_repo('saghen/blink.lib'),
    get_repo('saghen/blink.cmp'),
  })
else
  -- cargo not exist -> fallback to v1
  vim.pack.add({
    {
      src = get_repo('saghen/blink.cmp'),
      version = vim.version.range("^1"),
    }
  })
end


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
