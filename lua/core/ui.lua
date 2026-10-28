-- core/ui.lua
--
-- Editor UI settings
--

-- color theme
vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin") -- built-in color theme

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

-- ===================================
-- Split separators
-- ===================================

-- Catppuccin colors WinSeparator close to the background, so splits are
-- invisible. Derive the color from Normal fg/bg instead: it follows any
-- colorscheme and both 'background' values.
local function update_winseparator()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  local dark = vim.o.background == "dark"
  local fg = normal.fg or (dark and 0xcdd6f4 or 0x4c4f69)
  local bg = normal.bg or (dark and 0x1e1e2e or 0xeff1f5)

  -- blend fg into bg, t = weight of fg (higher = more visible)
  local function mix(a, b, t)
    local out = 0
    for _, shift in ipairs({ 16, 8, 0 }) do
      local ca = math.floor(a / 2 ^ shift) % 256
      local cb = math.floor(b / 2 ^ shift) % 256
      out = out + math.floor(ca * t + cb * (1 - t)) * 2 ^ shift
    end
    return out
  end

  vim.api.nvim_set_hl(0, "WinSeparator", { fg = mix(fg, bg, 0.30) })
end

update_winseparator()
vim.api.nvim_create_autocmd("ColorScheme", { callback = update_winseparator })
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = update_winseparator,
})
