-- color theme
vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin")

-- enable experimental `ui2` (v0.12)
--require('vim._core.ui2').enable()

-- enable built-in plugins (v0.12)
vim.cmd("packadd nvim.undotree")  -- `:Undotree`
vim.cmd("packadd nvim.difftool")  -- `:DiffTool {left} {right}`

-- ===========================================
-- Options
-- ===========================================

require("config.options")  -- load general options

-- ===========================================
-- Keymaps
-- ===========================================

require("config.keymaps")  -- load general keymaps settings

-- ===========================================
-- Auto Commands
-- ===========================================

require("config.autocmds")

-- ===========================================
-- Plugins
-- ===========================================

local USE_LAZY = false
if USE_LAZY then
  require("plugins.lazy")  -- use `lazy.nvim` as package manager
else
  require("plugins.pack")  -- use `vim.pack` as package manager
end
