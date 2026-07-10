-- `live-preview` using vim.pack
--
-- View Markdown, HTML, SVG and more in web browser with live updates.
--
-- One of the following picker plugins is needed: `telescope.nvim`, `fzf-lua`, `mini.pick`, `snacks.nvim`
--
-- New Commands:
--    :LivePreview
--

vim.pack.add({
  'https://github.com/brianhuster/live-preview.nvim'
})

--- Setup ---
require("live-preview").setup({})


--- Keymaps ---

vim.keymap.set('n', "<leader>pp", "<cmd>LivePreview pick<CR>", { desc = "Live Preview" })
vim.keymap.set('n', "<leader>px", "<cmd>LivePreview close<CR>", { desc = "Live Preview: close" })
