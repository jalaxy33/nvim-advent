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
--
-- You could check whether you're using Mason-installed binaries by:
--
--    :lua print(vim.fn.exepath('tree-sitter'))  -- check which `tree-sitter-cli` you are using
--


vim.pack.add({
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
})

if vim.g.mason_lsp_autoenable then
  vim.pack.add({ 'https://github.com/mason-org/mason-lspconfig.nvim' })
end


--- set auto-installed LSP ---
local ensure_installed = {
  'tree-sitter-cli',
  'lua-language-server',
  'efm',
  'basics-language-server',
  'prettierd',
}

if vim.fn.has('unix') then -- only auto-install in Linux/MacOS
  ensure_installed = vim.list_extend(ensure_installed, {
    'shfmt',
  })
end


--- Setup ---
require("mason").setup({})
require("mason-tool-installer").setup({
  ensure_installed = ensure_installed,
})

if vim.g.mason_lsp_autoenable then
  require("mason-lspconfig").setup({
    -- automatically set `vim.lsp.enable()`
    automatic_enable = true,
  })
end


-- Keymaps --
vim.keymap.set('n', "<leader>ms", "<cmd>Mason<CR>", { desc = "Open Mason LSP Installer" })
vim.keymap.set('n', "<leader>mu", "<cmd>MasonUpdate<CR>", { desc = "Update all Mason-managed LSP" })
