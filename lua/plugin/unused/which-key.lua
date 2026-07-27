-- `which-key.nvim` using vim.pack
--
-- https://github.com/folke/which-key.nvim
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo("folke/which-key.nvim")
})

--- Setup ---
require("which-key").setup({
  preset = "helix",
  triggers = {
    { "<auto>", mode = "nixsotc" },
    { "t",      mode = { "n" } },
    { "b",      mode = { "n" } },
    { "s",      mode = { "n", "x" } },
  }
})
