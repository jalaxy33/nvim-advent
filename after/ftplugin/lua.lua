-- settings for lua (.lua)

-- ===========================================
-- Options
-- ===========================================
vim.opt_local.tabstop = 2 -- tabwidth
vim.opt_local.shiftwidth = 2 -- indent width
vim.opt_local.softtabstop = 2

-- ===========================================
-- Keymaps
-- ===========================================

-- Run lua scripts
vim.keymap.set("n", "<leader>X", "<cmd>source %<cr>", { desc = "Run entire lua file" })
vim.keymap.set("n", "<leader>x", ":.lua<cr>", { desc = "Run one lua line" })
vim.keymap.set("v", "<leader>x", ":lua<cr>", { desc = "Run one lua line" })
