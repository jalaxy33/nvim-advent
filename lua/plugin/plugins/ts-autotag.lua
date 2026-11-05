-- `nvim-ts-autotag` using vim.pack
--
-- Auto close and auto rename html/xml tags while typing.
--
-- https://github.com/windwp/nvim-ts-autotag
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo("windwp/nvim-ts-autotag")
})

--- Setup ---
-- Auto close/rename works for html and for raw html inside markdown,
-- `markdown` is aliased to the `html` tag config by the plugin itself.
require("nvim-ts-autotag").setup({})
