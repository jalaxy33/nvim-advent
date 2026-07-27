-- `<PLUGIN>` using vim.pack
--
-- https://github.com/REPO_OWNER/REPO_NAME
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo('REPO_OWNER', 'REPO_NAME')
})

--- Setup ---
require("<PLUGIN>").setup({})
