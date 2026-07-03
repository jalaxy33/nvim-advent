-- `toggleterm.nvim` using vim.pack

vim.pack.add({
  'https://github.com/akinsho/toggleterm.nvim'
})

--- Setup ---
require("toggleterm").setup({
  open_mapping = "<C-`>",    -- you could set toggle keymap here
})

-- ===================================
-- Helper
-- ===================================
local Terminal = require('toggleterm.terminal').Terminal

-- normal terminal
local term = Terminal:new({
  direction = "horizontal",
  -- function to run on opening the terminal
  on_open = function(_term)
    vim.cmd("startinsert!")
  end,
  -- function to run on closing the terminal
  on_close = function(_term)
    vim.cmd("startinsert!")
  end,
})

-- floating terminal
local term_float = Terminal:new({
  direction = "float",
  -- function to run on opening the terminal
  on_open = function(_term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(_term.bufnr, "n", "<esc>", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(_term)
    vim.cmd("startinsert!")
  end,

})

-- lazygit
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(_term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(_term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(_term)
    vim.cmd("startinsert!")
  end,
})


-- ===================================
-- Keymaps
-- ===================================

-- vim.keymap.set({ 'n', 'x' }, "<C-`>", function() term:toggle() end, { desc = "Toggle Terminal" })
vim.keymap.set({ 'n', 'x' }, "<leader>`", function() term_float:toggle() end, { desc = "Toggle Floating Terminal" })
vim.keymap.set("n", "<leader>g", function() lazygit:toggle() end, { noremap = true, desc = "Toggle Lazygit" })
