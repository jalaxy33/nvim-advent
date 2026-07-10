-- `mason.nvim` using vim.pack
--
-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
--
-- New Commands:
--  :Mason                        - opens a graphical status window
--  :MasonUpdate                  - updates all managed registries
--  :MasonInstall <package> ...   - installs/re-installs the provided packages
--  :MasonUninstall <package> ... - uninstalls the provided packages
--  :MasonUninstallAll            - uninstalls all packages
--  :MasonLog                     - opens the mason.nvim log file in a new tab window

vim.pack.add({
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
})

--- Setup ---
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
  },
})

-- Keymaps --
vim.keymap.set('n', "<leader>ms", "<cmd>Mason<CR>", { desc = "Open Mason LSP Installer" })
