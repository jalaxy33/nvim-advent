-- `neo-tree.nvim` using vim.pack
--
--  Tree-style file browser.
--
--  https://github.com/nvim-neo-tree/neo-tree.nvim
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

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  {
    src = get_repo("nvim-neo-tree/neo-tree.nvim"),
    version = vim.version.range("3"),
  },
  -- dependencies
  get_repo("nvim-lua/plenary.nvim"),
  get_repo("MunifTanjim/nui.nvim"),
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
vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal toggle<cr>", { desc = "Toggle Neotree" })
