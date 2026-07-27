-- `live-preview` using vim.pack
--
-- View Markdown, HTML, SVG and more in web browser with live updates.
--
-- https://github.com/brianhuster/live-preview.nvim
--
-- One of the following picker plugins is needed: `telescope.nvim`, `fzf-lua`, `mini.pick`, `snacks.nvim`
--
-- New Commands:
--    :LivePreview
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo("brianhuster", "live-preview.nvim")
})

--- Setup ---
require("live-preview").setup({})


--- Keymaps ---

vim.keymap.set('n', "<leader>pp", "<cmd>LivePreview pick<CR>", { desc = "Live Preview" })
vim.keymap.set('n', "<leader>px", "<cmd>LivePreview close<CR>", { desc = "Live Preview: close" })
