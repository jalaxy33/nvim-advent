print("Advent of neovim")

--
-- Keymaps
--

-- Run lua scripts
vim.keymap.set("n", "<space><space>x", "<cmd>source %<cr>")
vim.keymap.set("n", "<space>x", ":.lua<cr>")
vim.keymap.set("v", "<space>x", ":lua<cr>")

--
-- Auto Commands
--

-- Highlight when yanking (copying) text
--   Try it with `yap` in normal mode
--   See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
