-- `neo-tree.nvim` using vim.pack
--
--  Tree-style file browser.
--
--  New commands:
--    `:Neotree`
--
--  How to show icons:
--  1. Install `nvim-tree/nvim-web-devicons` plugin.
--  2. Install `mini.icons` (provided by `mini.nvim`). Then setup:
--    require('mini.icons').setup({})
--    require('mini.icons').mock_nvim_web_devicons()
--

vim.pack.add({
  {
    src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = vim.version.range("3"),
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
})

--- Setup ---
require("neo-tree").setup({
  window = { width = 35 },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_ignored = false,
      hide_hidden = false,
    },
  },
})

--- Keymaps ---
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
