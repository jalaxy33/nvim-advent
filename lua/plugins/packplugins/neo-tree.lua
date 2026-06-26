-- `neo-tree` using vim.pack
--
--  New commands:
--    `:Neotree`
--
local M = {}

M.setup = function()
	vim.pack.add({
		{
			src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
			version = vim.version.range("3"),
		},
		-- dependencies
		"https://github.com/nvim-lua/plenary.nvim",
		"https://github.com/MunifTanjim/nui.nvim",
		-- optional, but recommended
		--"https://github.com/nvim-tree/nvim-web-devicons",
	})

  -- options
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

  -- keymaps
  vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })

end

return M
