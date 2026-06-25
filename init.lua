-- ~/.config/nvim/init.lua
--
-- Reference:
--    https://www.youtube.com/watch?v=lljs_7xB7Ps
--    https://www.youtube.com/playlist?list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM
--    https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua


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

