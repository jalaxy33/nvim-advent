-- `<PLUGIN>` using vim.pack
--
-- https://github.com/REPO_NAME
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo('REPO_NAME')
})

--- Setup ---
require("<PLUGIN>").setup({})
