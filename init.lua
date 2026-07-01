-- ===================================
-- UI
-- ===================================

require("core.ui")

-- ===================================
-- Options & Global Variables
-- ===================================

require("core.options") -- load general options

-- ===================================
-- Keymaps
-- ===================================

require("core.keymaps") -- load general keymaps settings

-- ===================================
-- Auto Commands
-- ===================================

require("core.autocmds")

-- ===================================
-- Plugins
-- ===================================

vim.g.use_lazy = false
if vim.g.use_lazy then
  require("plugins.lazy") -- use `lazy.nvim` as package manager
else
  require("plugins.pack") -- use `vim.pack` as package manager (v0.12)
end

-- enable built-in plugins (v0.12)
vim.cmd("packadd nvim.undotree") -- `:Undotree`
vim.cmd("packadd nvim.difftool") -- `:DiffTool {left} {right}`


-- ===================================
-- LSP
-- ===================================

require("core.lsp") -- setup LSP servers
