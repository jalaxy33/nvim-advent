-- core/ui.lua
--
-- Editor UI settings
--

-- color theme
vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin")  -- built-in color theme

-- enable experimental `ui2` (v0.12)
--  hit `g<` to jump into message buffer
require('vim._core.ui2').enable({
  enable = true, -- Whether to enable or disable the UI
  -- msg = {
  --   target = "cmd",
  --   paper = { height = 0.5 },
  --   dialog = { height = 0.5 },
  --   cmd = { height = 0.5 },
  --   msg = { height = 0.5 },
  -- }
})
