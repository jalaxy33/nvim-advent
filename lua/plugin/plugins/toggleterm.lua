-- `toggleterm.nvim` using vim.pack

vim.pack.add({
  'https://github.com/akinsho/toggleterm.nvim'
})

--- Setup ---
require("toggleterm").setup({
  -- open_mapping = "<C-`>",    -- you could set toggle keymap here
})

-- ===================================
-- Helper Functions
-- ===================================

-- toggle lazygit
local function toggle_lazygit()
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
  })

  lazygit:toggle()
end


-- ===================================
-- Keymaps
-- ===================================

vim.keymap.set({ 'n', 'x' }, "<C-`>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Terminal" })
vim.keymap.set({ 'n', 'x' }, "<leader>`", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Floating Terminal" })

vim.keymap.set("n", "<leader>g", toggle_lazygit, { noremap = true, desc = "Toggle Lazygit" })
